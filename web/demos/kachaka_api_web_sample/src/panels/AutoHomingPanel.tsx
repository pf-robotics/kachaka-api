import React from 'react';

import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import Box from '@mui/material/Box';

import { type KachakaApiClient } from '../protos/kachaka-api.client';
import { useAutoHomingEnabled, useSetAutoHomingEnabled } from '../kachakaApi';

export function AutoHomingPanel({
  kachakaApiClient,
}: {
  kachakaApiClient: KachakaApiClient;
}) {
  const autoHomingEnabled = useAutoHomingEnabled(kachakaApiClient);
  const setAutoHomingEnabled = useSetAutoHomingEnabled(kachakaApiClient);

  return (
    <Box
      sx={{
        p: 2,
        marginTop: 1,
        textAlign: 'center',
      }}
    >
      <Typography sx={{ mb: 2 }}>
        自動充電: {autoHomingEnabled ? 'ON' : 'OFF'}
      </Typography>
      <Button
        variant="contained"
        disabled={autoHomingEnabled}
        sx={{ mr: 1 }}
        onClick={() => {
          setAutoHomingEnabled(true);
        }}
      >
        ON
      </Button>
      <Button
        variant="outlined"
        disabled={!autoHomingEnabled}
        onClick={() => {
          setAutoHomingEnabled(false);
        }}
      >
        OFF
      </Button>
    </Box>
  );
}
