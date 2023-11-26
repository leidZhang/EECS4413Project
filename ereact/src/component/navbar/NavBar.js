import React from "react";
import TopNavBar from "./sub/TopNavBar";
import './NavBar.css';
import BottomNavBar from "./sub/BottonNavBar";

const NavBar = () => {
    return (
        <div>
            <TopNavBar />
            <BottomNavBar />
        </div>
    )
};

export default NavBar;