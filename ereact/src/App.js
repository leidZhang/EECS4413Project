import './App.css';
import Home from './contents/home/Home';
import Login from './contents/login/Login';
import Register from './contents/register/Register';
import NotFound from './contents/notfound/NotFound';
import ProductDetail from "./contents/productdetail/ProductDetail";
import {BrowserRouter, useRoutes} from 'react-router-dom';
import {useEffect} from "react";
import cookie from "react-cookies";
import axios from "axios";
import Route from "./router/Route";

function App() {
  const element = useRoutes(Route);

  useEffect(() => { // load token
    const token = cookie.load('user');

    if (token) {
      axios.defaults.headers.common['Authorization'] = `Token ${token}`;
      console.log("token loaded")
    }
  });

  // BrowserRouter in index.js is needed
  return (
    <div className="App">
      {element}
    </div>
  );
}

export default App;
