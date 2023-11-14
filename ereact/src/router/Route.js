import Home from "../contents/home/Home";
import ProductDetail from "../contents/productdetail/ProductDetail";
import Register from "../contents/register/Register";
import Login from "../contents/login/Login";
import NotFound from "../contents/notfound/NotFound";
import Layout from "../Layout";

export default [
    // ===== login =====
    {
        path: '/login',
        element: <Login />
    },
    // ===== register =====
    {
        path: '/register',
        element: <Register />
    },
    // ===== layout =====
    {
        path: '/',
        element: <Layout />,
        children: [
            // ===== home =====
            {
                path: 'home',
                element: <Home />
            },
            // ===== product detail =====
            {
                path: 'product/:id',
                element: <ProductDetail />
            }
        ]
    },
    // ===== 404 =====
    {
        path: '*',
        element: <NotFound />
    }
]
