import { useState } from "react";
import Modal from "react-modal";
import { editData } from ".";
interface TableProps {
  isOpen: boolean;
  closeDialog: () => void;
  row: Row;
  editData: editData;
}
interface Row {
  [key: string]: string;
}
interface FormData {
  [key: string]: any;
}

const EditEntry = ({ isOpen, closeDialog, editData, row }: TableProps) => {
  const id =
    Object.keys(row)[Object.keys(row).length - 1] === "phone_number"
      ? Object.values(row)[2]
      : Object.values(row)[0];
  const handleChange = (e: { target: { id: any; value: any } }) => {
    setFormData({
      ...formData,
      [e.target.id]: e.target.value,
    });
  };
  const [formData, setFormData] = useState<FormData>({});
  const [message, setMessage] = useState("");
  const submit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    try {
      await fetch(`http://localhost:8080/university_db/submitEdit.php`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ id: id, formData: formData }),
        credentials: "include",
      })
        .then((response) => response.json())
        .then((fetchedData) => {
          if (fetchedData === null || fetchedData[0] === "error") {
            console.log("Fetched data is null");
            return;
          } else {
            setMessage(fetchedData.message);
            if (fetchedData.message === "Data updated successfully") {
              Object.keys(formData).forEach((key) => {
                row[key] = formData[key];
              });
            }
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
          {Object.keys(editData.values[0]).map((column) => {
            const chars = column.slice(0, 4).toLowerCase();
            return (
              <div className="input-field">
                <label htmlFor={column}>{column}</label>
                <input
                  type={chars == "date" ? "date" : "text"}
                  id={column}
                  onChange={handleChange}
                  defaultValue={editData.values[0][column]}
                  disabled={editData.keys[0] == column}
                />
              </div>
            );
          })}

          <div className="btns" style={{ marginTop: "20px" }}>
            <button type="submit" className="btn">
              Submit
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

export default EditEntry;
