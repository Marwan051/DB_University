import type {student , course , instructor , Grade , Department} from './types'
type Column = {
  headerName: string;
  field: string;
  cellRenderer?: () => JSX.Element;
};
type column_data = student | course | instructor | Grade | Department
const getColumns = (data:column_data) : Column[] => {
  // Get the first object from the data
  const firstObject = Object.values(data)[0];
  
  const columns: Column[] = 
    
    Object.keys(firstObject).map((key, index) => ({
    headerName: key,
    field: key,
    hide: index === 0 ? true : false,
    suppressToolPanel: index === 0 ? true : false,
  }));
    return columns;
  
};

export default getColumns;
