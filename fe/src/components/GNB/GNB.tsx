import React from 'react';
import StyledGNB from 'components/GNB/GNB.styled';
import Logo from 'components/GNB/Logo';
import Menu from 'components/GNB/Menu/Menu';
import AccountMenu from 'components/GNB/AccountMenu';

export default function GNB(): JSX.Element {
  return (
    <StyledGNB>
      <Logo />
      <Menu />
      <AccountMenu />
    </StyledGNB>
  );
}
