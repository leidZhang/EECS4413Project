import './App.css';
import Home from './contents/home/Home';
import Login from './contents/login/Login';
import Register from './contents/register/Register';
import NotFound from './contents/notfound/NotFound';
import NavBar from "./component/NavBar/NavBar";
import ProductDetail from "./contents/productdetail/ProductDetail";
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import {useEffect, useState} from "react";
import cookie from "react-cookies";
import axios from "axios";

function App() {
  const [currentPath, setCurrentPath] = useState('');

  const updatePath = (path) => {
    setCurrentPath(path);
  }

  const renderNavBar = () => { // hide navbar in specific pages
    const pathname = window.location.pathname;

    if (pathname === currentPath) return null
    if (pathname === '/login' || pathname === '/register') {
      return null;
    }

    return <NavBar />
  }

  useEffect(() => { // load token
    const token = cookie.load('user');

    if (token) {
      axios.defaults.headers.common['Authorization'] = `Token ${token}`;
      console.log("token loaded")
    }
  });

  return (
    <Router>
      <div className="App">
        { renderNavBar() }
        <div className="router-container">
          <Routes>
            <Route exact path="/" element={<Home />} />
            <Route path="/login" element={<Login />} />
            <Route path="/register" element={<Register />} />
            <Route path="/product/:id" element={<ProductDetail />} />
            <Route path="*" element={<NotFound updatePath={updatePath} />} /> {/* This route will match any path not matched by previous routes */}
          </Routes>
        </div>
      </div>
    </Router>
  );
}

export default App;
