import Home from "../contents/home/Home";
import ProductDetail from "../contents/products/detail/ProductDetail";
import Register from "../contents/user/register/Register";
import Login from "../contents/user/login/Login";
import NotFound from "../contents/notfound/NotFound";
import Layout from "../Layout";
import Products from "../contents/products/list/Products";
import Order from "../contents/order/add/Order";
import Cart from "../contents/user/cart/Cart";
import OrdersHistory from "../contents/order/history/OrdersHistory";
import SearchResult from "../contents/products/searchresult/SearchResult";
import OrderDetail from "../contents/order/detail/OrderDetail";

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
            // ===== order =====
            {
                path: 'order',
                element: <Order />
            },
            // ===== order history =====
            {
                path: 'order-history',
                element: <OrdersHistory />
            },
            // ===== order detail =====
            {
              path: 'order-detail',
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
