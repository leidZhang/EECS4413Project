import React, {useEffect} from "react";
import {useLocation} from "react-router-dom";

const NotFound = (props) => { // implement 404 page
    const { updatePath } = props;
    const location = useLocation();

    useEffect(() => {
        updatePath(location.pathname);
    }, [location, updatePath]);

    return (
       <div>
           404 Not Found
       </div>
    );
}

export default NotFound;