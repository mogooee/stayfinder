const addHyphenToDate = (date: string) => date.replace(/^(\d{4})(\d{2})(\d{2})$/, `$1-$2-$3`);

export const getDateDiff = (startDay: string, endDay: string) => {
  const date1 = new Date(addHyphenToDate(startDay)).getTime();
  const date2 = new Date(addHyphenToDate(endDay)).getTime();
  const day = 1000 * 60 * 60 * 24;
  return Math.abs(date1 - date2) / day;
};

const today = new Date();
const tomorrow = new Date(new Date().setDate(today.getDate() + 1));
const getISOString = (date: Date): string => date.toISOString().slice(0, 10);

export const getDate = {
  today: getISOString(today),
  tomorrow: getISOString(tomorrow),
};
