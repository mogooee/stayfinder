import styled from 'styled-components';
import { Button } from '@mui/material';

export const Header = styled.header`
  position: fixed;
  width: 100%;
  z-index: 100;
  background: #fff;
  box-shadow: 0px 0px 5px 0px black;
`;

export const CurrentPositionBtn = styled(Button)`
  position: absolute;
  top: 100px;
  right: 50px;
  z-index: 2;
  box-shadow: 0px 0px 5px 0px black;
`;

export const Map = styled.div`
  width: 100%;
  height: 100%;

  .overlay {
    position: relative;
    font-size: small;
  }

  .cost {
    background: white;
    padding: 0.5rem;
    border: 1px solid black;
    border-radius: 8px;
    font-weight: bold;
  }

  .show {
    display: visible;
  }

  .hide {
    display: none;
  }

  .modal-ad {
    position: absolute;
    width: 200px;
    margin-top: 10px;
    border: 1px solid black;
    border-radius: 8px;
    background: white;

    img {
      width: 100%;
      height: 150px;
      object-fit: cover;
      border-radius: 8px 8px 0 0;
    }

    .detail {
      padding: 8px;

      .info {
        display: grid;
        grid-template-columns: auto max-content;
      }

      .wish-icon {
        width: 18px;
        height: 18px;
      }

      .selected-ad-cost {
        margin-top: 10px;
        font-weight: bold;
      }
    }
  }
`;
