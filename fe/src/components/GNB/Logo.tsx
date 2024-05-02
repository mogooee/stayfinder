import React from 'react';
import { ReactComponent as LogoIcon } from 'assets/icons/logo.svg';

export default function Logo(): JSX.Element {
  return (
    <a href={process.env.PUBLIC_URL} className="logo">
      <LogoIcon />
    </a>
  );
}
