#!/usr/bin/env python3

# カチャカの地図をインポートする実行形式のスクリプトのサンプルです。
# Usage: python3 import_map.py --ip_address <カチャカのIPアドレス> --output_dir <出力先ディレクトリ>

from __future__ import annotations

import argparse
import asyncio
import os
import sys

sys.path.append(os.path.dirname(os.path.abspath(__file__)) + "/../")

from kachaka_api.aio import KachakaApiClient  # noqa: E402


def pares_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="import map data from file")

    parser.add_argument(
        "--ip_address",
        type=str,
        help="IP Address of Kachaka",
    )
    parser.add_argument(
        "--input_file",
        type=str,
        required=True,
        help="map data file path",
    )
    return parser.parse_args()


async def main() -> None:
    args = pares_args()

    client = (
        KachakaApiClient()
        if args.ip_address is None
        else KachakaApiClient(f"{args.ip_address}:26400")
    )

    result, map_id = await client.import_map(args.input_file)
    if result.success:
        print(f"map successfully imported. id: {map_id}")
    else:
        print(f"failed to import map. error code: {result.error_code}")


if __name__ == "__main__":
    asyncio.run(main())
