/* eslint-disable camelcase */
import { type Pos } from 'pages/Search/Search';
import { type Accomodation } from 'components/accomodations/AccomodationListView';
import wish from '../assets/icons/wish.svg';

const { kakao } = window;

export const makeMap = (mapContainer: HTMLDivElement, centerPos: Pos, level: number) => {
  const mapOption = {
    center: new kakao.maps.LatLng(centerPos.y, centerPos.x),
    level,
    draggable: true,
    scrollwheel: true,
    disableDoubleClickZoom: true,
  };
  const map = new kakao.maps.Map(mapContainer, mapOption);
  return map;
};

export const makeClusterer = (map, minLevel: number) => {
  const clusterer = new kakao.maps.MarkerClusterer({
    map,
    averageCenter: true,
    minLevel,
  });
  return clusterer;
};

export const makeMarker = (position, content) => {
  const marker = new kakao.maps.CustomOverlay({
    clickable: true,
    position,
    content,
  });

  return marker;
};

const removeOverlay = (className: string) => {
  const oldModalAd = document.querySelector(`.${className}`) as HTMLElement;
  const oldParentNode = oldModalAd?.parentNode?.parentNode as HTMLElement;
  if (oldParentNode) {
    oldParentNode.style.zIndex = '0';
  }
  oldModalAd?.remove();
};

const addOverlay = (overlay: HTMLElement, content: string) => {
  overlay.insertAdjacentHTML('beforeend', content);
  const parentNode = overlay.parentNode as HTMLElement;
  parentNode.style.zIndex = '10';
};

export const handleClickMarker = ({
  overlay,
  className,
  content,
}: {
  overlay: HTMLElement;
  className: string;
  content: string;
}) => {
  removeOverlay(className);
  addOverlay(overlay, content);
};

export const searchPlaces = (map, code, successCallback) => {
  const ps = new kakao.maps.services.Places(map);
  const placesSearchCB = (data, status) => {
    if (status === kakao.maps.services.Status.OK) {
      successCallback(data);
    }
  };
  ps.categorySearch(code, placesSearchCB, { useMapBounds: true });
};

export const getCenterPos = (map, successCallback) => {
  kakao.maps.event.addListener(map, 'dragend', () => {
    const latlng = map.getCenter();
    const x = latlng.getLng();
    const y = latlng.getLat();
    successCallback({ x, y });
  });
};

export const getCurrentPos = (locationLoadSuccess, locationLoadError?: typeof Function) => {
  const successCallback = (pos) => {
    const currentPos = new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
    locationLoadSuccess(currentPos);
  };

  const errorCallback = () => {
    // eslint-disable-next-line no-alert
    alert('위치 정보를 가져오는데 실패했습니다.');
    locationLoadError?.();
  };

  return navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
};

export const getHTML = {
  modalAd: (className: string, { ...props }: Accomodation, totalCost: number) => {
    return `
     <div class=${className}>
      <img src=${props.thumbnail} alt='selected-ad-img'/>
      <div class='detail'>
        <div class='info'>
          <address>
            <p>${props.place_name}</p>
            <p>${props.road_address_name}</p>
            <a href=${`tel:${props.phone}`}>${props.phone}</a>
          </address>
          <img class='wish-icon' src=${wish} alt='wish-icon'/>
        </div>
        <p class='selected-ad-cost'>${`총액 ₩${totalCost.toLocaleString()}`}</p>
      </div>
     </div> 
      `;
  },
  marker: ({ ...props }: Accomodation) => {
    return `<div class="overlay" data-id=${props.id} onclick="clickOverlay(this)">
                <span class='cost'>
                 ₩${props.cost.toLocaleString()}원
                </span>
            </div>`;
  },
};
