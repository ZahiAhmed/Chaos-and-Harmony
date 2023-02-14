import React, { useState, useEffect} from "react";
import ServerIcon from "../ServerIcon";
import { useSelector } from "react-redux";
import { useHistory } from "react-router-dom";
import { Modal } from "../../context/Modal";
import NewServerForm from "./NewServerForm";
import { Link } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import "./ServerSidebar.css";

const ServerSidebar = ({ servers }) => {
  const sessionUser = useSelector((state) => state.session.user);
  const history = useHistory();
  const [showModal, setShowModal] = useState(false);

  const handleClick = (e) => {
    e.preventDefault();
    history.push(`/${sessionUser.username}`);
  };

  return (
    <>
      <aside className="servers">
        <button
          id="home-button"
          className="server-icon"
          onClick={handleClick}
        ><FontAwesomeIcon icon="fa-brands fa-discord" /></button>
        <hr id="line"></hr>
        {servers.map((server, i) => (
          <ServerIcon key={i} server={server} />
        ))}
        <button id="addserver" className="server-icon" onClick={() => setShowModal(true)}>
          +
        </button>
        <Link to="/explore">
          <button id="redirect-explore" className="server-icon"> </button>
        </Link>
      </aside>
      {showModal && (
        <Modal
          modal={"form-positioning"}
          modalBackground={"form-modal-background"}
          modalContent={"form-content"}
          onClose={() => setShowModal(false)}
        >
          <NewServerForm sessionUser={sessionUser} />
        </Modal>
      )}
    </>
  );
};

export default ServerSidebar;
