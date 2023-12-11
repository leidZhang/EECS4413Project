import axios from "axios";
import './ProductDetial.css';
import React, { useEffect, useState } from "react";
import {useNavigate, useParams} from "react-router-dom";
import Button from "react-bootstrap/Button";

const ProductDetail = () => { // prototype detail page
    const navigate = useNavigate();
    const { id } = useParams();

    const [product, setProduct] = useState(null);
    const [quantity, setQuantity] = useState(1);
    const [colors, setColors] = useState(null);
    const [sizes, setSizes] = useState(null);
    const [inventories, setInventories] = useState([]);
    const [selectedColor, setSelectedColor] = useState('');
    const [selectedSize, setSelectedSize] = useState('');

    useEffect(() => {
        handleProductInfo();
        handleOptions();
    }, []);

    const handleUniqueValues = (data, key) => {
        let res = new Set();
        for (let i in data) {
            if (!res.has(data[i][key]["title"])) {
                res.add(data[i][key]["title"]);
            }
        }
        return res
    };

    const handleOptions = () => {
        axios.get(`api/catalog/inventory/${id}`).then(res => {
            const data = res.data;

            setInventories(handleInventories(data));
            setColors(handleUniqueValues(data, "color"));
            setSizes(handleUniqueValues(data, "size"));
        }).catch(error => {
            console.log(error);
        });
    };

    const handleInventories = (data) => {
        let res = {};
        for (let i in data) {
            const color = data[i]["color"]["title"];
            const size = data[i]["size"]["title"];

            const key = color + "-" + size;
            res[key] = data[i]["id"];
        }
        return res;
    };

    const handleProductInfo = () => {
        axios.get(`api/data-access/products/${id}`).then(res => {
            const data = res.data;
            console.log(data);

            setProduct(data);
        }).catch(error => {
            console.log(error);
            navigate('/404');
        });
    };

    const handleAvailableSize = (color) => {
        const newSizes = [];

        for (let key in inventories) {
            const keyInfo = key.split("-");
            if (color === keyInfo[0]) {
                newSizes.push(keyInfo[1]);
            }
        }

        setSizes(newSizes);
        setSelectedColor(color);
    }

    const handleAddToCart = () => {
        const key = selectedColor + '-' + selectedSize;
        const inventory = inventories[key];

        const data = { // implementing
            inventory_id: inventory,
            quantity: quantity,
        }

        axios.post(`http://localhost:8000/api/shopping-cart/cart/items`, data).then(res => {
            console.log(res.data);
        }).catch(error => {
            console.log(error);
        })
    }

    return (
        <div id="product-container" >
            <img src={ product?.image } className="product-detail-img" alt={product?.title}/>
            <p>This is the page for { product?.id } product's details</p>
            <p>Title: { product?.title } </p>
            <p>Description: { product?.description } </p>
            <p>Price: { product?.price }</p>
            <p>Category: { product?.category }</p>
            <p>Brand: { product?.brand.title }</p>
            {colors && Array.from(colors).map(color => (
                <p key={color}><input type="radio" name="color" value={color} onChange={(e) => handleAvailableSize(e.target.value)} />{color}</p>
            ))}
            {selectedColor && sizes && Array.from(sizes).map(size => (
                <p key={size}><input type="radio" name="size" value={size} onChange={(e) => setSelectedSize(e.target.value)} />{size}</p>
            ))}
            <p>QTY</p>
            <input type="text" value={quantity} onChange={(e) => setQuantity(e.target.value)}/>
            <div id="button-container">
                <Button className="form-button" variant="primary" onClick={handleAddToCart}>
                    Add to Cart
                </Button>
            </div>
        </div>
    );
}

export default ProductDetail;