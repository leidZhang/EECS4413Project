import React, {useEffect, useState} from "react";
import {Card, CardText, ListGroup} from "react-bootstrap";
import CartItem from "../cartitem/CartItem";
import axios from "axios";

const CartItemList = () => {
    const [itemList, setItemList] = useState([]);
    const [total, setTotal] = useState(0.00);

    useEffect(() => {
        renderCart();
        renderTotal();
    }, []);

    const handleRerender = () => {
        renderCart();
        renderTotal();
    }

    const renderCart = () => {
        axios.get(`api/shopping-cart/cart/products`).then(res => {
            const data = res.data
            setItemList(data);
            console.log(data);
        }).catch(error => {
            console.log(error);
        });
    };

    const renderTotal = () => {
        axios.get(`api/shopping-cart/cart`).then(res => {
            const data = res.data['results'][0];
            setTotal(data['total']);
        }).catch(error => {
            console.log(error);
        })
    }

    return (
        <Card className="cart-card">
            <ListGroup>
                {itemList.length > 0 && itemList.map(item => (
                    <CartItem
                        data={item}
                        key={item.id}
                        reRender={handleRerender}
                    />
                ))}
            </ListGroup>
            <CardText className="cart-item-text" id="cart-total-price">
                Total Price: ${total}
            </CardText>
        </Card>
    );
};

export default CartItemList;