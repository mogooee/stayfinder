import React from 'react';
import { ReactComponent as LogoIcon } from 'img/svg/logo.svg';

export default function Logo() {
  const ROOT_URL = '/airbnb';
  return (
    <a href={ROOT_URL} className="logo">
      <LogoIcon />
    </a>
  );
}
