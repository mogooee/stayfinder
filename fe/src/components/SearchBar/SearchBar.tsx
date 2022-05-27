import React from 'react';
import styled from 'styled-components';
import { Button } from '@mui/material';
import { ReactComponent as SearchIcon } from 'img/svg/search-icon.svg';

import StyledSearchBar from 'components/SearchBar/SearchBar.styled';
import Period from 'components/SearchBar/Period/Period';
import Price from 'components/SearchBar/Price/Price';
import Personnel from 'components/SearchBar/Personnel/Personnel';
import SearchList from 'components/SearchBar/SearchList/SearchList';

const StyledUl = styled.ul`
  padding-left: 20px;
`;

const SplitLine = styled.div`
  width: 1px;
  height: 44px;
  background: #e0e0e0;
`;

function SearchButton() {
  return (
    <Button style={{ backgroundColor: 'transparent' }}>
      <SearchIcon />
    </Button>
  );
}

export default function SearchBar() {
  return (
    <StyledSearchBar>
      <span id="searchLabel">검색 시작하기</span>
      <StyledUl>
        <SearchList Element={Period} />
        <SplitLine />
        <SearchList Element={Price} />
        <SplitLine />
        <SearchList Element={Personnel} />
        <SearchButton />
      </StyledUl>
    </StyledSearchBar>
  );
}
