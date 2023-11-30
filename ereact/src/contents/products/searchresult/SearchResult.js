import React, {useEffect, useState} from "react";
import ProductCard from "../../../component/productCard/ProductCard";
import axios from "axios";
import './SearchResult.css';

const SearchResult = () => { // temp implementation for demonstrating ProductCard component 
    const [productList, setProductList] = useState(null);

    useEffect(() => {
        axios.get(`api/data-access/products`).then(res => {
            const data = res.data['results'];
            console.log(data);
            setProductList(data);
        }).catch(error => {
            console.error(error);
        })
    }, [])

    return (
        <div className="card-container">
            {productList && productList.map(product => (
                <ProductCard data={product} key={product.id}/>
            ))}
        </div>
    );
}

export default SearchResult;