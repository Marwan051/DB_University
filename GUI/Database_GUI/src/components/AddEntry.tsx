import { useState } from "react";
import Modal from "react-modal";
interface TableProps {
  isOpen: boolean;
  closeDialog: () => void;
  addColumns: string[];
}

const AddEntry = ({ isOpen, closeDialog, addColumns }: TableProps) => {
  const handleChange = (e: { target: { id: any; value: any } }) => {
    setFormData({
      ...formData,
      [e.target.id]: e.target.value,
    });
  };
  const [formData, setFormData] = useState({});
  const [message, setMessage] = useState("");
  const submit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    try {
      await fetch(`http://localhost:8080/university_db/submitAdd.php`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ addData: formData }),
        credentials: "include",
      })
        .then((response) => response.json())
        .then((fetchedData) => {
          if (fetchedData === null) {
            console.log("Fetched data is null");
            return;
          } else {
            setMessage(fetchedData["message"]);
          }
        })
        .catch((error) => {
          console.error("Error fetching data:", error);
        });
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  };
  return (
    <Modal
      isOpen={isOpen}
      style={{
        overlay: {
          backgroundColor: "rgba(0, 0, 0, 0.75)",
        },
        content: {
          gap: "10px",
          top: "50%",
          left: "50%",
          right: "auto",
          bottom: "auto",
          marginRight: "-50%",
          transform: "translate(-50%, -50%)",
          backgroundColor: "black",
          color: "white",
        },
      }}
      ariaHideApp={false}
    >
      <form
        action=""
        method="dialog"
        onSubmit={(e) => {
          submit(e);
        }}
      >
        <div className="dialog">
          {addColumns?.map((column) => {
            const chars = column.slice(0, 4).toLowerCase();

            return (
              <div className="input-field">
                <label htmlFor={column}>{column}</label>
                <input
                  type={chars === "date" ? "date" : "text"}
                  id={column}
                  onChange={handleChange}
                />
              </div>
            );
          })}
          <div className="btns" style={{ marginTop: "20px" }}>
            <button type="submit" className="btn">
              Add Entry
            </button>
            <button
              className="btn"
              onClick={() => {
                closeDialog();
              }}
            >
              Close
            </button>
          </div>
          <p>{message}</p>
        </div>
      </form>
    </Modal>
  );
};

export default AddEntry;
