import { useCallback, useEffect, useState } from 'react'

import { type UnaryCall } from '@protobuf-ts/runtime-rpc'

import { type KachakaApiClient } from './protos/kachaka-api.client'
// eslint-disable-next-line import/no-duplicates
import { type GetRequest, type Metadata } from './protos/kachaka-api'
// eslint-disable-next-line import/no-duplicates
import type * as pb from './protos/kachaka-api'

function buildGetRequest(cursor: bigint): GetRequest {
  return {
    metadata: {
      cursor,
    },
  }
}

interface GetKachakaStateResponse {
  metadata?: Metadata
}

function useKachakaState<
  ResponseType extends GetKachakaStateResponse,
  StateType,
>(
  client: KachakaApiClient,
  rpc: (request: GetRequest) => UnaryCall<GetRequest, ResponseType>,
  filter: (response: ResponseType) => StateType | undefined,
): StateType | undefined {
  const [state, setState] = useState<StateType | undefined>(undefined)
  const [cursor, setCursor] = useState(BigInt(0))

  useEffect(() => {
    const f = async () => {
      try {
        const response = (await rpc(buildGetRequest(cursor)).response) as
          | ResponseType
          | undefined
        if (!response) {
          return
        }
        setState(filter(response))
        setCursor(response.metadata!.cursor)
      } catch (e) {
        console.log(e)
      }
    }
    f()
  }, [client, cursor, rpc, filter])

  return state
}

export function useRobotSerialNumber(client: KachakaApiClient) {
  return useKachakaState<pb.GetRobotSerialNumberResponse, string>(
    client,
    (request) => client.getRobotSerialNumber(request),
    (response) => response.serialNumber,
  )
}

export function useRobotVersion(client: KachakaApiClient) {
  return useKachakaState<pb.GetRobotVersionResponse, string>(
    client,
    (request) => client.getRobotVersion(request),
    (response) => response.version,
  )
}

export function useRobotPose(client: KachakaApiClient) {
  return useKachakaState<pb.GetRobotPoseResponse, number[]>(
    client,
    (request) => client.getRobotPose(request),
    (response) => {
      const pose = response.pose
      return pose && [pose.x, pose.y, pose.theta]
    },
  )
}

export function useMap(client: KachakaApiClient) {
  return useKachakaState<pb.GetPngMapResponse, pb.Map>(
    client,
    (request) => client.getPngMap(request),
    (response) => response.map,
  )
}

export function useObjectDetection(client: KachakaApiClient) {
  return useKachakaState<pb.GetObjectDetectionResponse, pb.ObjectDetection[]>(
    client,
    (request) => client.getObjectDetection(request),
    (response) => response.objects,
  )
}

export function useImu(client: KachakaApiClient) {
  return useKachakaState<pb.GetRosImuResponse, pb.RosImu>(
    client,
    (request) => client.getRosImu(request),
    (response) => response.imu,
  )
}

export function useOdometry(client: KachakaApiClient) {
  return useKachakaState<pb.GetRosOdometryResponse, pb.RosOdometry>(
    client,
    (request) => client.getRosOdometry(request),
    (response) => response.odometry,
  )
}

export function useLaserScan(client: KachakaApiClient) {
  return useKachakaState<pb.GetRosLaserScanResponse, pb.RosLaserScan>(
    client,
    (request) => client.getRosLaserScan(request),
    (response) => response.scan,
  )
}

export function useFrontCameraInfo(client: KachakaApiClient) {
  return useKachakaState<
    pb.GetFrontCameraRosCameraInfoResponse,
    pb.RosCameraInfo
  >(
    client,
    (request) => client.getFrontCameraRosCameraInfo(request),
    (response) => response.cameraInfo,
  )
}

export function useFrontCameraImage(client: KachakaApiClient) {
  return useKachakaState<pb.GetFrontCameraRosImageResponse, pb.RosImage>(
    client,
    (request) => client.getFrontCameraRosImage(request),
    (response) => response.image,
  )
}

