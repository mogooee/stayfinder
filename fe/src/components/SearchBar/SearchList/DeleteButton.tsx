import React from 'react';
import { Button } from '@mui/material';
import { ReactComponent as DeleteIcon } from 'assets/icons/delete.svg';

export default function DeleteButton({ initValue }: { initValue: () => void }): JSX.Element {
  return (
    <Button style={{ backgroundColor: 'transparent', minWidth: '50px' }} onClick={initValue}>
      <DeleteIcon />
    </Button>
  );
}
