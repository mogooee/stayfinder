import styled from 'styled-components';

export default styled.div`
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  justify-content: space-around;
  align-items: center;
  justify-items: center;
  padding: 23px 40px;

  a {
    justify-self: start;
    svg {
      width: 180px;
    }
  }

  button {
    justify-self: end;
  }
`;
