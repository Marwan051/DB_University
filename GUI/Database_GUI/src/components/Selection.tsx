import { useEffect, useState } from "react";
import { Table, table_names } from ".";

const Selection = () => {
  const [selection, setSelection] = useState<String | null>(null);
  const [data, setData] = useState<any>(null);
  const [tableNames, setTableNames] = useState<table_names | null>(null);
  const [filterText, setFilterText] = useState("");
  useEffect(() => {
    const fetchTableNames = async () => {
      const fetchedData = await getTableNames();
      setTableNames(fetchedData);
    };
    fetchTableNames();
  }, []);

  useEffect(() => {
    const fetchData = async () => {
      if (selection === "Select Table" || selection === null) return;
      try {
        await fetch(`http://localhost:8080/university_db/get_table.php`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ table_name: selection }),
          credentials: "include",
        })
          .then((response) => response.json())
          .then((fetchedData) => {
            if (fetchedData === null || fetchedData[0] === "none found") {
              console.log("Fetched data is null");
              setData(null);
              return;
            } else {
              setData(fetchedData);
            }
          })
          .catch((error) => {
            console.error("Error fetching data:", error);
          });
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    };

    fetchData();
  }, [selection]);

  async function getTableNames(): Promise<table_names | null> {
    try {
      const response = await fetch(
        `http://localhost:8080/university_db/getTableNames.php`,
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({}),
          credentials: "include",
        }
      );

      const fetchedData = await response.json();

      if (fetchedData === null || fetchedData[0] === "none found") {
        console.log("Fetched data is null");
        return null;
      } else {
        return fetchedData;
      }
    } catch (error) {
      console.error("Error fetching table names: ", error);
      return null;
    }
  }
  return (
    <>
      <div className="main">
        <p className="title">University DB</p>

        <select id="tables" onChange={(e) => setSelection(e.target.value)}>
          <option hidden>Select Table</option>
          {tableNames?.table_names.map((table_name: String, index: number) => (
            <option key={index} value={table_name.toString()}>
              {table_name}
            </option>
          ))}
        </select>
        <input
          type="text"
          value={filterText}
          onChange={(e) => setFilterText(e.target.value)}
        />

        {selection !== null ? (
          data !== null ? (
            <Table data={data} filterText={filterText} />
          ) : (
            <h1>Table is empty</h1>
          )
        ) : (
          <h1>Please choose a table</h1>
        )}
      </div>
    </>
  );
};

export default Selection;
