import React, { useCallback, useMemo, useState } from 'react';

import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import Paper from '@mui/material/Paper';
import Select from '@mui/material/Select';
import {
  Checkbox,
  FormControl,
  FormControlLabel,
  MenuItem,
  type SelectChangeEvent,
  TextField,
} from '@mui/material';

import { type KachakaApiClient } from '../protos/kachaka-api.client';
import { type Command, type Location, type Shelf } from '../protos/kachaka-api';
import { useStartCommand, useCancelCommand } from '../kachakaApi';

enum CommandType {
  Undefined = 'Undefined',
  MoveShelf = 'Move Shelf',
  ReturnShelf = 'Return Shelf',
  UndockShelf = 'Undock Shelf',
  MoveToLocation = 'Move To Location',
  ReturnHome = 'Return Home',
  DockShelf = 'Dock Shelf',
  Speak = 'Speak',
  MoveToPose = 'Move To Pose',
}

function CommandTypeSelect({
  commandType,
  setCommandType,
}: {
  commandType: CommandType;
  setCommandType: (commandType: CommandType) => void;
}) {
  const handleChange = (event: SelectChangeEvent<CommandType>) => {
    if (!event.target.value) {
      setCommandType(CommandType.Undefined);
    } else {
      setCommandType(event.target.value as CommandType);
    }
  };
  return (
    <FormControl size="small" fullWidth sx={{ p: 1 }}>
      <Select
        variant="outlined"
        value={commandType}
        onChange={(event) => {
          handleChange(event);
        }}
      >
        {Object.entries(CommandType).map(([key, value]) => (
          <MenuItem key={key} value={value}>
            {value}
          </MenuItem>
        ))}
      </Select>
    </FormControl>
  );
}

function LocationSelect({
  locationId,
  setLocationId,
  locations,
}: {
  locationId: string;
  setLocationId: (id: string) => void;
  locations: Location[] | undefined;
}) {
  const handleChange = (event: SelectChangeEvent<string>) => {
    if (!event.target.value) {
      setLocationId('');
    } else {
      setLocationId(event.target.value);
    }
  };
  return (
    <Select
      variant="outlined"
      value={locationId}
      onChange={(event) => {
        handleChange(event);
      }}
      fullWidth
    >
      {locations?.map((location) => (
        <MenuItem key={location.id} value={location.id}>
          {location.name} ({location.id})
        </MenuItem>
      ))}
    </Select>
  );
}

function ShelfSelect({
  shelves,
  shelfId,
  setShelfId,
}: {
  shelves: Shelf[] | undefined;
  shelfId: string;
  setShelfId: (id: string) => void;
}) {
  const handleChange = (event: SelectChangeEvent<string>) => {
    if (!event.target.value) {
      setShelfId('');
    } else {
      setShelfId(event.target.value);
    }
  };
  return (
    <Select
      variant="outlined"
      value={shelfId}
      onChange={(event) => {
        handleChange(event);
      }}
      fullWidth
    >
      {shelves?.map((shelf) => (
        <MenuItem key={shelf.id} value={shelf.id}>
          {shelf.name} ({shelf.id})
        </MenuItem>
      ))}
    </Select>
  );
}

