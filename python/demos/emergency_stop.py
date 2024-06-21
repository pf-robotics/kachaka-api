#!/usr/bin/env python3


from __future__ import annotations

import argparse
import asyncio

from kachaka_api.aio import KachakaApiClient  # noqa: E402


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="import map data from file")

    parser.add_argument(
        "--ip_address",
        type=str,
        help="IP Address of Kachaka",
    )
    return parser.parse_args()


async def main() -> None:
    args = parse_args()

    client = (
        KachakaApiClient()
        if args.ip_address is None
        else KachakaApiClient(f"{args.ip_address}:26400")
    )

    result = await client.set_emergency_stop()
    print(f"emergency stopped: {result}")


if __name__ == "__main__":
    asyncio.run(main())
