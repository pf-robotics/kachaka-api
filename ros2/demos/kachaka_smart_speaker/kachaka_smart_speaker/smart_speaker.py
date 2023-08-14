import os
import sys

import paho.mqtt.client as mqtt
import rclpy
from kachaka_interfaces.action import ExecKachakaCommand
from kachaka_interfaces.msg import KachakaCommand
from rclpy.action import ActionClient
from rclpy.node import Node

CHANNEL = "test"
RESOURCE = "sample"
PEM = "./mqtt.beebotte.com.pem"


class SmartSpeaker(Node):
    def __init__(self) -> None:
        super().__init__("smart_speaker")
        self._action_client = ActionClient(
            self,
            ExecKachakaCommand,
            "/kachaka/kachaka_command/execute",
        )
        self._action_client.wait_for_server()

        self._mqtt_client = mqtt.Client()
        self._mqtt_client.on_connect = self._on_connect
        self._mqtt_client.on_message = self._on_message

        try:
            token = os.environ["TOKEN"]
        except KeyError:
            self.get_logger().info("TOKEN is not set.")
            sys.exit()

        if not os.path.exists(PEM):
            self.get_logger().info(f"{PEM} file not found.")
            sys.exit()

        self._mqtt_client.username_pw_set(f"token:{token}")
        self._mqtt_client.tls_set(PEM)
        self._mqtt_client.connect("mqtt.beebotte.com", 8883, 60)
        self._mqtt_client.loop_start()

    def _on_connect(self, client, userdata, flag, rc):
        if rc == 0:
            self.get_logger().info("Connection succeeded.")
            client.subscribe(f"{CHANNEL}/{RESOURCE}", 1)
        else:
            self.get_logger().info("Connection failed. code=" + str(rc))

    def _on_message(self, client, data, msg):
        self.get_logger().info("on_message: " + str(msg.payload))
        self._send_shelf_frame()

    def _send_shelf_frame(self) -> None:
        command = KachakaCommand()
        command.command_type = KachakaCommand.MOVE_SHELF_COMMAND
        command.move_shelf_command_target_shelf_id = "S01"
        command.move_shelf_command_destination_location_id = "L01"
        command.move_shelf_command_undock_on_destination = False
        goal_msg = ExecKachakaCommand.Goal()
        goal_msg.kachaka_command = command
        self._action_client.send_goal_async(goal_msg)


def main(args=None):
    rclpy.init(args=args)
    smart_speaker = SmartSpeaker()
    rclpy.spin(smart_speaker)
    smart_speaker.destroy_node()
    rclpy.shutdown()


if __name__ == "__main__":
    main()
