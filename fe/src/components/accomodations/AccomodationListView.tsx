/* eslint-disable react/jsx-props-no-spreading */
import React from 'react';
import { type Pos } from 'pages/Search/Search';
import AccomodationCard from './AccomodationCard';

export interface Accomodation {
  id: string;
  address_name: string;
  category_group_code: string;
  category_group_name: string;
  category_name: string;
  distance: string;
  phone: string;
  place_name: string;
  place_url: string;
  road_address_name: string;
  x: string;
  y: string;
  rating: number;
  cost: number;
  reviews: number;
  thumbnail: string;
}

interface AccomodationListViewProps {
  accomodations: Accomodation[];
  days: number;
  setCenterPos: React.Dispatch<React.SetStateAction<Pos>>;
  setMapLevel: React.Dispatch<React.SetStateAction<number>>;
}

function AccomodationListView({ accomodations, days, setCenterPos, setMapLevel }: AccomodationListViewProps) {
  return (
    <section style={{ flex: 1, overflow: 'hidden scroll' }}>
      {accomodations.map((ad) => (
        <AccomodationCard key={ad.id} setCenterPos={setCenterPos} setMapLevel={setMapLevel} {...{ ...ad, days }} />
      ))}
    </section>
  );
}

export default AccomodationListView;
