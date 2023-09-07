import React from 'react'

import Box from '@mui/material/Box'
import Chip from '@mui/material/Chip'

import { type KachakaApiClient } from '../protos/kachaka-api.client'
import { useRobotVersion } from '../kachakaApi'

export function RobotVersionPanel({
  kachakaApiClient,
}: {
  kachakaApiClient: KachakaApiClient
}) {
  const robotVersion = useRobotVersion(kachakaApiClient)

  return (
    <Box sx={{ paddingTop: 2, textAlign: 'center' }}>
      robot version:{' '}
      <Chip
        label={robotVersion ?? 'unknown'}
        variant="filled"
        color="primary"
      />
    </Box>
  )
}
