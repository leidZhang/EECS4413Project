import React, {useEffect, useState} from "react";
import ProductCard from "../../../component/productCard/ProductCard";
import axios from "axios";
import './SearchResult.css';
import {useLocation, useNavigate} from "react-router-dom";
import {Form} from "react-bootstrap";
import Button from "react-bootstrap/Button";
import BrandFilter from "./component/BrandFilter";
import GroupFilter from "./component/GroupFilter";
import OrderFilter from "./component/OrderFilter";
import ProductList from "./component/ProductList";

const SearchResult = () => { // temp implementation for demonstrating ProductCard component
    const location = useLocation();
    const navigate = useNavigate();

    const [productList, setProductList] = useState(null);
    const [selectedBrand, setSelectedBrand] = useState(new Set());
    const [brands, setBrands] = useState(null);
    const [selectedProduct, setSelectedProduct] = useState(new Set());
    const [order, setOrder] = useState("");

    let allParams = location.search;
    useEffect(() => {
        setSelectedBrand(new Set());
        setSelectedProduct(new Set());
        setOrder("");

        axios.get(`api/data-access/products${allParams}`).then(res => {
            const data = res.data['results'];
            console.log(data);
            setProductList(data);
            setBrands(getBrands(data));
        }).catch(error => {
            console.error(error);
        });
    }, [allParams]);

    const getBrands = (data) => {
        let set = new Set();

        for (let element of data) {
            let brand = element["brand"]["title"];
            if (!set.has(brand)) {
                set.add(brand);
            }
        }
        return set;
    }

    const handleSelection = (set, item, hasBrand) => {
        const newSet = new Set([...set]);

        if (!hasBrand) {
            newSet.add(item);
        } else {
            newSet.delete(item);
        }

        return newSet;
    }

    const handleConcat = (set, searchField) => {
        if (set.size == 0) return "";
        let res = searchField + "=";
        for (let element of set) {
            res += element + "%2C";
        }
        return "&" + res.replace(/%2C$/, "");
    }

    const handleApply = (event) => {
        event.preventDefault();

        const searchParam = new URLSearchParams(allParams);
        const searchValue = searchParam.get("search");
        const categoryValue = searchParam.get("category");

        const search = searchValue !== null ? "search=" + searchValue : "";
        const category = categoryValue !== null? "&category=" + categoryValue : "";
        const brandSelect = handleConcat(selectedBrand, "brand");
        const prodSelect = handleConcat(selectedProduct, "title");

        allParams = search + category + brandSelect + prodSelect + "&ordering=" + order;
        navigate(`/search-result?${allParams}`);
        window.location.reload();
    }

    const handleRest = () => {
        const searchParam = new URLSearchParams(allParams);
        const searchValue = searchParam.get("search");
        const categoryValue = searchParam.get("category");

        const search = searchValue !== null ? "search=" + searchValue : "";
        const category = categoryValue !== null? "&category=" + categoryValue : "";

        allParams = search + category;
        navigate(`/search-result?${allParams}`);
        window.location.reload();
    }

    return (
        <div className="result-page-container">
            <div className="filter-container">
                <Form onSubmit={handleApply}>
                    <BrandFilter
                        brands={brands}
                        selectedBrand={selectedBrand}
                        handleSelection={handleSelection}
                        handleBrand={setSelectedBrand}
                    />
                    <GroupFilter
                        productList={productList}
                        selectedProduct={selectedProduct}
                        handleProduct={setSelectedProduct}
                        handleSelection={handleSelection}
                    />
                    <OrderFilter
                        setOrder={setOrder}
                    />
                    <div className="button-container" id="filter-button-container">
                        <Button
                            className="form-button"
                            id="filter-submit-button"
                            type="submit"
                        >Apply</Button>
                        <Button
                            className="form-button"
                            id="filter-reset-button"
                            onClick={() => handleRest()}
                        >Reset</Button>
                    </div>
                </Form>
            </div>
            <ProductList productList={productList} />
        </div>
    );
}

export default SearchResult;