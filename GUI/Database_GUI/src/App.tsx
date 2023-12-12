import { useEffect } from "react";
import "./App.css";
import { data } from "./components";
function App() {
  useEffect(() => {}, []);

  return (
    <>
      <h1 className="title">University DB</h1>
      <div className="main">
        <select id="">
          <option hidden>Select Table</option>
          <option value="student">Student</option>
          <option value="course">Courses</option>
        </select>
        <input type="text" />
        <div className="btns">
          <button>search</button>
          <button>save</button>
          <button>Reset</button>
        </div>
      </div>
    </>
  );
}

export default App;
