#include <chrono>

#include <cv_bridge/cv_bridge.h>
#include <opencv2/dnn.hpp>
#include <rclcpp/rclcpp.hpp>
#include <sensor_msgs/msg/compressed_image.hpp>
#include <sensor_msgs/msg/image.hpp>

using namespace std::chrono_literals;
using std::placeholders::_1;

namespace {
static constexpr int kNumberOfParts = 22;
static constexpr int kNumberOfPairs = 20;
static constexpr int kHandPosePairs[20][2] = {
    {0, 1},  {1, 2},   {2, 3},   {3, 4},    // thumb
    {0, 5},  {5, 6},   {6, 7},   {7, 8},    // pinkie
    {0, 9},  {9, 10},  {10, 11}, {11, 12},  // middle
    {0, 13}, {13, 14}, {14, 15}, {15, 16},  // ring
    {0, 17}, {17, 18}, {18, 19}, {19, 20}   // small
};
static constexpr int kNetworkInputSizeX = 368;
static constexpr int kNetworkInputSizeY = 368;
static constexpr double kNetworkScaleFactor = 0.003922;
static constexpr double kDefaultConfidenceThreshold = 0.1;

}  // namespace

namespace kachaka_vision {

class HandRecognitionNode : public rclcpp::Node {
 public:
  HandRecognitionNode() : Node("hand_recognition_node") {
    this->declare_parameter("model_path", "");
    this->declare_parameter("model_config_path", "");
    this->declare_parameter("confidence_threshold",
                            kDefaultConfidenceThreshold);
    net_ =
        cv::dnn::readNet(this->get_parameter("model_path").as_string(),
                         this->get_parameter("model_config_path").as_string());
    net_.setPreferableBackend(cv::dnn::DNN_BACKEND_OPENCV);
    net_.setPreferableTarget(cv::dnn::DNN_TARGET_CPU);
    rclcpp::SensorDataQoS qos;
    pub_ = this->create_publisher<sensor_msgs::msg::Image>("output_image", 10);
    sub_ = this->create_subscription<sensor_msgs::msg::CompressedImage>(
        "image", qos, std::bind(&HandRecognitionNode::Callback, this, _1));
  }

 private:
  void Callback(const sensor_msgs::msg::CompressedImage::ConstSharedPtr msg) {
    try {
      cv::Mat cv_image = cv_bridge::toCvCopy(msg, "bgr8")->image;
      cv::Mat input_blob = cv::dnn::blobFromImage(
          cv_image, kNetworkScaleFactor,
          cv::Size(kNetworkInputSizeX, kNetworkInputSizeY), cv::Scalar(0, 0, 0),
          false, false);
      net_.setInput(input_blob);
      cv::Mat result = net_.forward();
      DrawResult(result, cv_image);

      sensor_msgs::msg::Image::SharedPtr out_msg;
      out_msg = cv_bridge::CvImage(msg->header, "bgr8", cv_image).toImageMsg();
      pub_->publish(*out_msg);
    } catch (const cv_bridge::Exception& e) {
      RCLCPP_ERROR(this->get_logger(), e.what());
    }
  }

  void DrawResult(cv::Mat& result, cv::Mat& image) {
    const int result_height = result.size[2];
    const int result_width = result.size[3];
    const float scale_x = static_cast<float>(image.cols) / result_width;
    const float scale_y = static_cast<float>(image.rows) / result_height;
    const double confidence_threshold =
        this->get_parameter("confidence_threshold").as_double();
    // find the position of parts
    std::vector<cv::Point> points(kNumberOfParts, cv::Point(-1, -1));
    for (int i_part = 0; i_part < kNumberOfParts; i_part++) {
      cv::Mat head_map(result_height, result_width, CV_32F,
                       result.ptr(0, i_part));
      cv::Point point;
      double confidence;
      cv::minMaxLoc(head_map, 0, &confidence, 0, &point);
      if (confidence > confidence_threshold) {
        points[i_part] = cv::Point(point.x * scale_x, point.y * scale_y);
      }
    }
    for (int i_pair = 0; i_pair < kNumberOfPairs; i_pair++) {
      const cv::Point2f& part1_point = points[kHandPosePairs[i_pair][0]];
      const cv::Point2f& part2_point = points[kHandPosePairs[i_pair][1]];
      if (part1_point.x == -1 || part2_point.x == -1) {
        continue;
      }
      // Draw connected line
      cv::line(image, part1_point, part2_point, cv::Scalar(0, 200, 0), 2);
      // Draw part's center
      cv::circle(image, part1_point, 3, cv::Scalar(0, 0, 200), -1);
      cv::circle(image, part2_point, 3, cv::Scalar(0, 0, 200), -1);
    }
  }

  cv::dnn::Net net_;
  rclcpp::Node::SharedPtr node_;
  rclcpp::Publisher<sensor_msgs::msg::Image>::SharedPtr pub_;
  rclcpp::Subscription<sensor_msgs::msg::CompressedImage>::SharedPtr sub_;
};

}  // namespace kachaka_vision

int main(int argc, char* argv[]) {
  rclcpp::init(argc, argv);
  rclcpp::spin(std::make_shared<kachaka_vision::HandRecognitionNode>());
  rclcpp::shutdown();
  return EXIT_SUCCESS;
}
