import React from 'react';
import reset from 'styled-reset';
import { createGlobalStyle } from 'styled-components';
import Routers from 'components/Routers/Routers';
import { SearchProvider } from 'context/SearchProvider';

const GlobalStyles = createGlobalStyle`
    ${reset};
    *{
      box-sizing:border-box;
    }
`;

export default function App() {
  return (
    <div className="App">
      <GlobalStyles />
      <SearchProvider>
        <Routers />
      </SearchProvider>
    </div>
  );
}
