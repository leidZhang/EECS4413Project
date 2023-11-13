import './Login.css'
import axios from "axios";
import React, {useState} from "react";
import Button from 'react-bootstrap/Button';
import Card from 'react-bootstrap/Card';
import Form from 'react-bootstrap/Form';
import Breadcrumb from 'react-bootstrap/Breadcrumb';
import {useNavigate} from "react-router-dom";

const Login = () => {
    const navigate = useNavigate();
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [errorMessage, setErrorMessage] = useState('');

    const handleLogin = (event) => {
        event.preventDefault();

        const credentials = {
            username: username,
            password: password,
        };

        axios.post(`/auth/token/login/`, credentials).then(res => {
            console.log('Login successful');
            console.log(res.data);
            navigate('/'); // jump to homepage
        }).catch(error => {
            console.log(error);
            console.log(error.response.data);
            setErrorMessage('Login failed. Please check your credentials.');
        })
    }

    return (
        <div id="login-container">
            <Card className="login-card">
                <h1 className="form-title">Log in</h1>
                <Form className="login-form" onSubmit={ handleLogin }>
                    <Form.Group className="form-row" controlId="formBasicEmail">
                        <Form.Label>Username</Form.Label>
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
                    <Breadcrumb id="register">
                        New customer?&nbsp;
                        <Breadcrumb.Item  href="https://getbootstrap.com/docs/4.0/components/breadcrumb/">
                            Start here
                        </Breadcrumb.Item>
                    </Breadcrumb>
                    {errorMessage && <div className="error-message">{errorMessage}</div>}
                    <div className="button-container">
                        <Button className="form-button" variant="primary" type="submit">
                            Submit
                        </Button>
                    </div>
                </Form>
            </Card>
        </div>
    );
}

export default Login;