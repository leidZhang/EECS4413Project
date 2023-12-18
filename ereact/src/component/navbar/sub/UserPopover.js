import React, {useEffect, useState} from "react";
import {Link, useNavigate} from "react-router-dom";
import axios from "axios";
import cookie from "react-cookies";
import Popover from "react-bootstrap/Popover";
import {Col, Row} from "react-bootstrap";

const UserPopover = () => {
    // logout function
    const handleLogout = (event) => {
        axios.post(`auth/token/logout/`).then(res => {
            cookie.remove('user'); // remove token in the cookie
            delete axios.defaults.headers.common['Authorization']; // remove token in the request header
            console.log('logout!');
            // refresh page
            window.location.reload();
        }).catch(error => {
            console.log(error.response.data)
        });
    };

    return (
        <div style={{textAlign: "center"}}>
            <Popover.Body>
                <Row style={{margin: "5px"}}>
                    <Col><Link to='/profile'>My Profile</Link></Col>
                </Row>
                <Row>
                    <Col><Link onClick={handleLogout}>Sign out</Link></Col>
                </Row>
            </Popover.Body>
        </div>
    );
};

export default UserPopover;