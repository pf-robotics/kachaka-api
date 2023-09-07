import React, { useState, useMemo } from 'react'

import Box from '@mui/material/Box'
import Grid from '@mui/material/Grid'
import Paper from '@mui/material/Paper'
import MenuItem from '@mui/material/MenuItem'
import Select, { type SelectChangeEvent } from '@mui/material/Select'
import CloseIcon from '@mui/icons-material/Close'

import { type KachakaApiClient } from './protos/kachaka-api.client'
import { type Shelf, type Location } from './protos/kachaka-api'
import { KachakaApiPanelType } from './kachakaApiPanelType'
import {
  RobotVersionPanel,
  RobotSerialNumberPanel,
  RobotPosePanel,
  MapPanel,
  AutoHomingPanel,
  ManualControlPanel,
  CommandPanel,
  CommandStatePanel,
} from './panels'
import { IconButton } from '@mui/material'

interface PanelSize {
  xs: number
  md: number
  lg: number
}

const panelSizes = new Map<KachakaApiPanelType, PanelSize>([
  [KachakaApiPanelType.Unset, { xs: 8, md: 4, lg: 4 }],
  [KachakaApiPanelType.AutoHoming, { xs: 8, md: 4, lg: 4 }],
  [KachakaApiPanelType.Command, { xs: 8, md: 4, lg: 4 }],
  [KachakaApiPanelType.CommandState, { xs: 8, md: 4, lg: 4 }],
  [KachakaApiPanelType.RobotVersion, { xs: 8, md: 4, lg: 4 }],
  [KachakaApiPanelType.RobotSerialNumber, { xs: 8, md: 4, lg: 4 }],
  [KachakaApiPanelType.RobotPose, { xs: 8, md: 4, lg: 4 }],
  [KachakaApiPanelType.Map, { xs: 12, md: 6, lg: 6 }],
  [KachakaApiPanelType.ManualControl, { xs: 8, md: 4, lg: 4 }],
])

function PanelTypeSelection({
  panelType,
  setPanelType,
}: {
  panelType: KachakaApiPanelType
  setPanelType: (panelType: KachakaApiPanelType) => void
}) {
  const handleChange = (event: SelectChangeEvent<KachakaApiPanelType>) => {
    if (!event.target.value) {
      setPanelType(KachakaApiPanelType.Unset)
    } else {
      setPanelType(event.target.value as KachakaApiPanelType)
    }
  }

  return (
    <Select
      value={panelType}
      onChange={(event) => {
        handleChange(event)
      }}
    >
      {Object.entries(KachakaApiPanelType).map(([key, value]) => (
        <MenuItem key={key} value={value}>
          {value}
        </MenuItem>
      ))}
    </Select>
  )
}

function KachakaApiPanelForType({
  panelType,
  kachakaApiClient,
  locations,
  shelves,
}: {
  panelType: KachakaApiPanelType
  kachakaApiClient: KachakaApiClient
  locations: Location[] | undefined
  shelves: Shelf[] | undefined
}) {
  switch (panelType) {
    case KachakaApiPanelType.Unset:
      return <></>
    case KachakaApiPanelType.AutoHoming:
      return <AutoHomingPanel kachakaApiClient={kachakaApiClient} />
    case KachakaApiPanelType.Command:
      return (
        <CommandPanel
          kachakaApiClient={kachakaApiClient}
          locations={locations}
          shelves={shelves}
        />
      )
    case KachakaApiPanelType.CommandState:
      return (
        <CommandStatePanel
          kachakaApiClient={kachakaApiClient}
          locations={locations}
          shelves={shelves}
        />
      )
    case KachakaApiPanelType.RobotVersion:
      return <RobotVersionPanel kachakaApiClient={kachakaApiClient} />
    case KachakaApiPanelType.RobotSerialNumber:
      return <RobotSerialNumberPanel kachakaApiClient={kachakaApiClient} />
    case KachakaApiPanelType.RobotPose:
      return <RobotPosePanel kachakaApiClient={kachakaApiClient} />
    case KachakaApiPanelType.Map:
      return <MapPanel kachakaApiClient={kachakaApiClient} />
    case KachakaApiPanelType.ManualControl:
      return <ManualControlPanel kachakaApiClient={kachakaApiClient} />
  }
  return <div>nothing</div>
}

export function KachakaApiPanel({
  kachakaApiClient,
  handleClose,
  locations,
  shelves,
}: {
  kachakaApiClient: KachakaApiClient
  handleClose: () => void
  locations: Location[] | undefined
  shelves: Shelf[] | undefined
}) {
  const [panelType, setPanelType] = useState<KachakaApiPanelType>(
    KachakaApiPanelType.Unset,
  )
  const panelSize = useMemo(
    () => panelSizes.get(panelType) ?? { xs: 8, md: 4, lg: 4 },
    [panelType],
  )

  return (
    <Grid item xs={panelSize.xs} md={panelSize.md} lg={panelSize.lg}>
      <Paper
        sx={{
          p: 2,
          display: 'flex',
          flexDirection: 'column',
        }}
      >
        <Box sx={{ mb: 1, p: 0 }}>
          <IconButton
            onClick={handleClose}
            sx={{
              color: (theme) => theme.palette.grey[500],
            }}
          >
            <CloseIcon />
          </IconButton>
        </Box>

        <PanelTypeSelection panelType={panelType} setPanelType={setPanelType} />
        <KachakaApiPanelForType
          panelType={panelType}
          kachakaApiClient={kachakaApiClient}
          locations={locations}
          shelves={shelves}
        />
      </Paper>
    </Grid>
  )
}
