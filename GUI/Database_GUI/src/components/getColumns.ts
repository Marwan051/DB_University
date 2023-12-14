import type {student , course , instructor , Grade , Department} from './types'
type Column = {
  headerName: string;
  field: string;
};
type column_data = student | course | instructor | Grade | Department
const getColumns = (data:column_data) : Column[] => {
  // Get the first object from the data
  const firstObject = Object.values(data)[0];

  // Generate the columns based on the keys in the first object
  const columns: Column[] = Object.keys(firstObject).map(key => ({
    headerName: key,
    field: key
  }));

  return columns;
};

export default getColumns;
