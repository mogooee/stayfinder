import React from 'react';
import { Button } from '@mui/material';
import { ReactComponent as LoginIcon } from 'assets/icons/login.svg';

export default function AccountMenu(): JSX.Element {
  return (
    <Button disableRipple disableFocusRipple style={{ backgroundColor: 'transparent' }}>
      <LoginIcon className="loginIcon" />
    </Button>
  );
}
