import React, {useEffect, useState} from "react";
import ProductCard from "../../../component/productCard/ProductCard";
import axios from "axios";
import './SearchResult.css';
import {useLocation} from "react-router-dom";

const SearchResult = () => { // temp implementation for demonstrating ProductCard component
    const location = useLocation();
    const allParams = location.search;
    const [productList, setProductList] = useState(null);

    useEffect(() => {
        axios.get(`api/data-access/products${allParams}`).then(res => {
            const data = res.data['results'];
            console.log(data);
            setProductList(data);
        }).catch(error => {
            console.error(error);
        })
    }, [allParams]);

    return (
        <div className="result-container">
            <h2>Results</h2>
            <div className="card-container">
                {productList && productList.map(product => (
                    <ProductCard data={product} key={product.id}/>
                ))}
            </div>
        </div>
    );
}

export default SearchResult;