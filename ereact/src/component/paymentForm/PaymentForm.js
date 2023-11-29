import React, {useEffect, useState} from "react";
import {Col, Form, Row} from "react-bootstrap";
import Button from "react-bootstrap/Button";
import './PaymentForm.css';

const PaymentForm = ({onToggleNext, onTogglePrev}) => {
    const [paymentMethod, setPaymentMethod] = useState("Debit Card");

    const handlePaymentMethod = (event) => {
       setPaymentMethod(event.target.value);
    };

    return (
        <Form className="form">
            <Row className="form-row" id="checkout-form-row">
                <Col>
                    <Form.Label>Payment Method</Form.Label>
                    <Form.Select onChange={handlePaymentMethod}>
                        <option>Debit Card</option>
                        <option>Credit Card</option>
                    </Form.Select>
                </Col>
            </Row>
            <Row className="form-row" id="checkout-form-row">
                {paymentMethod === "Debit Card" ? (
                    // render debit card form
                    <>
                        <Col md={2}>
                            <Form.Label>From</Form.Label>
                            <Form.Select onChange={handlePaymentMethod}>
                                <option>Cheque</option>
                                <option>Saving</option>
                            </Form.Select>
                        </Col>
                        <Col>
                            <Form.Label>Debit Card Number</Form.Label>
                            <Form.Control type="text" placeholder="Enter your debit card number" />
                        </Col>
                        <Col>
                            <Form.Label>Debit Card Password</Form.Label>
                            <Form.Control type="password" placeholder="Enter your debit card password" />
                        </Col>
                    </>
                ) : (
                    // render credit card form
                    <>
                        <Col md={6}>
                            <Form.Label>Credit Card Number</Form.Label>
                            <Form.Control type="text" placeholder="Enter your credit card number" />
                        </Col>
                        <Col md={2}>
                            <Form.Label>CCV</Form.Label>
                            <Form.Control type="text" placeholder="Enter ccv" />
                        </Col>
                        <Col>
                            <Form.Label>Credit Card Expiry Date</Form.Label>
                            <Form.Control type="date" placeholder="Enter your credit card expiry date" />
                        </Col>
                    </>
                )}
            </Row>
            <div className="button-container" id="payment-buttons">
                <Button className="confirm-button" onClick={onToggleNext}>Confirm</Button>
                <Button className="confirm-button" onClick={onTogglePrev}>Back</Button>
            </div>
        </Form>
    );
};

export default PaymentForm;