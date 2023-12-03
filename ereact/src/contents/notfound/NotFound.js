import './NotFound.css';
import React from "react";
import { Link } from "react-router-dom";

const NotFound = () => { // implement 404 page
    return (
        <div className="not-found">
            <div>
                <h2>404 Not Found</h2>
                <p>Have a break?</p>
                <p>That page cannot be found</p>
                <Link to="/ ">Back to the homepage...</Link>
            </div>
        </div>
    );
}

export default NotFound;