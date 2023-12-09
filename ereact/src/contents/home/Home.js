import React from "react";
import "../../component/HomeProductCarousel/ProductSlider.css";
import Slider from "../../component/HomeSlider/Slider";
import Carousel from "react-multi-carousel";
import "react-multi-carousel/lib/styles.css";
import Product from "../../component/HomeProductCarousel/Product";
import {productData, responsive } from "../../component/HomeProductCarousel/ProductData";

export default function Home() {
    const product = productData.map((item) => (
      <Product
        name={item.name}
        url={item.image}
        price={item.price}
        description={item.description}
      />
    ));
  
    return (
      <div className="HomeBody">
        <div className="caresoul"><Slider></Slider>
        <h1>React multi carousel</h1>
        </div>
        <div className="Productcaresoul">
            <Carousel showDots={true} responsive={responsive}>
            {product}
            </Carousel>
        </div>
      </div>
    );
  }