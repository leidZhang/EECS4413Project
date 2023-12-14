import React from "react";
import ProductCard from "../../../../component/productCard/ProductCard";

const ProductList = ({productList}) => { // list by category
    return (
        <div className="result-container">
            <h2 className="result-title">Results</h2>
            <div className="card-container" id="result-card">
                {productList && productList.map(product => (
                    <ProductCard data={product} key={product.id}/>
                ))}
            </div>
        </div>
    )
};

export default ProductList;