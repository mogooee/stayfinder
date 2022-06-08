export default {
  period: {
    title: ['체크인', '체크아웃'],
    defaultValue: '날짜입력',
  },
  price: {
    title: '요금',
    defaultValue: '금액대 설정',
  },
  personnel: {
    title: '인원',
    defaultValue: '게스트 추가',
    range: {
      min: 0,
      max: 10,
    },
    value: {
      adult: {
        title: '성인',
        description: '만 13세 이상',
      },
      teenager: {
        title: '어린이',
        description: '만 2~12세',
      },
      child: {
        title: '유아',
        description: '만 2세 미만',
      },
    },
  },
};
