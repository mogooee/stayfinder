const addHyphenToDate = (date: string) => date.replace(/^(\d{4})(\d{2})(\d{2})$/, `$1-$2-$3`);

const getDateDiff = (startDay: string, endDay: string) => {
  const date1 = new Date(addHyphenToDate(startDay)).getTime();
  const date2 = new Date(addHyphenToDate(endDay)).getTime();
  const day = 1000 * 60 * 60 * 24;
  return Math.abs(date1 - date2) / day;
};

export default getDateDiff;
