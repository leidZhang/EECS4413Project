import React, {useState} from "react";
import "../../component/HomeProductCarousel/ProductSlider.css";
import Slider from "../../component/HomeSlider/Slider";
import "react-multi-carousel/lib/styles.css";

const Home = () => {
  
    return (
    
        <div className="caresoul"><Slider></Slider>
             <h1>React multi carousel</h1>
        </div>
      
    );
  }

  export default Home;