import React from 'react'

import Box from '@mui/material/Box'
import Chip from '@mui/material/Chip'

import { type KachakaApiClient } from '../protos/kachaka-api.client'
import { useRobotSerialNumber } from '../kachakaApi'

export function RobotSerialNumberPanel({
  kachakaApiClient,
}: {
  kachakaApiClient: KachakaApiClient
}) {
  const robotSerialNumber = useRobotSerialNumber(kachakaApiClient)

  return (
    <Box sx={{ paddingTop: 2, textAlign: 'center' }}>
      robot serial number:{' '}
      <Chip
        label={robotSerialNumber ?? 'unknown'}
        variant="filled"
        color="primary"
      />
    </Box>
  )
}
