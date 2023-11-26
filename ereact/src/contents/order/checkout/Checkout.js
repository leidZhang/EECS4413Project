import React, {useState} from "react";
import './Checkout.css';
import {Accordion, Card} from "react-bootstrap";
import Button from "react-bootstrap/Button";

const Checkout = () => {
    const [activeKey, setActiveKey] = useState("0");

    const handleToggleNext = () => {
        switch (activeKey) {
            case "0":
                setActiveKey("1");
                break;
            case "1":
                setActiveKey("2");
                break;
            default:
                break;
        }
    }

    const handleTogglePrev = () => {
        switch (activeKey) {
            case "2":
                setActiveKey("1");
                break;
            case "1":
                setActiveKey("0");
                break;
            default:
                break;
        }
    }

    return (
        <div className="card-container">
            <Accordion defaultActiveKey="0" activeKey={activeKey} id="cart-accordion">
                <Accordion.Item eventKey="0">
                    <Accordion.Header id="cart-title">Address</Accordion.Header>
                    <Accordion.Body>
                        Address
                        <div className="button-container">
                            <Button className="confirm-button" onClick={handleToggleNext}>Confirm</Button>
                        </div>
                    </Accordion.Body>
                </Accordion.Item>
                <Accordion.Item eventKey="1">
                    <Accordion.Header id="cart-title">Payment Method</Accordion.Header>
                    <Accordion.Body>
                        Payment
                        <div className="button-container">
                            <Button className="confirm-button" onClick={handleToggleNext}>Confirm</Button>
                            <Button className="confirm-button" onClick={handleTogglePrev}>Back</Button>
                        </div>
                    </Accordion.Body>
                </Accordion.Item>
                <Accordion.Item eventKey="2">
                    <Accordion.Header id="cart-title">Order Summary</Accordion.Header>
                    <Accordion.Body>
                        Payment
                        <div className="button-container">
                            <Button className="confirm-button">Place Order</Button>
                            <Button className="confirm-button" onClick={handleTogglePrev}>Back</Button>
                        </div>
                    </Accordion.Body>
                </Accordion.Item>
            </Accordion>
        </div>
    )
};

export default Checkout;