import React from "react";
import './Order.css';
import {Accordion, Card, CardText, CardTitle, ListGroup} from "react-bootstrap";
import CartItemList from "../../component/cartitemlist/CartItemList";

const Order = () => {
    return (
        // part 1 complete, 2 parts waiting
        <div className="card-container">
            <Accordion defaultActiveKey="3" id="cart-accordion">
                <Accordion.Item eventKey="0">
                    <Accordion.Header id="cart-title">Shopping Cart</Accordion.Header>
                    <Accordion.Body id="cart-form-body">
                        <CartItemList />
                    </Accordion.Body>
                </Accordion.Item>
                <Accordion.Item eventKey="1">
                    <Accordion.Header id="cart-title">Address</Accordion.Header>
                    <Accordion.Body>Address</Accordion.Body>
                </Accordion.Item>
                <Accordion.Item eventKey="2">
                    <Accordion.Header id="cart-title">Payment Method</Accordion.Header>
                    <Accordion.Body>
                        Payment
                    </Accordion.Body>
                </Accordion.Item>
                <Accordion.Item eventKey="3">
                    <Accordion.Header id="cart-title">Order Summary</Accordion.Header>
                    <Accordion.Body>
                        Payment
                    </Accordion.Body>
                </Accordion.Item>
            </Accordion>
        </div>
    )
};

export default Order;