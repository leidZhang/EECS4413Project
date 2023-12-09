import React, {useEffect, useState} from "react";
import Navbar from "react-bootstrap/Navbar";
import {Link, useLocation, useNavigate, useSearchParams} from "react-router-dom";
import Container from "react-bootstrap/Container";
import InputGroup from "react-bootstrap/InputGroup";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import Nav from "react-bootstrap/Nav";
import OverlayTrigger from "react-bootstrap/OverlayTrigger";
import cookie from "react-cookies";
import axios from "axios";
import Popover from "react-bootstrap/Popover";
import {DropdownButton, DropdownItem} from "react-bootstrap";

const TopNavBar = () => {
    const navigate = useNavigate();
    const [searchParams] = useSearchParams();
    const [option, setOption] = useState("all");
    const [optionList, setOptionList] = useState(null);
    const [query, setQuery] = useState("");
    const [category, setCategory] = useState("");

    useEffect(() =>{
        axios.get(`/api/data-access/categories`).then(res => {
            const data = res.data;
            setOptionList(data);

            // init option
            const selectedCategory = searchParams.get("category");
            if (selectedCategory != null) {
                setOption(selectedCategory);
                setCategory(selectedCategory);
            } else {
                setOption("all");
                setCategory("all");
            }
        }).catch(error => {
            console.error(error);
        })
    }, [searchParams]);

    // logout function
    const handleLogout = (event) => {
        axios.post(`auth/token/logout/`).then(res => {
            cookie.remove('user'); // remove token in the cookie
            delete axios.defaults.headers.common['Authorization']; // remove token in the request header
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

    const handleOption = (value) => {
        setOption(value);
        setCategory(value);
    }

    const handleSearch = () => {
       // search button, more functions will be added
       let search = `search=${query}`;
       if (category !== "all") { // handle category
            search += `&category=${category}`;
       }

       navigate(`/search-result?${search}`);
    };

    return (
        <Navbar className="bg-body-tertiary">
            <Navbar.Brand id="brand" className="nav-bar-component" as={Link} to="/">
                E-Commerce
            </Navbar.Brand>
            <Container id="search">
                <InputGroup>
                    <DropdownButton variant="outline-secondary" title={option}>
                        <DropdownItem key="0" onClick={() => handleOption("all")}>
                            all
                        </DropdownItem>
                        {optionList && optionList.map(item => (
                            <DropdownItem key={item['id']} onClick={() => handleOption(item['title'])}>
                                {item['title']}
                            </DropdownItem>
                        ))}
                    </DropdownButton>
                    <Form.Control
                        placeholder="Search e-commerce website"
                        aria-label="Search e-commerce website"
                        aria-describedby="basic-addon2"
                        value={query}
                        onChange={(e) => setQuery(e.target.value)}
                    />
                    <Button variant="outline-secondary" id="button-addon2" onClick={() => handleSearch()}>
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
                <Nav.Link id="order-link" as={Link} to="/order-history">Orders</Nav.Link>
            </Nav>
        </Navbar>
    );
}

export default TopNavBar;