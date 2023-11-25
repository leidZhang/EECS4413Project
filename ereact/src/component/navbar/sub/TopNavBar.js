import React from "react";
import Navbar from "react-bootstrap/Navbar";
import {Link, useNavigate} from "react-router-dom";
import Container from "react-bootstrap/Container";
import InputGroup from "react-bootstrap/InputGroup";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import Nav from "react-bootstrap/Nav";
import OverlayTrigger from "react-bootstrap/OverlayTrigger";
import cookie from "react-cookies";
import axios from "axios";
import Popover from "react-bootstrap/Popover";

const TopNavBar = () => {
    const navigate = useNavigate();

    // logout function
    const handleLogout = (event) => {
        const token = cookie.load('user');

        axios.post(`auth/token/logout/`).then(res => {
            cookie.remove('user');
            delete axios.defaults.headers.common['Authorization'];
            console.log(res.data);
            console.log('logout!');
        }).catch(error => {
            console.log(error.response.data)
        });
    }

    // temp popout menu, put components related to log in and logout here
    const renderPopover = (props) => (
        <Popover id="popover-basic" {...props}>
            <Popover.Header as="h3">Temp Popover</Popover.Header>
            <Popover.Body>
                <Button onClick={() => navigate('/login')}>Log in</Button>
                <Button onClick={handleLogout}>Logout</Button>
            </Popover.Body>
        </Popover>
    );

    return (
        <Navbar className="bg-body-tertiary">
            <Navbar.Brand id="brand" className="nav-bar-component" as={Link} to="/">
                E-Commerce
            </Navbar.Brand>
            <Container id="search">
                <InputGroup>
                    <Form.Control
                        placeholder="Search e-commerce website"
                        aria-label="Search e-commerce website"
                        aria-describedby="basic-addon2"
                    />
                    <Button variant="outline-secondary" id="button-addon2">
                        Search
                    </Button>
                </InputGroup>
            </Container>
            <Nav>
                <OverlayTrigger
                    placement="bottom"
                    delay={{ show: 250, hide: 400 }}
                    trigger='click' rootClose
                    overlay={renderPopover}
                >
                    <Nav.Link>My Account</Nav.Link>
                </OverlayTrigger>
                <Nav.Link as={Link} to="/cart">Cart</Nav.Link>
                <Nav.Link id="order-link" as={Link} to="/order">Order</Nav.Link>
            </Nav>
        </Navbar>
    );
}

export default TopNavBar;