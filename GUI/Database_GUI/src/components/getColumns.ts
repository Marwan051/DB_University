import { data } from ".";
type Column = {
    Header: string;
    accessor:string;
  };
const getColumns = (data:data) => {
  // Get the first object from the data
  const firstObject = Object.values(data)[0];

  // Generate the columns based on the keys in the first object
  const columns: Column[] = Object.keys(firstObject).map(key => ({
    Header: key,
    accessor: key
  }));

  return columns;
};

export default getColumns;
