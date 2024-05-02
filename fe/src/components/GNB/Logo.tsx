import React from 'react';
import { ReactComponent as LogoIcon } from 'assets/icons/logo.svg';

export default function Logo(): JSX.Element {
  const ROOT_URL = '/';
  return (
    <a href={ROOT_URL} className="logo">
      <LogoIcon />
    </a>
  );
}
