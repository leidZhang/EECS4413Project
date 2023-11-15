import './App.css';
import {useRoutes} from 'react-router-dom';
import {useLayoutEffect} from "react";
import cookie from "react-cookies";
import axios from "axios";
import Route from "./router/Route";

function App() {
  const element = useRoutes(Route);

  useLayoutEffect(() => { // load token
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
