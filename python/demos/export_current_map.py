#!/usr/bin/env python3

# カチャカが現在使用中の地図をエクスポートする実行形式のスクリプトのサンプルです。
# Usage: python3 export_map.py --ip_address <カチャカのIPアドレス> --output_dir <出力先ディレクトリ>

from __future__ import annotations

import argparse
import asyncio
import os
import sys

sys.path.append(os.path.dirname(os.path.abspath(__file__)) + "/../")

from kachaka_api.aio import KachakaApiClient  # noqa: E402


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="export map data to file")

    parser.add_argument(
        "--ip_address",
        type=str,
        help="IP Address of Kachaka",
    )
    parser.add_argument(
        "--output_dir",
        type=str,
        default=os.path.dirname(os.path.abspath(__file__)),
        help="output directory",
    )
    return parser.parse_args()


async def main() -> None:
    args = parse_args()

    client = (
        KachakaApiClient()
        if args.ip_address is None
        else KachakaApiClient(f"{args.ip_address}:26400")
    )

    serial_number = await client.get_robot_serial_number()
    current_map_id = await client.get_current_map_id()

    output_file_path = os.path.join(
        args.output_dir, f"kachaka_{serial_number}_map_{current_map_id}"
    )
    await client.export_map(current_map_id, output_file_path)


if __name__ == "__main__":
    asyncio.run(main())
