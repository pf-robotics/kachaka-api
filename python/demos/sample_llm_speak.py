# Usage: OPENAI_API_KEY="...." python3 sample_llm_speak.py 100.94.1.1:26400

from __future__ import annotations

import asyncio
import datetime
import os
import sys
from dataclasses import dataclass
from typing import Optional

import openai

sys.path.append(os.path.dirname(os.path.abspath(__file__)) + "/../")

from kachaka_api import (  # noqa: E402
    CommandTextFormatter,
    ShelfLocationResolver,
    pb2,
)
from kachaka_api.aio import KachakaApiClient  # noqa: E402


@dataclass
class KachakaCommandRecord:
    command_id: str
    date: str
    description: str
    result: str
    kachaka_response: Optional[str]


async def gen_history_text(
    client: KachakaApiClient,
    formatter: CommandTextFormatter,
) -> list[KachakaCommandRecord]:
    histories = await client.get_history_list()
    print("-------------------")
    out = []
    for history in histories:
        dt = datetime.datetime.fromtimestamp(history.command_executed_time)
        description = formatter.gen_command_text(history.command)
        if history.success:
            result = "成功"
        else:
            result = "失敗"
        out.append(
            KachakaCommandRecord(
                history.id,
                f"{dt.year}年{dt.month:02d}年{dt.day:02d}日 {dt.hour:02d}時{dt.minute:02d}分",
                description,
                result,
                "",
            )
        )
    return out


def ask_chatgpt(system: str, prompt: str) -> str:
    result = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[
            {"role": "system", "content": system},
            {"role": "user", "content": prompt},
        ],
    )
    return result["choices"][0]["message"]["content"]


def generate_speak_text(history: list[KachakaCommandRecord]) -> str:
    prompt = f"カチャカが、{history[0].description}するのに{history[0].result}しました。これを受けて、なにかセリフを20文字以内で喋って下さい。特に成功した場合は、何を実現したかが簡潔に表現されると良いですが常にそうである必要はありません。50％は履歴に応じた会話とし、40％はお片付けや収納などのTipsを、10％は今日の日付に関する蘊蓄を喋ってください。なお、これまでの履歴を以下に示します。\n\n"
    history = history[1 : min(10, len(history))]
    prompt += "\n".join(
        [
            (
                f"{h.date}, {h.description}, {h.result}, カチャカの言ったセリフ={h.kachaka_response}"
                if h.kachaka_response
                else f"{h.date} {h.description} {h.result}"
            )
            for h in history
        ]
    )
    text = ask_chatgpt(
        "あなたは家やオフィスの中で専用家具を運ぶロボット「カチャカ」です。性別は中性。家具やものを運ぶことを喜び、ちょっとしたセリフで人々を楽しませたいと思っています。性格は穏やかで、人に興味を持っています。自分の話よりも、使ってくれた人のことを気遣うことを話します。",
        prompt,
    )
    return text


async def main() -> None:
    client = KachakaApiClient()
    resolver = ShelfLocationResolver(client)
    formatter = CommandTextFormatter(resolver)

    state, command = await client.get_command_state()
    skip = state != pb2.CommandState.COMMAND_STATE_RUNNING

    async def on_shelves(shelves: list[pb2.Shelf]) -> None:
        resolver.set_shelves(shelves)

    async def on_locations(locations: list[pb2.Location]) -> None:
        resolver.set_locations(locations)

    async def on_command_result(result, command):
        nonlocal skip
        if skip:
            print("command result before this script launched was skipped")
            skip = False
        if command.HasField("speak_command"):
            return

        await asyncio.sleep(1)
        history = await gen_history_text(client, formatter)
        text = generate_speak_text(history)
        print(text)
        await client.speak(text)

    client.set_shelves_callback(on_shelves)
    client.set_locations_callback(on_locations)
    client.set_last_command_result_callback(on_command_result)

    # Wait for completion (PENDING state)
    while True:
        await asyncio.sleep(1)


if __name__ == "__main__":
    asyncio.run(main())
