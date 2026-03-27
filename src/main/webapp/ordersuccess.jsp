<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Order Success</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

<style>

body{
    background: linear-gradient(135deg, #5b5b5b, #fff);
    height:100vh;
    display:flex;
    align-items:center;
    justify-content:center;
    font-family:sans-serif;
}

/* Card */
.success-card{
width:400px;
margin:0 auto;
    border-radius:20px;
    padding:40px;
    text-align:center;
    animation: fadeIn 0.8s ease-in-out;
}

/* Check Circle */
.check-circle{
    width:80px;
    height:80px;
    background:#28a745;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    margin:0 auto 20px;
    animation: scaleUp 0.5s ease-in-out;
}

.check-circle i{
    color:#fff;
    font-size:40px;
}

/* Animations */
@keyframes fadeIn{
    from{opacity:0; transform: translateY(20px);}
    to{opacity:1; transform: translateY(0);}
}

@keyframes scaleUp{
    from{transform:scale(0);}
    to{transform:scale(1);}
}

/* Button */
.btn-custom{
width:200px;
margin:0 auto;
    border-radius:25px;
    padding:10px 25px;
    transition:0.3s;
}

.btn-custom:hover{
    transform: translateY(-2px);
    box-shadow:0 5px 12px rgba(0,0,0,0.2);
}

</style>

</head>
<body>


<div class="container">
    <div class="card success-card shadow-lg">

        <!-- Icon -->
        <div class="check-circle">
            <i class="bi bi-check-lg"></i>
        </div>

        <!-- Heading -->
        <h2 class="text-success fw-bold">
            Order Confirmed!
        </h2>

        <!-- Message -->
        <p class="text-muted mt-3">
            Thank you for shopping with <b>StyleCart</b><br>
            Your order has been placed successfully.
        </p>


        <!-- Button -->
        <a href="shop" class="btn btn-dark btn-custom mt-3">
            Continue Shopping
        </a>

    </div>
</div>


</body>
</html>