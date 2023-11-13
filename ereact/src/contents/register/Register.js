import React, {useState} from "react";
import './Register.css'
import Card from 'react-bootstrap/Card';
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import axios from "axios";
import {useNavigate} from "react-router-dom";

const Register = () => {
    const navigate = useNavigate();
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [reEntered, setReEntered] = useState('');
    const [errorMessage, setErrorMessage] = useState('');

    const handleRegister = (event) => {
        event.preventDefault();

        const credentials = {
            username: username,
            password: password,
        };

        setErrorMessage('');
        if (password != reEntered) {
            setErrorMessage('Password must match!');
            return; // stop here if not matched 
        }

        axios.post(`/auth/users/`, credentials).then(res => {
            console.log('Register successful');
            console.log(res.data);
            navigate('/login'); // jump to login temporarily
        }).catch(error => {
            console.log(error);
            console.log(error.response.data);
            setErrorMessage('Register failed. Please check your credentials.');
        });
    }

    return (
       <div className="card-container">
           <Card className="register-card">
               <h1 className="form-title">Create Account </h1>
               <Form className="form" onSubmit={ handleRegister }>
                   <Form.Group className="form-row" controlId="formBasicEmail">
                       <Form.Label>Your Username</Form.Label>
                       <Form.Control
                           type="text"
                           placeholder="Enter username"
                           value={ username }
                           onChange={(e) => setUsername(e.target.value)}
                       />
                   </Form.Group>
                   <Form.Group className="form-row" controlId="formBasicPassword">
                       <Form.Label>Password</Form.Label>
                       <Form.Control
                           type="password"
                           placeholder="Password"
                           value={ password }
                           onChange={(e) => setPassword(e.target.value)}
                       />
                   </Form.Group>
                   <Form.Group id="last-row" className="form-row" controlId="formBasicPassword">
                       <Form.Label>Re-enter password</Form.Label>
                       <Form.Control
                           type="password"
                           placeholder="Re-enter password"
                           value={ reEntered }
                           onChange={(e) => setReEntered(e.target.value)}
                       />
                   </Form.Group>
                   {errorMessage && <div className="form-error-message">{errorMessage}</div>}
                   <div className="button-container">
                       <Button className="form-button" variant="primary" type="submit">
                           Register
                       </Button>
                   </div>
               </Form>
           </Card>
       </div>
    );
}

export default Register;