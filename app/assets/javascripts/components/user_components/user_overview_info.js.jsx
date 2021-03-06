function Info(props) {
        return (
            <div className={"row"}>
                <div className={"col-sm-2 cart-text"}><h6>Full name:</h6></div>
                <div className={"col-sm-10 card-text"}>
                    <p>{props.user.full_name}</p>
                </div>
                <div className={"col-sm-2 cart-text"}><h6>User-email:</h6></div>
                <div className={"col-sm-10 card-text"}>
                    <p>{props.user.email}</p>
                </div>
                <div className={"col-sm-2 cart-text"}><h6>Role:</h6></div>
                <div className={"col-sm-10 card-text"}>
                    <p>{props.user.role}</p>
                </div>
                <div className={"col-sm-2 cart-text"}><h6>Created at:</h6></div>
                <div className={"col-sm-10 card-text"}>
                    <p>{props.user.created_at}</p>
                </div>
                <div className={"col-sm-2 cart-text"}><h6>Tenant:</h6></div>
                <div className={"col-sm-10 card-text"}>
                    <p>{props.user.tenant_name}</p>
                </div>
            </div>
        );
}