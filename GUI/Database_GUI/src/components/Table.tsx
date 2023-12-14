import { useState } from "react";

import { AgGridReact } from "ag-grid-react"; // the AG Grid React Component
import "ag-grid-community/styles/ag-grid.css"; // Core grid CSS, always needed
import "ag-grid-community/styles/ag-theme-alpine.css"; // Optional theme CSS
import getColumns from "./getColumns";
import { GridApi, GridReadyEvent } from "ag-grid-community";
import { data } from ".";
const Table = ({ data }: data) => {
  const [gridApi, setGridApi] = useState<GridApi>();
  const onGridReady = (params: GridReadyEvent) => {
    setGridApi(params.api);
    params.api.sizeColumnsToFit();
  };

  const [rowData] = useState([data]);

  const [columnDefs] = useState(getColumns(data));

  const submit = () => {
    if (gridApi) {
    }
  };

  return (
    <div className="ag-theme-alpine w-4/5 h-full">
      <AgGridReact
        rowData={rowData}
        columnDefs={columnDefs}
        suppressCellFocus
        onGridReady={onGridReady}
      />
      <button className="subbtn" onClick={submit}>
        submit
      </button>
    </div>
  );
};
export default Table;
