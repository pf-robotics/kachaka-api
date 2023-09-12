import React, { useCallback, useState } from 'react';

import { createTheme, ThemeProvider } from '@mui/material/styles';
import CssBaseline from '@mui/material/CssBaseline';
import Box from '@mui/material/Box';
import Container from '@mui/material/Container';
import Fab from '@mui/material/Fab';
import Grid from '@mui/material/Grid';
import MuiAppBar from '@mui/material/AppBar';
import Toolbar from '@mui/material/Toolbar';
import Typography from '@mui/material/Typography';
import AddIcon from '@mui/icons-material/Add';

import { v4 as uuidV4 } from 'uuid';
import { GrpcWebFetchTransport } from '@protobuf-ts/grpcweb-transport';

import { KachakaApiClient } from './protos/kachaka-api.client';
import { KachakaApiPanel } from './KachakaApiPanel';
import { useLocations, useShelves } from './kachakaApi';

const defaultTheme = createTheme();

function App(): JSX.Element {
  const [kachakaApiClient] = useState(
    new KachakaApiClient(
      new GrpcWebFetchTransport({
        baseUrl: 'http://localhost:50000',
      }),
    ),
  );
  const locations = useLocations(kachakaApiClient);
  const shelves = useShelves(kachakaApiClient);

  const [panelIds, setPanelIds] = useState<string[]>(() => [uuidV4()]);

  const handleAddPanel = useCallback(() => {
    setPanelIds((prev) => [...prev, uuidV4()]);
  }, []);
  const handleClosePanel = useCallback((targetPanelId: string) => {
    setPanelIds((prev) => prev.filter((panelId) => panelId !== targetPanelId));
  }, []);

  return (
    <ThemeProvider theme={defaultTheme}>
      <Box sx={{ display: 'flex', width: '100vw' }}>
        <CssBaseline />
        <MuiAppBar position="absolute">
          <Toolbar>
            <Typography component="h1" variant="h6" color="inherit" noWrap>
              Kachaka API grpc-web demo
            </Typography>
          </Toolbar>
        </MuiAppBar>
        <Box
          component="main"
          sx={{
            backgroundColor: (theme) => theme.palette.grey[100],
            flexGrow: 1,
            height: '100vh',
            overflow: 'auto',
          }}
        >
          <Toolbar />
          <Container maxWidth="xl" sx={{ ml: 0, mt: 2, mb: 2 }}>
            <Grid container spacing={3}>
              {panelIds.map((panelId) => (
                <KachakaApiPanel
                  key={panelId}
                  kachakaApiClient={kachakaApiClient}
                  handleClose={() => {
                    handleClosePanel(panelId);
                  }}
                  locations={locations}
                  shelves={shelves}
                />
              ))}
              <Grid item xs={12} md={12} lg={12} sx={{ p: 4 }}>
                <Fab color="primary" onClick={handleAddPanel}>
                  <AddIcon />
                </Fab>
              </Grid>
            </Grid>
          </Container>
        </Box>
      </Box>
    </ThemeProvider>
  );
}

export default App;
