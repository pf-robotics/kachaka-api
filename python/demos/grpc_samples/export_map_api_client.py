#!/usr/bin/env python3

# Usage:
#  export_map_api_client.py -s XX.XX.XX.XX:26400 -m XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX -o out.profile

import grpc
import kachaka_api_pb2
import kachaka_api_pb2_grpc
import argparse


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Export a map from the Baku server")
    parser.add_argument("--server_address", "-s", type=str, required=True)
    parser.add_argument("--map_id", "-m", type=str, required=True)
    parser.add_argument("--output_path", "-o", type=str, required=True)
    return parser.parse_args()


def export_map(
    stub: kachaka_api_pb2_grpc.KachakaApiStub,
    map_id: str,
    export_path: str,
) -> bool:
    print("Exporting map: {}".format(map_id))
    with open(export_path, "wb") as fout:
        stream = stub.ExportMap(kachaka_api_pb2.ExportMapRequest(map_id=map_id))
        for response in stream:
            if response.HasField("end_of_stream"):
                print()
                if response.end_of_stream.result.success:
                    print(f"Map exported successfully as {export_path}")
                    return True
                else:
                    print(
                        f"Error exporting map (code={response.end_of_stream.result.error_code}): {response.end_of_stream.result.message}"
                    )
                    return False
            elif response.HasField("middle_of_stream"):
                fout.write(response.middle_of_stream.data)
                print(".", end="");
            else:
                print("Received invalid response")
                return False
    print("Map export failed unexpectedly")
    return False


def main() -> None:
    args = parse_args()

    channel = grpc.insecure_channel(args.server_address)
    stub = kachaka_api_pb2_grpc.KachakaApiStub(channel)
    export_map(stub, args.map_id, args.output_path)


if __name__ == "__main__":
    main()
