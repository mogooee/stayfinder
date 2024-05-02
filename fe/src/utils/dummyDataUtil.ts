import { type Accomodation } from 'components/accomodations/AccomodationListView';

const makeDummyData = (adsData, minCost, maxCost): Accomodation[] => {
  const MAX_RATING = 5;
  const MAX_REVIEW = 200;
  const imageCount = 16;

  return adsData.map((e) => {
    const rating = Math.floor(Math.random() * MAX_RATING);
    const cost = Math.floor(Math.random() * (maxCost - minCost) + minCost);
    const reviews = Math.floor(Math.random() * MAX_REVIEW);

    const randomId = Math.floor(Math.random() * (imageCount - 1) + 1);
    const thumbnail = `${process.env.PUBLIC_URL}/mock-img/accomodation-${randomId}.png`;

    return { ...e, rating, cost, reviews, thumbnail };
  });
};

export default makeDummyData;
