import React, {useEffect, useState} from "react";
import {Card, CardImg, CardSubtitle} from "react-bootstrap";
import {useNavigate} from "react-router-dom";
import "./ProductCard.css"

const ProductCard = ({ data }) => {
    const navigate = useNavigate();

    const handleNavigate = () => {
        navigate(`/product/${data?.id}`);
    }

    return (
        <Card id="product-card-content" onClick={() => handleNavigate()}>
            <div className="product-card-img-container">
                <CardImg id="product-card-img" src={data?.image} alt={data?.title}/>
            </div>
            <Card.Body style={{padding: "0px"}}>
                <CardSubtitle id="product-card-title">{data?.title}</CardSubtitle>
                <Card.Text style={{margin: "5px"}}>${data?.price}</Card.Text>
            </Card.Body>
        </Card>
    );
};

export default ProductCard;