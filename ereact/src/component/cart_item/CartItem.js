import React from "react";
import './CartItem.css';

const OrderItem = ({ data }) => {
    const {product, quantity} = data;
    const {id, title, description, price, category, brand} = product;

    return (
        <div className="order-item">
            <p>This is the component for product { id }</p>
            <p>Title: { title } </p>
            <p>Description: { description } </p>
            <p>Price: { price }</p>
            <p>Category: { category }</p>
            <p>Brand: { brand }</p>
            <p>Quantity: {quantity}</p>
        </div>
    )
};

export default OrderItem;