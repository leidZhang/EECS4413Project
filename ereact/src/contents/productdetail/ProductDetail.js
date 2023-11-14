import axios from "axios";
import React, { useEffect, useState } from "react";
import {useNavigate, useParams} from "react-router-dom";

const ProductDetail = () => { // prototype detail page
    const navigate = useNavigate();
    const { id } = useParams();
    const [description, setDescription] = useState('');
    const [price, setPrice] = useState('');
    const [title, setTitle] = useState('');

    useEffect(() => {
        axios.get(`api/data-access/products/${id}`).then(res => {
            const data = res.data;
            console.log(data);

            setTitle(data['title']);
            setPrice(data['price']);
            setDescription(data['description']);
        }).catch(error => {
            console.log(error);
            navigate('/404');
        })
    });

    return (
        <div>
            <p>This is the page for { id } product's details</p>
            <p>Title: { title } </p>
            <p>Description: { description } </p>
            <p>Price: { price }</p>
        </div>
    )
}

export default ProductDetail;