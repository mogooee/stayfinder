import styled from 'styled-components';

export default styled.div`
  display: grid;
  place-items: center;
  align-items: start;
  grid-template-columns: repeat(2, 1fr);
  ${({ callendarNum }) => {
    const maxNumOfLine = 2;
    return (
      callendarNum > maxNumOfLine &&
      `
  overflow-y: scroll;
  height: 35vh;
  `
    );
  }}

  button {
  padding: 0;
  background: transparent;
  border: none;
  &:hover {
    cursor: pointer;
  }

`;
