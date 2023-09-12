import React from 'react';

import Paper from '@mui/material/Paper';
import {
  LinearProgress,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableRow,
  Typography,
} from '@mui/material';

import { type KachakaApiClient } from '../protos/kachaka-api.client';
import {
  type Command,
  type Location,
  type Shelf,
  CommandState,
} from '../protos/kachaka-api';
import { useCommandState, useLastCommandResult } from '../kachakaApi';

function resolveLocation(
  locations: Location[] | undefined,
  locationId: string,
) {
  if (!locations) {
    return locationId;
  }
  const targetLocation = locations.find(
    (location) => location.id === locationId,
  );
  return targetLocation ? targetLocation.name : locationId;
}

function resolveShelf(shelves: Shelf[] | undefined, shelfId: string) {
  if (!shelves) {
    return shelfId;
  }
  const targetShelf = shelves.find((shelf) => shelf.id === shelfId);
  return targetShelf ? targetShelf.name : shelfId;
}

function CommandDescriptionRows({
  command,
  locations,
  shelves,
}: {
  command: Command;
  locations: Location[] | undefined;
  shelves: Shelf[] | undefined;
}) {
  switch (command.command.oneofKind) {
    case 'moveShelfCommand':
      return (
        <>
          <TableRow>
            <TableCell>Target Shelf</TableCell>
            <TableCell>
              {resolveShelf(
                shelves,
                command.command.moveShelfCommand.targetShelfId,
              )}
            </TableCell>
          </TableRow>
          <TableRow>
            <TableCell>Destination</TableCell>
            <TableCell>
              {resolveLocation(
                locations,
                command.command.moveShelfCommand.destinationLocationId,
              )}
            </TableCell>
          </TableRow>
        </>
      );
    case 'returnShelfCommand':
      return (
        <>
          <TableRow>
            <TableCell>Target Shelf</TableCell>
            <TableCell>
              {resolveShelf(
                shelves,
                command.command.returnShelfCommand.targetShelfId,
              )}
            </TableCell>
          </TableRow>
        </>
      );
    case 'undockShelfCommand':
      return <></>;
    case 'moveToLocationCommand':
      return (
        <>
          <TableRow>
            <TableCell>Destination</TableCell>
            <TableCell>
              {resolveLocation(
                locations,
                command.command.moveToLocationCommand.targetLocationId,
              )}
            </TableCell>
          </TableRow>
        </>
      );
    case 'returnHomeCommand':
      return <></>;
    case 'dockShelfCommand':
      return <></>;
    case 'speakCommand':
      return (
        <>
          <TableRow>
            <TableCell>Text</TableCell>
            <TableCell>{command.command.speakCommand.text}</TableCell>
          </TableRow>
        </>
      );
    case 'moveToPoseCommand':
      return (
        <>
          <TableRow>
            <TableCell>Goal</TableCell>
            <TableCell>
              (
              {((v) => [v.x, v.y, v.yaw])(
                command.command.moveToPoseCommand,
              ).join(', ')}
              )
            </TableCell>
          </TableRow>
        </>
      );
  }
}

function CommandDescriptionTable({
  command,
  locations,
  shelves,
}: {
  command: Command;
  locations: Location[] | undefined;
  shelves: Shelf[] | undefined;
}) {
  return (
    <TableContainer>
      <Table>
        <TableBody>
          <TableRow>
            <TableCell>Command</TableCell>
            <TableCell>{command.command.oneofKind}</TableCell>
          </TableRow>
          <CommandDescriptionRows
            command={command}
            locations={locations}
            shelves={shelves}
          />
        </TableBody>
      </Table>
    </TableContainer>
  );
}

export function CommandStatePanel({
  kachakaApiClient,
  locations,
  shelves,
}: {
  kachakaApiClient: KachakaApiClient;
  locations: Location[] | undefined;
  shelves: Shelf[] | undefined;
}) {
  const [state, currentCommand] = useCommandState(kachakaApiClient);
  const [_lastCommandResult, lastCommand] =
    useLastCommandResult(kachakaApiClient);

  return (
    <Paper
      sx={{
        p: 1,
        marginTop: 1,
        textAlign: 'center',
      }}
    >
      {state != null && state === CommandState.RUNNING && currentCommand ? (
        <>
          <Typography sx={{ m: 1 }}>Running Command</Typography>
          <LinearProgress />
          <CommandDescriptionTable
            command={currentCommand}
            locations={locations}
            shelves={shelves}
          />
        </>
      ) : lastCommand !== undefined ? (
        <>
          <Typography sx={{ m: 1 }}>Last Command</Typography>
          <CommandDescriptionTable
            command={lastCommand}
            locations={locations}
            shelves={shelves}
          />
        </>
      ) : (
        <Typography>no command information</Typography>
      )}
    </Paper>
  );
}
