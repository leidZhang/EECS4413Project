import './App.css';
import Home from './contents/home/Home';
import Login from './contents/login/Login'
import AccountCreate from './contents/register/account_create/AccountCreate'
import NotFound from './contents/notfound/NotFound'
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';

function App() {
  return (
    <Router>
      <div className="App">
        <Routes>
          <Route exact path="/" element={<Home />} />
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<AccountCreate />} />
          <Route path="*" element={<NotFound />} /> {/* This route will match any path not matched by previous routes */}
        </Routes>
      </div>
    </Router>
  );
}

export default App;
