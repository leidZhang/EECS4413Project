import React, {useEffect, useState} from "react";
import "./AddressForm.css";
import {Col, Form, Row} from "react-bootstrap";
import Button from "react-bootstrap/Button";
import axios from "axios";
import cookie from "react-cookies";

const AddressForm = ({ onToggleNext }) => {
    const[provinceList, setProvinceList] = useState(null);

    useEffect(() => { // get province list
        delete axios.defaults.headers.common['Authorization']; // remove token in the request header

        axios.get(`https://geogratis.gc.ca/services/geoname/en/codes/province`).then(res => {
            const data = res.data;
            setProvinceList(data['definitions']);
        }).catch(error => {
            setProvinceList([]);
            console.log(error);
        });

        const token = cookie.load('user'); // reload token after the request
        axios.defaults.headers.common['Authorization'] = `Token ${token}`;
    }, []);

    return (
        <Form className="form">
            <Row className="form-row" id="checkout-form-row">
                <Col>
                    <Form.Label>First Name</Form.Label>
                    <Form.Control type="text" placeholder="Enter your first name"/>
                </Col>
                <Col>
                    <Form.Label>Last Name</Form.Label>
                    <Form.Control type="text" placeholder="Enter your last name"/>
                </Col>
            </Row>
            <Row className="form-row" id="checkout-form-row">
                <Col>
                    <Form.Label>Phone Number</Form.Label>
                    <Form.Control type="text" placeholder="Enter your phone number"/>
                </Col>
            </Row>
            <Row className="form-row" id="checkout-form-row">
                <Col>
                    <Form.Label>Address</Form.Label>
                    <Form.Control type="text" placeholder="Enter your street address"/>
                </Col>
            </Row>
            <Row className="form-row" id="checkout-form-row">
                <Col>
                    <Form.Label>Address 2</Form.Label>
                    <Form.Control type="text" placeholder="Apartment, studio, or floor"/>
                </Col>
            </Row>
            <Row className="form-row" id="checkout-form-row">
                <Col>
                    <Form.Label>City</Form.Label>
                    <Form.Control type="text" placeholder="Enter city name"/>
                </Col>
                <Col>
                    <Form.Label>Province</Form.Label>
                    <Form.Select>
                        {provinceList && provinceList.map(province => (
                            <option key={province['term']}>{province['term']}</option>
                        ))}
                    </Form.Select>
                </Col>
                <Col>
                    <Form.Label>Postal Code</Form.Label>
                    <Form.Control type="text" placeholder="Enter postal code"/>
                </Col>
            </Row>
            <div className="button-container">
                <Button className="form-button" id="address-button" onClick={onToggleNext}>Confirm</Button>
            </div>
        </Form>
    );
};

export default AddressForm;