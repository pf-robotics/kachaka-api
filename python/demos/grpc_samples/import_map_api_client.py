#!/usr/bin/env python3

# Usage:
#  import_map_api_client.py -s XX.XX.XX.XX:26400 -k XXXXXXXXXXXXXXXXXXXXXXXX -i out.profile

import argparse
from typing import Iterator

import grpc
import kachaka_api_pb2
import kachaka_api_pb2_grpc


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Export a map from the Baku server"
    )
    parser.add_argument("--server_address", "-s", type=str, required=True)
    parser.add_argument("--input_path", "-i", type=str, required=True)
    return parser.parse_args()


def import_map(
    stub: kachaka_api_pb2_grpc.KachakaApiStub, input_path: str
) -> bool:
    print(f"Importing map: {input_path}")
    with open(input_path, "rb") as fin:

        def request_messages() -> Iterator[kachaka_api_pb2.ImportMapRequest]:
            while True:
                data = fin.read(64 * 1024)
                if not data:
                    break
                yield kachaka_api_pb2.ImportMapRequest(data=data)

        response = stub.ImportMap(request_messages())
        if response.result.success:
            print(f"Map imported: {response.map_id}")
            return True
        else:
            print(
                f"Map import failed (code={response.result.error_code}): {response.result.message}"
            )
            return False


def main() -> None:
    args = parse_args()

    channel = grpc.insecure_channel(args.server_address)
    stub = kachaka_api_pb2_grpc.KachakaApiStub(channel)
    import_map(stub, args.input_path)


if __name__ == "__main__":
    main()
