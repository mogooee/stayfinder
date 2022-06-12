import React, { useEffect, useRef } from 'react';
import styled from 'styled-components';
import GNB from 'components/GNB/GNB';

const Header = styled.header`
  height: 94 px;
`;

const Map = styled.div`
  width: 100vw;
  height: 100vh;

  .label {
    margin-bottom: 96px;
  }
  .label * {
    display: inline-block;
    vertical-align: top;
  }
  .label .left {
    background: url('https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png') no-repeat;
    display: inline-block;
    height: 24px;
    overflow: hidden;
    vertical-align: top;
    width: 7px;
  }
  .label .center {
    background: url(https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;
    display: inline-block;
    height: 24px;
    font-size: 12px;
    line-height: 24px;
  }
  .label .right {
    background: url('https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png') -1px 0 no-repeat;
    display: inline-block;
    height: 24px;
    overflow: hidden;
    width: 6px;
  }
`;

declare global {
  interface Window {
    kakao: any;
  }
}

const mapInfo = [
  {
    title: 'codesquad',
    position: {
      x: 37.490821,
      y: 127.033417,
    },
  },
  {
    title: '싸리고개공원',
    position: {
      x: 37.4894897,
      y: 127.035605,
    },
  },
  {
    title: '역삼소나무공원',
    position: {
      x: 37.490928,
      y: 127.0337138,
    },
  },
  {
    title: '역삼개나리공원',
    position: {
      x: 37.497581,
      y: 127.0361225,
    },
  },
  {
    title: '역삼까치공원',
    position: {
      x: 37.4972085,
      y: 127.030726,
    },
  },
];

const centerPosition = { x: 37.490821, y: 127.033417 };

export default function Search(): JSX.Element {
  const mapRef = useRef<HTMLDivElement>(null);
  const { kakao } = window;

  useEffect(() => {
    // const mapContainer = document.getElementById('map'); // 지도를 표시할 div
    const mapContainer = mapRef.current;

    const mapOption = {
      center: new kakao.maps.LatLng(centerPosition.x, centerPosition.y), // 지도의 중심좌표
      level: 3, // 지도의 확대 레벨
    };

    const map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    mapInfo.forEach((e) => {
      // 커스텀 오버레이에 표시할 내용입니다
      // HTML 문자열 또는 Dom Element 입니다
      const content = `<div class ="label"><span class="left"></span><span class="center">${e.title}</span><span class="right"></span></div>`;

      // 커스텀 오버레이가 표시될 위치입니다
      const position = new kakao.maps.LatLng(e.position.x, e.position.y);

      // 커스텀 오버레이를 생성합니다
      const customOverlay = new kakao.maps.CustomOverlay({
        position,
        content,
      });

      // 커스텀 오버레이를 지도에 표시합니다
      customOverlay.setMap(map);
    });
  }, [kakao.maps]);

  return (
    <main>
      <Header>
        <GNB />
      </Header>
      <Map id="map" ref={mapRef} />
    </main>
  );
}
