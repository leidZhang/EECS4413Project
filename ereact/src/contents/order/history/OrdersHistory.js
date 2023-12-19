import React, {useEffect, useState} from "react";
import cookie from "react-cookies";
import axios from "axios";
import {Link, useNavigate} from "react-router-dom";
import './OrderHistory.css';
import PaginationComponent from "../../../component/pagination/PaginationComponent";
const OrdersHistory = () => {
    const navigate = useNavigate();
    const [orderList, setOrderList] = useState(null);

    useEffect(() => {
        const fetchData = async () => {
            try {
                if (!cookie.load('user')) {
                    navigate('/login');
                } else {
                    const response = await axios.get(`/api/ordering/orders`);
                    console.log(response.data['results']);
                    setOrderList(response.data['results']);
                }
            } catch (error) {
                console.log(error);
            }
        };

        fetchData();
        console.log("aaa");
        console.log(orderList);
    }, []);

    return (
        <div>
            {orderList && orderList.map(order => (
                // temp history list, please implement pagination component

                <p key={order.id}><Link to={`/order-detail/${order.id}`}>Order ID: {order.id}</Link></p>

            ))}
            <PaginationComponent
                data={orderList}
                pageSize={2}
                onPageChange={handleChangePage}
            />
        </div>
    );
};

export default OrdersHistory;