function CommandArgInput({
  locations,
  shelves,
  commandType,
  moveShelfTargetShelf,
  setMoveShelfTargetShelf,
  moveShelfDestination,
  setMoveShelfDestination,
  returnShelfTargetShelf,
  setReturnShelfTargetShelf,
  moveToLocationTargetLocation,
  setMoveToLocationTargetLocation,
  speakText,
  setSpeakText,
  moveToPoseGoal,
  setMoveToPoseGoal,
}: {
  locations: Location[] | undefined;
  shelves: Shelf[] | undefined;
  commandType: CommandType;
  moveShelfTargetShelf: string;
  setMoveShelfTargetShelf: (id: string) => void;
  moveShelfDestination: string;
  setMoveShelfDestination: (id: string) => void;
  returnShelfTargetShelf: string;
  setReturnShelfTargetShelf: (id: string) => void;
  moveToLocationTargetLocation: string;
  setMoveToLocationTargetLocation: (id: string) => void;
  speakText: string;
  setSpeakText: (text: string) => void;
  moveToPoseGoal: [number, number, number];
  setMoveToPoseGoal: (goal: [number, number, number]) => void;
}) {
  switch (commandType) {
    case CommandType.Undefined:
      return <></>;
    case CommandType.MoveShelf:
      return (
        <>
          <FormControl size="small" fullWidth>
            <ShelfSelect
              shelves={shelves}
              shelfId={moveShelfTargetShelf}
              setShelfId={setMoveShelfTargetShelf}
            />
          </FormControl>
          <FormControl size="small" fullWidth>
            <LocationSelect
              locations={locations}
              locationId={moveShelfDestination}
              setLocationId={setMoveShelfDestination}
            />
          </FormControl>
        </>
      );
    case CommandType.ReturnShelf:
      return (
        <FormControl size="small" fullWidth>
          <ShelfSelect
            shelves={shelves}
            shelfId={returnShelfTargetShelf}
            setShelfId={setReturnShelfTargetShelf}
          />
        </FormControl>
      );
    case CommandType.UndockShelf:
      return <></>;
    case CommandType.MoveToLocation:
      return (
        <FormControl size="small" fullWidth>
          <LocationSelect
            locations={locations}
            locationId={moveToLocationTargetLocation}
            setLocationId={setMoveToLocationTargetLocation}
          />
        </FormControl>
      );
    case CommandType.ReturnHome:
      return <></>;
    case CommandType.DockShelf:
      return <></>;
    case CommandType.Speak:
      return (
        <FormControl size="small" fullWidth>
          <TextField
            value={speakText}
            onChange={(e) => {
              setSpeakText(e.target.value);
            }}
          />
        </FormControl>
      );
    case CommandType.MoveToPose:
      return (
        <FormControl size="small" fullWidth>
          <TextField
            value={moveToPoseGoal[0]}
            type="number"
            onChange={(e) => {
              setMoveToPoseGoal([
                Number(e.target.value),
                moveToPoseGoal[1],
                moveToPoseGoal[2],
              ]);
            }}
          />
          <TextField
            value={moveToPoseGoal[1]}
            type="number"
            onChange={(e) => {
              setMoveToPoseGoal([
                moveToPoseGoal[0],
                Number(e.target.value),
                moveToPoseGoal[2],
              ]);
            }}
          />
          <TextField
            value={moveToPoseGoal[2]}
            type="number"
            onChange={(e) => {
              setMoveToPoseGoal([
                moveToPoseGoal[0],
                moveToPoseGoal[1],
                Number(e.target.value),
              ]);
            }}
          />
        </FormControl>
      );
  }
}

function buildCommand({
  commandType,
  moveShelfTargetShelf,
  moveShelfDestination,
  returnShelfTargetShelf,
  moveToLocationTargetLocation,
  speakText,
  moveToPoseGoal,
}: {
  commandType: CommandType;
  moveShelfTargetShelf: string;
  moveShelfDestination: string;
  returnShelfTargetShelf: string;
  moveToLocationTargetLocation: string;
  speakText: string;
  moveToPoseGoal: [number, number, number];
}): Command | undefined {
  switch (commandType) {
    case CommandType.Undefined:
      return undefined;
    case CommandType.MoveShelf:
      return {
        command: {
          oneofKind: 'moveShelfCommand',
          moveShelfCommand: {
            targetShelfId: moveShelfTargetShelf,
            destinationLocationId: moveShelfDestination,
          },
        },
      };
    case CommandType.ReturnShelf:
      return {
        command: {
          oneofKind: 'returnShelfCommand',
          returnShelfCommand: {
            targetShelfId: returnShelfTargetShelf,
          },
        },
      };
    case CommandType.UndockShelf:
      return {
        command: {
          oneofKind: 'undockShelfCommand',
          undockShelfCommand: {
            targetShelfId: '',
          },
        },
      };
    case CommandType.MoveToLocation:
      return {
        command: {
          oneofKind: 'moveToLocationCommand',
          moveToLocationCommand: {
            targetLocationId: moveToLocationTargetLocation,
          },
        },
      };
    case CommandType.ReturnHome:
      return {
        command: {
          oneofKind: 'returnHomeCommand',
          returnHomeCommand: {},
        },
      };
    case CommandType.DockShelf:
      return {
        command: {
          oneofKind: 'dockShelfCommand',
          dockShelfCommand: {},
        },
      };
    case CommandType.Speak:
      return {
        command: {
          oneofKind: 'speakCommand',
          speakCommand: {
            text: speakText,
          },
        },
      };
    case CommandType.MoveToPose:
      return {
        command: {
          oneofKind: 'moveToPoseCommand',
          moveToPoseCommand: {
            x: moveToPoseGoal[0],
            y: moveToPoseGoal[1],
            yaw: moveToPoseGoal[2],
          },
        },
      };
    default:
      return undefined;
  }
}

