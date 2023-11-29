import React, {useState} from "react";
import './Checkout.css';
import {Accordion, Card} from "react-bootstrap";
import Button from "react-bootstrap/Button";
import AddressForm from "../../../component/addressForm/AddressForm";
import PaymentForm from "../../../component/paymentForm/PaymentForm";
import OrderSummaryForm from "../../../component/orderSummaryForm/OrderSummaryForm";

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
                    <Accordion.Header id="cart-title">Shipping Address</Accordion.Header>
                    <Accordion.Body>
                        <div className="card-container">
                            <Card className="checkout-card">
                                <AddressForm onToggleNext={handleToggleNext} />
                            </Card>
                        </div>
                    </Accordion.Body>
                </Accordion.Item>
                <Accordion.Item eventKey="1">
                    <Accordion.Header id="cart-title">Payment Method</Accordion.Header>
                    <Accordion.Body>
                        <div className="card-container">
                            <Card className="checkout-card">
                                <PaymentForm onToggleNext={handleToggleNext} onTogglePrev={handleTogglePrev}/>
                            </Card>
                        </div>
                    </Accordion.Body>
                </Accordion.Item>
                <Accordion.Item eventKey="2">
                    <Accordion.Header id="cart-title">Order Summary</Accordion.Header>
                    <Accordion.Body>
                        <div className="card-container">
                            <Card className="checkout-card">
                                <OrderSummaryForm onTogglePrev={handleTogglePrev}/>
                            </Card>
                        </div>
                    </Accordion.Body>
                </Accordion.Item>
            </Accordion>
        </div>
    )
};

export default Checkout;