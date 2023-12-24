import { useState, useEffect } from "react";
import { AgGridReact } from "ag-grid-react";
import "ag-grid-community/styles/ag-grid.css";
import "ag-grid-community/styles/ag-theme-material.css";
import "ag-grid-community/styles/ag-theme-quartz.css";
import getColumns from "./getColumns";
import { GridApi, GridReadyEvent } from "ag-grid-community";
import { AddEntry, EditEntry, editData } from ".";
import edit from "../assets/edit.png";
interface TableProps {
  data: any;
  filterText: string;
  fetchData: () => void;
}
const Table = ({ data, filterText, fetchData }: TableProps) => {
  const [gridApi, setGridApi] = useState<GridApi>();
  const [rowData, setRowData] = useState<Object[]>([]);
  const [isDataLoaded, setIsDataLoaded] = useState<boolean>(false);
  const [showAdd, setShowAdd] = useState(false);
  const [addColumns, setAddColumns] = useState<string[]>([]);
  const [showEdit, setShowEdit] = useState(false);

  const [editData, setEditData] = useState<editData>({
    keys: [],
    values: [],
  });

  useEffect(() => {
    setRowData(Object.values(data));
    setIsDataLoaded(true);
  }, [data]);

  useEffect(() => {
    if (gridApi && isDataLoaded) {
      gridApi.sizeColumnsToFit();
    }
  }, [gridApi, isDataLoaded, rowData]);

  const onGridReady = (params: GridReadyEvent) => {
    setGridApi(params.api);
  };

  const closeAddDialog = () => {
    setShowAdd(false);
    fetchData();
  };
  const closeEditDialog = () => {
    setShowEdit(false);
  };
  const addEntry = async () => {
    try {
      await fetch(`http://localhost:8080/university_db/addEntry.php`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
      })
        .then((response) => response.json())
        .then((fetchedData) => {
          if (fetchedData === null || fetchedData[0] === "none found") {
            console.log("Fetched data is null");
            return;
          } else {
            setAddColumns(fetchedData);
            setShowAdd(true);
          }
        })
        .catch((error) => {
          console.error("Error fetching data:", error);
        });
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  };
  async function getEditdata() {
    try {
      await fetch(`http://localhost:8080/university_db/getEdit.php`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ editData: gridApi?.getSelectedRows()[0] }),
        credentials: "include",
      })
        .then((response) => response.json())
        .then((fetchedData) => {
          if (fetchedData === null || fetchedData[0] === "none found") {
            console.log("Fetched data is null");
            return;
          } else {
            setEditData(fetchedData);
            setShowEdit(true);
          }
        })
        .catch((error) => {
          console.error("Error fetching data:", error);
        });
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }

  return (
    <div className="box">
      {isDataLoaded ? (
        <>
          <div className="btns">
            <button className="btn" onClick={() => gridApi?.sizeColumnsToFit()}>
              Resize columns
            </button>
            <button className="btn" onClick={() => addEntry()}>
              Add Entry
            </button>
            {showAdd && (
              <AddEntry
                isOpen={showAdd}
                closeDialog={closeAddDialog}
                addColumns={addColumns}
              />
            )}
            {showEdit && (
              <EditEntry
                isOpen={showEdit}
                closeDialog={closeEditDialog}
                editData={editData}
                row={gridApi?.getSelectedRows()[0]}
              />
            )}
          </div>
          <AgGridReact
            className="ag-theme-quartz-dark"
            rowData={rowData}
            columnDefs={[
              {
                headerName: "Open Pop-up",
                field: "openPopup",
                cellRenderer: () => (
                  <button
                    onClick={async () => {
                      await getEditdata();

                      //setShowEdit(true);
                    }}
                  >
                    <img
                      src={edit}
                      alt="Open Pop-up"
                      style={{ width: "20px", height: "20px" }}
                    />
                  </button>
                ),
              },
              ...getColumns(data),
            ]}
            onGridReady={onGridReady}
            pagination
            paginationPageSize={20}
            quickFilterText={filterText}
            rowSelection="single"
          />
        </>
      ) : (
        <p>Loading...</p>
      )}
    </div>
  );
};

export default Table;
