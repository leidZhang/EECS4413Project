import Home from "../contents/home/Home";
import ProductDetail from "../contents/productdetail/ProductDetail";
import Register from "../contents/register/Register";
import Login from "../contents/login/Login";
import NotFound from "../contents/notfound/NotFound";
import Layout from "../Layout";
import Products from "../contents/products/Products";
import Cart from "../contents/cart/Cart";
import Orders from "../contents/orders/Orders";
import SearchResult from "../contents/searchresult/SearchResult";
import OrderDetail from "../contents/orderdetail/OrderDetail";

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
                element: <Home />,
                index: true,
            },
            // ===== products =====
            {
                path: 'product',
                element: <Products />
            },
            // ===== product detail =====
            {
                path: 'product/:id',
                element: <ProductDetail />
            },
            // ===== cart =====
            {
                path: 'cart',
                element: <Cart />
            },
            // ===== orders =====
            {
                path: 'order',
                element: <Orders />
            },
            // ===== order detail =====
            {
              path: 'orderdetail',
              element: <OrderDetail />
            },
            // ===== search =====
            {
                path: '/search-result',
                element: <SearchResult />
            }
        ]
    },
    // ===== 404 =====
    {
        path: '*',
        element: <NotFound />
    }
]
