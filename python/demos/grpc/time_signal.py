# 時報サンプル

import datetime
import sys
import time

import grpc
import kachaka_api_pb2
import schedule
from kachaka_api_pb2_grpc import KachakaApiStub

stub = KachakaApiStub(grpc.insecure_channel(sys.argv[1]))


def speak(speak_text: str) -> None:
    print(f"speak: {speak_text}")
    req = kachaka_api_pb2.StartCommandRequest(
        command=kachaka_api_pb2.Command(
            speak_command=kachaka_api_pb2.SpeakCommand(text=speak_text)
        )
    )

    resp = stub.StartCommand(req)
    if not resp.result.success:
        print("Sending speak command failed: " + resp.result.error_code)
        return
    print("Speak command sent")


def time_signal() -> None:
    now = datetime.datetime.now()
    if now.minute == 0:
        text = f"カチャカです。{now.hour}時をお知らせします。"
    else:
        text = f"カチャカです。{now.hour}時{now.minute}分をお知らせします。"
    speak(text)


print("start time_signal")
speak("時報を起動します")

schedule.every().minute.at(":00").do(time_signal)

while True:
    schedule.run_pending()
    time.sleep(1)
