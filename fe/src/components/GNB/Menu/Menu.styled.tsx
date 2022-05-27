import styled from 'styled-components';

export default styled.nav`
  ul {
    display: flex;
  }

  span {
    font-weight: 400;
    font-size: 16px;

    &:hover {
      font-weight: 700;
      text-decoration: underline;
    }
  }

  li {
    &:hover {
      cursor: pointer;
    }
  }

  li + li {
    margin-left: 24px;
  }
`;
