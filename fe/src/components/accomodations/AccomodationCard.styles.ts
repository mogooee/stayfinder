import styled from 'styled-components';

export const Container = styled.article`
  display: flex;
  gap: 20px;
  justify-content: space-between;
  min-height: 200px;
  padding: 20px 30px;
  border-bottom: 1px solid gray;
  cursor: pointer;
`;

export const Thumbnail = styled.img`
  width: 100%;
  height: 100%;
  border-radius: 10px;
  object-fit: cover;
`;

export const Detail = styled.div`
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
`;

export const Info = styled.div`
  display: grid;
  grid-template-columns: auto max-content;
  justify-content: space-between;
  flex-wrap: wrap;
`;

export const Address = styled.address`
  display: flex;
  flex-direction: column;
  gap: 8px;
`;

export const Cost = styled.p`
  text-align: end;
  color: #333;
  font-weight: 700;
  font-size: 14px;
  marginbottom: 8px;
`;

export const BottomInline = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  margin-top: 10px;
`;

export const Rating = styled.span`
  margin-right: 4px;
  color: #333;
  font-weight: 400;
  font-size: 12px;
`;

export const Reviews = styled.span`
  color: #828282;
  font-weight: 400;
  font-size: 12px;
`;

export const TotalCost = styled.span`
  color: #828282;
  font-weight: 400;
  font-size: 12px;
  text-decoration: underline;
`;