export function useStartCommand(
  client: KachakaApiClient,
  resultCallcack?: (result: pb.Result) => void,
) {
  const callback = useCallback(
    (
      command: pb.Command,
      cancelAll: boolean,
      title: string,
      ttsOnSuccess?: string,
    ) => {
      const f = async () => {
        try {
          const response = await client.startCommand({
            command,
            cancelAll,
            title,
            ttsOnSuccess: ttsOnSuccess ?? '',
          }).response
          const result = response?.result
          if (resultCallcack && result) {
            resultCallcack(result)
          }
        } catch (e) {
          console.log(e)
        }
      }
      f()
    },
    [client, resultCallcack],
  )
  return callback
}

export function useCancelCommand(
  client: KachakaApiClient,
  resultCallcack?: (result: pb.Result) => void,
) {
  const callback = useCallback(() => {
    const f = async () => {
      try {
        const response = await client.cancelCommand({}).response
        const result = response?.result
        if (resultCallcack && result) {
          resultCallcack(result)
        }
      } catch (e) {
        console.log(e)
      }
    }
    f()
  }, [client, resultCallcack])
  return callback
}

export function useCommandState(client: KachakaApiClient) {
  return (
    useKachakaState<
      pb.GetCommandStateResponse,
      [pb.CommandState?, pb.Command?]
    >(
      client,
      (request) => client.getCommandState(request),
      (response) => [response.state, response.command],
    ) ?? [undefined, undefined]
  )
}

export function useLastCommandResult(client: KachakaApiClient) {
  return (
    useKachakaState<pb.GetLastCommandResultResponse, [pb.Result?, pb.Command?]>(
      client,
      (request) => client.getLastCommandResult(request),
      (response) => [response.result, response.command],
    ) ?? [undefined, undefined]
  )
}

export function useLocations(client: KachakaApiClient) {
  return useKachakaState<pb.GetLocationsResponse, pb.Location[]>(
    client,
    (request) => client.getLocations(request),
    (response) => response.locations,
  )
}

export function useShelves(client: KachakaApiClient) {
  return useKachakaState<pb.GetShelvesResponse, pb.Shelf[]>(
    client,
    (request) => client.getShelves(request),
    (response) => response.shelves,
  )
}

export function useSetAutoHomingEnabled(
  client: KachakaApiClient,
  resultCallcack?: (result: pb.Result) => void,
) {
  const callback = useCallback(
    (enable: boolean) => {
      const f = async () => {
        try {
          const response = await client.setAutoHomingEnabled({ enable })
            .response
          const result = response?.result
          if (resultCallcack && result) {
            resultCallcack(result)
          }
        } catch (e) {
          console.log(e)
        }
      }
      f()
    },
    [client, resultCallcack],
  )
  return callback
}

export function useAutoHomingEnabled(client: KachakaApiClient) {
  return useKachakaState<pb.GetAutoHomingEnabledResponse, boolean>(
    client,
    (request) => client.getAutoHomingEnabled(request),
    (response) => response.enabled,
  )
}

export function useSetManualControlEnabled(
  client: KachakaApiClient,
  resultCallcack?: (result: pb.Result) => void,
) {
  const callback = useCallback(
    (enable: boolean) => {
      const f = async () => {
        try {
          const response = await client.setManualControlEnabled({
            enable,
            useShelfRegistration: false,
          }).response
          const result = response?.result
          if (resultCallcack && result) {
            resultCallcack(result)
          }
        } catch (e) {
          console.log(e)
        }
      }
      f()
    },
    [client, resultCallcack],
  )
  return callback
}

export function useManualControlEnabled(client: KachakaApiClient) {
  return useKachakaState<pb.GetManualControlEnabledResponse, boolean>(
    client,
    (request) => client.getManualControlEnabled(request),
    (response) => response.enabled,
  )
}

export function useSetRobotVelocity(
  client: KachakaApiClient,
  resultCallcack?: (result: pb.Result) => void,
) {
  const callback = useCallback(
    (v: number, omega: number) => {
      const f = async () => {
        try {
          const response = await client.setRobotVelocity({
            linear: v,
            angular: omega,
          }).response
          const result = response?.result
          if (resultCallcack && result) {
            resultCallcack(result)
          }
        } catch (e) {
          console.log(e)
        }
      }
      f()
    },
    [client, resultCallcack],
  )
  return callback
}

export function useHistoryList(client: KachakaApiClient) {
  return useKachakaState<pb.GetHistoryListResponse, pb.History[]>(
    client,
    (request) => client.getHistoryList(request),
    (response) => response.histories,
  )
}
