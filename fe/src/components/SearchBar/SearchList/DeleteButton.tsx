import React from 'react';
import { Button } from '@mui/material';
import { ReactComponent as DeleteIcon } from 'img/svg/delete.svg';

export default function DeleteButton() {
  return (
    <Button style={{ backgroundColor: 'transparent' }}>
      <DeleteIcon />
    </Button>
  );
}
