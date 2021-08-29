import React from 'react';
import Container from '@material-ui/core/Container';
import Typography from '@material-ui/core/Typography';
import Box from '@material-ui/core/Box';
import Button from '@material-ui/core/Button';
import Link from '../src/Link';
import { useRouter } from 'next/router';

export default function Detail() {
  const router = useRouter();

  return (
    <Container maxWidth="sm">
      <Box my={4}>
        <Typography variant="h4" component="h1" gutterBottom>
          Badge Submitted
        </Typography>
        <Typography>
          Badge UUID: { router.query.uuid }
        </Typography>
        <Typography>
          Hash: { router.query.hash }
        </Typography>
        <Typography>
          Hash ID node: { router.query.proof_id }
        </Typography>
        <Button variant="contained" color="primary" component={Link} naked href="/">
          Go to the main page
        </Button>
      </Box>
    </Container>
  );
}
