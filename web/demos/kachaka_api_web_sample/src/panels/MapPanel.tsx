import React from 'react';

import Card from '@mui/material/Card';
import Typography from '@mui/material/Typography';

import { type KachakaApiClient } from '../protos/kachaka-api.client';
import { useMap } from '../kachakaApi';

import { PngImage } from '../components/PngImage';

export function MapPanel({
  kachakaApiClient,
}: {
  kachakaApiClient: KachakaApiClient;
}) {
  const map = useMap(kachakaApiClient);

  return (
    <Card sx={{ p: 2, marginTop: 1, textAlign: 'center' }}>
      {map && (
        <>
          <Typography variant="h4" sx={{ p: 1 }}>
            {map.name}
          </Typography>
          <PngImage data={map.data} />
        </>
      )}
    </Card>
  );
}