export function CommandPanel({
  kachakaApiClient,
  locations,
  shelves,
}: {
  kachakaApiClient: KachakaApiClient;
  locations: Location[] | undefined;
  shelves: Shelf[] | undefined;
}) {
  const [commandType, setCommandType] = useState<CommandType>(
    CommandType.Undefined,
  );
  const [moveShelfTargetShelf, setMoveShelfTargetShelf] = useState('');
  const [moveShelfDestination, setMoveShelfDestination] = useState('');
  const [returnShelfTargetShelf, setReturnShelfTargetShelf] = useState('');
  const [moveToLocationTargetLocation, setMoveToLocationTargetLocation] =
    useState('');
  const [speakText, setSpeakText] = useState('');
  const [moveToPoseGoal, setMoveToPoseGoal] = useState<
    [number, number, number]
  >([0, 0, 0]);

  const command = useMemo(() => {
    return buildCommand({
      commandType,
      moveShelfTargetShelf,
      moveShelfDestination,
      returnShelfTargetShelf,
      moveToLocationTargetLocation,
      speakText,
      moveToPoseGoal,
    });
  }, [
    commandType,
    moveShelfTargetShelf,
    moveShelfDestination,
    returnShelfTargetShelf,
    moveToLocationTargetLocation,
    speakText,
    moveToPoseGoal,
  ]);

  const [cancelAll, setCancelAll] = useState(true);

  const startCommand = useStartCommand(kachakaApiClient, (result) => {
    console.log(result.success + ', ' + result.errorCode);
  });
  const cancelCommand = useCancelCommand(kachakaApiClient);

  const handleStartCommand = useCallback(() => {
    if (!command) {
      console.log('undefined command');
      return;
    }
    startCommand(command, cancelAll, 'command from web sample', '');
  }, [startCommand, command, cancelAll]);

  return (
    <Paper
      sx={{
        p: 1,
        marginTop: 1,
        textAlign: 'center',
      }}
    >
      <CommandTypeSelect
        commandType={commandType}
        setCommandType={setCommandType}
      />
      <FormControlLabel
        label="cancel all tasks and start"
        control={
          <Checkbox
            defaultChecked
            value={cancelAll}
            onChange={() => {
              setCancelAll(!cancelAll);
            }}
          />
        }
      />

      <Box sx={{ p: 1 }}>
        <CommandArgInput
          locations={locations}
          shelves={shelves}
          commandType={commandType}
          moveShelfTargetShelf={moveShelfTargetShelf}
          setMoveShelfTargetShelf={setMoveShelfTargetShelf}
          moveShelfDestination={moveShelfDestination}
          setMoveShelfDestination={setMoveShelfDestination}
          returnShelfTargetShelf={returnShelfTargetShelf}
          setReturnShelfTargetShelf={setReturnShelfTargetShelf}
          moveToLocationTargetLocation={moveToLocationTargetLocation}
          setMoveToLocationTargetLocation={setMoveToLocationTargetLocation}
          speakText={speakText}
          setSpeakText={setSpeakText}
          moveToPoseGoal={moveToPoseGoal}
          setMoveToPoseGoal={setMoveToPoseGoal}
        />
      </Box>
      <div>
        <Button
          sx={{ m: 2 }}
          variant="contained"
          disabled={!command}
          onClick={() => {
            handleStartCommand();
          }}
        >
          RUN
        </Button>
        <Button
          sx={{ m: 2 }}
          variant="outlined"
          onClick={() => {
            cancelCommand();
          }}
        >
          CANCEL
        </Button>
      </div>
    </Paper>
  );
}
