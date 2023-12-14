import { useEffect } from "react";
import { Table } from ".";

const Selection = () => {
  useEffect(() => {}, []);
  return (
    <>
      <p className="title">University DB</p>
      <div className="main">
        <select id="">
          <option hidden>Select Table</option>
          <option value="student">Student</option>
          <option value="course">Courses</option>
        </select>
        <input type="text" />
        <div className="btns">
          <button>Search</button>
          <button>Save</button>
        </div>
      </div>
      <Table />
    </>
  );
};

export default Selection;
