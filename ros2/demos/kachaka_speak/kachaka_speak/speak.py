import rclpy
from kachaka_interfaces.action import ExecKachakaCommand
from kachaka_interfaces.msg import KachakaCommand
from rclpy.action import ActionClient
from rclpy.node import Node


class Speak(Node):
    def __init__(self) -> None:
        super().__init__("speak")
        self._action_client = ActionClient(
            self, ExecKachakaCommand, "/kachaka/kachaka_command/execute"
        )
        self._action_client.wait_for_server()

    def send_goal(self):
        command = KachakaCommand()
        command.command_type = KachakaCommand.SPEAK_COMMAND
        command.speak_command_text = "こんにちは、カチャカです"
        goal_msg = ExecKachakaCommand.Goal()
        goal_msg.kachaka_command = command
        return self._action_client.send_goal_async(goal_msg)


def main(args=None):
    rclpy.init(args=args)

    speak = Speak()
    future = speak.send_goal()
    rclpy.spin_until_future_complete(speak, future)

    speak.destroy_node()
    rclpy.shutdown()


if __name__ == "__main__":
    main()
