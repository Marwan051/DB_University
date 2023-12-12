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
      const url = "http://localhost:8080/atsht/submitSheet.php";
      const bodyData = [];
      const columnDefs = gridApi.getColumnDefs();

      for (let i = 0; i < gridApi.getDisplayedRowCount(); i++) {
        const rowNode = gridApi.getDisplayedRowAtIndex(i);
        const rowData: { id: any; dates: any[] } = {
          id: rowNode?.data.id,
          dates: [],
        };
        if (columnDefs && rowNode) {
          for (const columnDef of columnDefs) {
            if ("field" in columnDef && columnDef.field != undefined) {
              const cellValue = rowNode.data[columnDef.field];
              if (cellValue === false) {
                // Push the date into the dates array
                rowData.dates.push(columnDef.field);
              }
            }
          }

          // Check if the dates array is not empty
          if (rowData.dates.length > 0) {
            bodyData.push(rowData);
          }
        } else {
          console.log("gridApi not ready");
        }
      }
      fetch(url, {
        method: "POST",
        credentials: "include",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(bodyData),
      })
        .then(async (response) => {
          response = await response.json();
          console.log(response);
        })
        .catch((error) => {
          console.error("Error:", error);
        });
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
