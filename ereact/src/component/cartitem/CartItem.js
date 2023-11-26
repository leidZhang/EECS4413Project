import React, {useState} from "react";
import './CartItem.css';
import {CardBody, CardImg, CardSubtitle, CardText, ListGroupItem} from "react-bootstrap";
import {Link, useNavigate} from "react-router-dom";
import axios from "axios";

const OrderItem = ({ data, reRender }) => {
    const navigate = useNavigate();
    // data received from parent component
    const {id, product, quantity} = data;
    const [qty, setQty] = useState(quantity);

    const handleUpdate = (event) => {
        // update the quantity
        event.preventDefault();

        const cartItem = {
            product_id: product.id,
            quantity: qty,
        };

        axios.put(`/api/shopping-cart/cart/products/${id}`, cartItem).then(res => {
            console.log(res.data);
            reRender();
        }).catch(error => {
            console.log(error);
        });
    }

    const handleDelete = (event) => {
        // delete the item
        event.preventDefault();

        axios.delete(`/api/shopping-cart/cart/products/${id}`).then(res => {
            console.log(res.data);
            reRender();
        }).catch(error => {
            console.log(error);
        });
    };

    const handleInput = (event) => {
        setQty(event.target.value);
    }

    const handleNavigate = () => {
        navigate(`/product/${product.id}`);
    }

    return (
        <ListGroupItem id="cart-item">
            <CardImg className="cart-item-img" src={product.image} />
            <CardBody className="cart-item-text-container">
                <CardSubtitle id="cart-item-title" onClick={() => handleNavigate()}>
                    {product.title}
                </CardSubtitle>
                <CardText className="cart-item-text">
                    Price: ${product.price}
                </CardText>
                <CardText className="cart-item-text">
                    Qty:&nbsp;
                    <input
                        type="text"
                        className="cart-item-qty"
                        value={qty}
                        onChange={handleInput}
                    />
                </CardText>
                <CardText className="cart-item-text">
                    <Link onClick={handleUpdate}>Update</Link> | <Link onClick={handleDelete}>Delete</Link>
                </CardText>
            </CardBody>
        </ListGroupItem>
    )
};

export default OrderItem;