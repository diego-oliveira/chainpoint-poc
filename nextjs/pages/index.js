import React from 'react';
import Container from '@material-ui/core/Container';
import TextField from '@material-ui/core/TextField';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';
import Box from '@material-ui/core/Box';
import { useForm, Controller } from "react-hook-form";
import axios from 'axios';
import { useRouter } from 'next/router';


export default function Index() {
  const { control, handleSubmit } = useForm();
  const router = useRouter();

  const onSubmit = data => {
    return axios.post('http://localhost:3000/api/v1/badge', { badge: data })
      .then((result) => {
        const hash = result.data.chainpoint_response.hashes[0];
        const uuid = data.uuid;
        router.push({ pathname: '/detail', query: Object.assign({}, hash, { uuid }) });
      })
      .catch((error) => {
        console.log(error.response.data)
        console.error(error)
      });
  };


  return (
    <Container maxWidth="sm">
      <Box my={4}>
        <Typography variant="h4" component="h1" gutterBottom>
          Submit Badge
        </Typography>

        <form onSubmit={handleSubmit(onSubmit)}>
          <Controller
            name="name"
            control={control}
            defaultValue=""
            rules={{ required: 'Name is required' }}
            render={({ field, fieldState: { error } }) => <TextField {...field} fullWidth label="Name*" autoComplete="none" error={!!error} helperText={error ? error.message : null} />}
          />
          <Controller
            name="issue_date"
            control={control}
            rules={{ required: 'Issue date is required' }}
            defaultValue=""
            render={({ field, fieldState: { error } }) => <TextField {...field} fullWidth label="Issue Date*" autoComplete="none" error={!!error} helperText={error ? error.message : null} />}
          />

          <Controller
            name="uuid"
            control={control}
            defaultValue=""
            rules={{ required: 'UUID is required' }}
            render={({ field, fieldState: { error } }) => <TextField {...field} fullWidth label="Badge UUID*" autoComplete="none" error={!!error} helperText={error ? error.message : null} />}
          />
          <Button type="submit" color="primary">Submit to Chainpoint</Button>
        </form>
      </Box>
    </Container>
  );
}
