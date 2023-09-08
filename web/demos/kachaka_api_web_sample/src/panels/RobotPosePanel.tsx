import React from 'react';

import Box from '@mui/material/Box';

import { type KachakaApiClient } from '../protos/kachaka-api.client';
import { useRobotPose } from '../kachakaApi';

export function RobotPosePanel({
  kachakaApiClient,
}: {
  kachakaApiClient: KachakaApiClient;
}) {
  const robotPose = useRobotPose(kachakaApiClient);

  return (
    <Box sx={{ paddingTop: 2, textAlign: 'center' }}>
      robot pose: (
      {robotPose
        ? robotPose.map((v) => v.toFixed(3)).join(', ')
        : 'NaN, NaN, NaN'}
      )
    </Box>
  );
}
