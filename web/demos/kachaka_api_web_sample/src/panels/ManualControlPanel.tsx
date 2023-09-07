import React from 'react'

import Box from '@mui/material/Box'
import Button from '@mui/material/Button'
import Grid from '@mui/material/Grid'
import Typography from '@mui/material/Typography'
import ArrowUpwardIcon from '@mui/icons-material/ArrowUpward'
import ArrowDownwardIcon from '@mui/icons-material/ArrowDownward'
import ArrowBackIcon from '@mui/icons-material/ArrowBack'
import ArrowForwardIcon from '@mui/icons-material/ArrowForward'

import { type KachakaApiClient } from '../protos/kachaka-api.client'
import {
  useManualControlEnabled,
  useSetManualControlEnabled,
  useSetRobotVelocity,
} from '../kachakaApi'

export function ManualControlPanel({
  kachakaApiClient,
}: {
  kachakaApiClient: KachakaApiClient
}) {
  const manualControlEnabled = useManualControlEnabled(kachakaApiClient)
  const setManualControlEnabled = useSetManualControlEnabled(kachakaApiClient)
  const setRobotVelocity = useSetRobotVelocity(kachakaApiClient)

  function VelocityCommandButton({
    icon,
    v,
    omega,
  }: {
    icon: JSX.Element
    v: number
    omega: number
  }) {
    return (
      <Button
        variant="contained"
        disabled={!manualControlEnabled}
        sx={{ height: '100%' }}
        onClick={() => {
          setRobotVelocity(v, omega)
        }}
      >
        {icon}
      </Button>
    )
  }

  return (
    <Box
      sx={{
        p: 2,
        marginTop: 1,
        textAlign: 'center',
      }}
    >
      <Typography>
        手動操縦モード: {manualControlEnabled ? 'ON' : 'OFF'}
      </Typography>
      <Button
        variant="contained"
        disabled={manualControlEnabled}
        sx={{ mr: 1 }}
        onClick={() => {
          setManualControlEnabled(true)
        }}
      >
        ON
      </Button>
      <Button
        variant="outlined"
        disabled={!manualControlEnabled}
        onClick={() => {
          setManualControlEnabled(false)
        }}
      >
        OFF
      </Button>
      <Grid
        container
        justifyContent="center"
        alignItems="center"
        direction="column"
        sx={{ mt: 2 }}
      >
        <Grid item xs={12} md={12} lg={12}>
          <Grid container sx={{ width: 200, height: 200 }}>
            <Grid item xs={4} />
            <Grid item xs={4}>
              <VelocityCommandButton
                v={0.5}
                omega={0.0}
                icon={<ArrowUpwardIcon />}
              />
            </Grid>
            <Grid item xs={4} />
            <Grid item xs={4}>
              <VelocityCommandButton
                v={0.0}
                omega={0.5}
                icon={<ArrowBackIcon />}
              />
            </Grid>
            <Grid item xs={4} />
            <Grid item xs={4}>
              <VelocityCommandButton
                v={0.0}
                omega={-0.5}
                icon={<ArrowForwardIcon />}
              />
            </Grid>
            <Grid item xs={4} />
            <Grid item xs={4}>
              <VelocityCommandButton
                v={-0.5}
                omega={0.0}
                icon={<ArrowDownwardIcon />}
              />
            </Grid>
            <Grid item xs={4} />
          </Grid>
        </Grid>
      </Grid>
    </Box>
  )
}
