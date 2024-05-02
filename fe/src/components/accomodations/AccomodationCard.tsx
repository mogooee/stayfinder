/* eslint-disable camelcase */
import React, { useState } from 'react';
import { type Pos } from 'pages/Search/Search';
import { ReactComponent as WishIcon } from '../../assets/icons/wish.svg';
import { ReactComponent as StarIcon } from '../../assets/icons/star.svg';
import { Accomodation } from './AccomodationListView';
import * as S from './AccomodationCard.styles';

type AccomodationCardProps = Accomodation & {
  days: number;
  setCenterPos: React.Dispatch<React.SetStateAction<Pos>>;
  setMapLevel: React.Dispatch<React.SetStateAction<number>>;
};

function AccomodationCard({ ...props }: AccomodationCardProps) {
  const {
    id,
    place_name,
    road_address_name,
    phone,
    rating,
    cost,
    reviews,
    thumbnail,
    days,
    setCenterPos,
    setMapLevel,
  } = props;
  const [isWished, setIsWished] = useState<boolean>(false);

  const handleWishClick: React.MouseEventHandler<SVGElement> = () => {
    setIsWished((prev) => !prev);
  };

  const handleClickCard = () => {
    setCenterPos({ x: +props.x, y: +props.y });
    setMapLevel(1);
  };

  return (
    <S.Container id={id} onClick={handleClickCard}>
      <picture style={{ flex: 1, height: '220px' }}>
        <S.Thumbnail src={thumbnail} alt="숙소 이미지" />
      </picture>
      <S.Detail>
        <S.Info>
          <S.Address>
            <p style={{ color: '#333', fontWeight: '400', fontSize: '16px' }}>{place_name}</p>
            <p style={{ color: '#828282', fontWeight: '400', fontSize: '14px' }}>{road_address_name}</p>
            <a style={{ color: '#333', fontWeight: '400', fontSize: '14px' }} href={`tel:${phone}`}>
              {phone}
            </a>
          </S.Address>
          <WishIcon
            style={{ cursor: 'pointer', fill: isWished ? '#E84C60' : 'transparent' }}
            onClick={handleWishClick}
          />
        </S.Info>
        <div>
          <S.Cost>{`₩${cost.toLocaleString()} / 박`}</S.Cost>
          <S.BottomInline>
            <div className="ratings" style={{ display: 'flex', alignItems: 'flex-end', gap: '2px' }}>
              <StarIcon style={{ marginRight: '1px' }} />
              <S.Rating>{rating}</S.Rating>
              <S.Reviews>{`(후기 ${reviews}개)`}</S.Reviews>
            </div>
            <S.TotalCost>{`총액 ₩${(days * cost).toLocaleString()}`}</S.TotalCost>
          </S.BottomInline>
        </div>
      </S.Detail>
    </S.Container>
  );
}

export default AccomodationCard;
