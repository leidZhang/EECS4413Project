import axios from "axios";
import './ProductDetial.css';
import React, { useEffect, useState } from "react";
import {useNavigate, useParams} from "react-router-dom";
import Button from "react-bootstrap/Button";

const ProductDetail = () => { // prototype detail page
    const navigate = useNavigate();
    const { id } = useParams();
    const [description, setDescription] = useState('');
    const [img, setImg] = useState('');
    const [price, setPrice] = useState('');
    const [title, setTitle] = useState('');
    const [brand, setBrand] = useState('');
    const [category, setCategory] = useState('');
    const [quantity, setQuantity] = useState(1);

    useEffect(() => {
        axios.get(`api/data-access/products/${id}`).then(res => {
            const data = res.data;
            console.log(data);

            setTitle(data['title']);
            setPrice(data['price']);
            setDescription(data['description']);
            setCategory(data['category']);
            setBrand(data['brand']);
            setImg(data['image']);
        }).catch(error => {
            console.log(error);
            navigate('/404');
        })
    });

    const handleAddToCart = (event) => {
        console.log("button clicked");

        const data = {
            product_id: id,
            quantity: quantity,
        }

        axios.post(`http://localhost:8000/api/shopping-cart/cart/products`, data).then(res => {
            console.log('Add to Checkout!');
        }).catch(error => {
            console.log(error);
        })
    }

    return (
        <div id="product-container" >
            <img src={img} className="product-detail-img" />
            <p>This is the page for { id } product's details</p>
            <p>Title: { title } </p>
            <p>Description: { description } </p>
            <p>Price: { price }</p>
            <p>Category: { category }</p>
            <p>Brand: { brand.title }</p>
            <p>QTY</p>
            <input type="text" value={quantity} onChange={(e) => setQuantity(e.target.value)}/>
            <div id="button-container">
                <Button className="form-button" variant="primary" onClick={handleAddToCart}>
                    Add to Cart
                </Button>
            </div>
        </div>
    )
}

export default ProductDetail;