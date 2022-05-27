type ValueType = {
  checkIn: number;
  checkOut: number;
  minPrice: number;
  maxPrice: number;
  adult: number;
  teenager: number;
  child: number;
};

interface SearchType {
  title: string & string[];
  defaultValue: string;
  value: ValueType;
}

export interface SectionProps {
  search: SearchType;
  addSearch: object;
  value: string;
}
