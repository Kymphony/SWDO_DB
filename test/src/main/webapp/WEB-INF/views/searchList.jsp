<!-- <!DOCTYPE html>
<html class="no-js" lang=""> -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>책 검색 목록 || 아카이브</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
        <!-- Place favicon.ico in the root directory -->
        <!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Poppins:400,700,600,500,300' rel='stylesheet' type='text/css'>

		<!-- all css here -->
		<!-- bootstrap v3.3.6 css -->
        <link rel="stylesheet" href="resources/css/bootstrap.min.css">
		<!-- animate css -->
        <link rel="stylesheet" href="resources/css/animate.css">
		<!-- jquery-ui.min css -->
        <link rel="stylesheet" href="resources/css/jquery-ui.min.css">
		<!-- meanmenu css -->
        <link rel="stylesheet" href="resources/css/meanmenu.min.css">
		<!-- Font-Awesome css -->
        <link rel="stylesheet" href="resources/css/font-awesome.min.css">
		<!-- pe-icon-7-stroke css -->
        <link rel="stylesheet" href="resources/css/pe-icon-7-stroke.css">
		<!-- Flaticon css -->
        <link rel="stylesheet" href="resources/css/flaticon.css">
		<!-- venobox css -->
        <link rel="stylesheet" href="resources/venobox/venobox.css" type="text/css" media="screen" />
		<!-- nivo slider css -->
		<link rel="stylesheet" href="resources/lib/css/nivo-slider.css" type="text/css" />
		<link rel="stylesheet" href="resources/lib/css/preview.css" type="text/css" media="screen" />
		<!-- owl.carousel css -->
        <link rel="stylesheet" href="resources/css/owl.carousel.css">
		<!-- style css -->
		<link rel="stylesheet" href="resources/style.css">
		<!-- responsive css -->
        <link rel="stylesheet" href="resources/css/responsive.css">
		<!-- modernizr css -->
        <script src="resources/js/vendor/modernizr-2.8.3.min.js"></script>
        <script src="resources/js/jquery-3.3.1.min.js"></script>
        <script>
        //검색 기능 - Ajax에서 JavaScript로 변경

		function runSearch(){
			
			var bookName = document.getElementById('bookName');
			
			if(bookName.value.length < 1){alert('검색할 내용을 입력하세요'); return false;}
			
			
			return true;
		}
        </script>
        
  	<style>
  	/*전체 설정*/
  		td{padding-bottom: 1px; padding-top: 1px;}
  		p{font-size: 15px;}
  	/*디브 박스*/
		.bookList{margin: 1px auto;}
	/*책 제목 크기*/
		p#bookTitle{font-size: 20px;}
	/*테이블 영역*/
		/*번호*/
	 	#col1{width: 30px;} 
	 	/*사진 */
	 	#col2{width: 150px; height: 200px;}
	 	/*제목*/
	 	#row1col3{width: 600px; height: 40px;}
	 	/*저자*/
	 	#row1col4{width: 150px; height: 40px;}
	 	/*공백*/
	 	#blank{width: 80px; height: 200px;}
	 	/*가격*/
	 	#row2col3{width: 600px; height: 40px;}
	 	/*출판사*/
	 	#row1col4{width: 150px; height: 40px;}
	 	/*설명 */
	 	#row3col3{width: 750px; height: 40px;} 
	 	/*구분선*/
	 	#line{border-bottom:3px; border-bottom-style:solid; border-bottom-color: #b3daff;}
		/*버튼*/
		#buyButton{text-align: right;}
		#presentButton{text-align: right;}
		#cartButton{text-align: right;}	 
  	</style>    
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <!-- Add your site or application content here -->
        <!--Header Area Start-->
        <div class="header-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-2 col-sm-6 col-xs-6">
                        <div class="header-logo">
                            <a href="index.html">
                                <img src="resources/img/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-md-1 col-sm-6 visible-sm  col-xs-6">
                        <div class="header-right">
                            <ul>
                                <li>
                                    <a href="account.html"><i class="flaticon-people"></i></a>
                                </li>
                                <li class="shoping-cart">
                                    <a href="#">
                                        <i class="flaticon-shop"></i>
                                        <span>2</span>
                                    </a>
                                    <div class="add-to-cart-product">
                                        <div class="cart-product">
                                            <div class="cart-product-image">
                                                <a href="single-product.html">
                                                    <img src="img/shop/1.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="cart-product-info">
                                                <p>
                                                    <span>1</span>
                                                    x
                                                    <a href="single-product.html">East of eden</a>
                                                </p>
                                                <a href="single-product.html">S, Orange</a>
                                                <span class="cart-price">$ 140.00</span>
                                            </div>
                                            <div class="cart-product-remove">
                                                <i class="fa fa-times"></i>
                                            </div>
                                        </div>
                                        <div class="cart-product">
                                            <div class="cart-product-image">
                                                <a href="single-product.html">
                                                    <img src="img/shop/1.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="cart-product-info">
                                                <p>
                                                    <span>1</span>
                                                    x
                                                    <a href="single-product.html">East of eden</a>
                                                </p>
                                                <a href="single-product.html">S, Orange</a>
                                                <span class="cart-price">$ 140.00</span>
                                            </div>
                                            <div class="cart-product-remove">
                                                <i class="fa fa-times"></i>
                                            </div>
                                        </div>
                                        <div class="total-cart-price">
                                            <div class="cart-product-line fast-line">
                                                <span>Shipping</span>
                                                <span class="free-shiping">$10.50</span>
                                            </div>
                                            <div class="cart-product-line">
                                                <span>Total</span>
                                                <span class="total">$ 140.00</span>
                                            </div>
                                        </div>
                                        <div class="cart-checkout">
                                            <a href="checkout.html">
                                                Check out
                                                <i class="fa fa-chevron-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>                    
                    <div class="col-md-9 col-sm-12 hidden-xs">
                        <div class="mainmenu text-center">
                        <!-- 검색  -->
						<div class="layer-4">
	                        <form id="search" action="searchList" method="GET" class="title-4" onsubmit="return runSearch()">
	                            <select id="detail" name="detail">
	                        		<option value="total">통합 겁색</option>
	                        		<option value="title">제목 검색</option>
	                        		<option value="author">저자 검색</option>
	                        		<option value="publisher">출판사 검색</option>
	                        	</select>
	                            <input type="text" placeholder="Enter your book title here" id="bookName" name="bookName" style="border: 1px; border-color: #40acd7;">
	                            <button type="submit" id="searchButton"><i class="fa fa-search"></i></button>
	                        </form>
						</div>                        
                        <!-- 검색  끝-->
                            <nav>
                                <ul id="nav">
                                    <li><a href="index.html">HOME</a></li>
                                    <li><a href="shop.html">FEATURED</a></li>
                                    <li><a href="shop.html">REVIEW BOOK</a></li>
                                    <li><a href="about.html">ABOUT AUTHOR</a></li>
                                    <li><a href="#">pages</a>
                                        <ul class="sub-menu">
                                            <li><a href="about.html">About Us</a></li>
                                            <li><a href="cart.html">Cart Page</a></li>
                                            <li><a href="checkout.html">Check Out</a></li>
                                            <li><a href="contact.html">Contact</a></li>
                                            <li><a href="login.html">Login</a></li>
                                            <li><a href="my-account.html">My Account</a></li>
                                            <li><a href="shop.html">Shopping Page</a></li>
                                            <li><a href="single-product.html">Single Shop Page</a></li>
                                            <li><a href="wishlist.html">Wishlist Page</a></li>
                                            <li><a href="404.html">404 Page</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="contact.html">CONTACT</a></li>
                                </ul>
                            </nav>
                        </div>                        
                    </div>
                    <div class="col-md-1 hidden-sm">
                        <div class="header-right">
                            <ul>
                                <li>
                                    <a href="account.html"><i class="flaticon-people"></i></a>
                                </li>
                                <li class="shoping-cart">
                                    <a href="#">
                                        <i class="flaticon-shop"></i>
                                        <span>2</span>
                                    </a>
                                    <div class="add-to-cart-product">
                                        <div class="cart-product">
                                            <div class="cart-product-image">
                                                <a href="single-product.html">
                                                    <img src="img/shop/1.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="cart-product-info">
                                                <p>
                                                    <span>1</span>
                                                    
                                                    <a href="single-product.html">East of eden</a>
                                                </p>
                                                <a href="single-product.html">S, Orange</a>
                                                <span class="cart-price">$ 140.00</span>
                                            </div>
                                            <div class="cart-product-remove">
                                                <i class="fa fa-times"></i>
                                            </div>
                                        </div>
                                        <div class="cart-product">
                                            <div class="cart-product-image">
                                                <a href="single-product.html">
                                                    <img src="img/shop/1.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="cart-product-info">
                                                <p>
                                                    <span>1</span>
                                                    x
                                                    <a href="single-product.html">East of eden</a>
                                                </p>
                                                <a href="single-product.html">S, Orange</a>
                                                <span class="cart-price">$ 140.00</span>
                                            </div>
                                            <div class="cart-product-remove">
                                                <i class="fa fa-times"></i>
                                            </div>
                                        </div>
                                        <div class="total-cart-price">
                                            <div class="cart-product-line fast-line">
                                                <span>Shipping</span>
                                                <span class="free-shiping">$10.50</span>
                                            </div>
                                            <div class="cart-product-line">
                                                <span>Total</span>
                                                <span class="total">$ 140.00</span>
                                            </div>
                                        </div>
                                        <div class="cart-checkout">
                                            <a href="checkout.html">
                                                Check out
                                                <i class="fa fa-chevron-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Header Area End-->
		<!-- Mobile Menu Start -->
		<div class="mobile-menu-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="mobile-menu">
							<nav id="dropdown">
								<ul>
                                    <li><a href="index.html">HOME</a></li>
                                    <li><a href="shop.html">FEATURED</a></li>
                                    <li><a href="shop.html">REVIEW BOOK</a></li>
                                    <li><a href="about.html">ABOUT AUTHOR</a></li>
                                    <li><a href="#">pages</a>
                                        <ul>
                                            <li><a href="about.html">About Us</a></li>
                                            <li><a href="cart.html">Cart Page</a></li>
                                            <li><a href="checkout.html">Check Out</a></li>
                                            <li><a href="contact.html">Contact</a></li>
                                            <li><a href="login.html">Login</a></li>
                                            <li><a href="my-account.html">My Account</a></li>
                                            <li><a href="shop.html">Shopping Page</a></li>
                                            <li><a href="single-product.html">Single Shop Page</a></li>
                                            <li><a href="wishlist.html">Wishlist Page</a></li>
                                            <li><a href="404.html">404 Page</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="contact.html">CONTACT</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
		
<!-- 						상단바 끝						 -->	

<!-- 상단바와의 공간 -->	
<div style="height: 30px; text-align: center;" align="center"></div>
<div style="height: 30px; text-align: center;" align="center"><p>검색 결과</p></div>

<div align="center" class="bookList">
	<table align="center">
		<c:if test="${data!=null}">
			<c:forEach var = "i" begin = "0" end="${data.size()-1}">
			
			<!-- 윗 공간 여백 주기 -->
			<tr><td colspan="6"><p>　</p></td></tr>
			
			<!-- 행1 -->
			<tr>
				<td rowspan="3" id="col1"><!-- 열1: 번호 -->
					<p>${i+1}</p>
				</td>
				<td rowspan="3" id="col2"><!-- 열2: 사진 -->
					<!-- 사진이 없는 책일 경우 -->
					<c:if test="${data.get(i).getImage() == null}">
						<p>이미지 없음</p><!-- 또는 아카이브 로고 넣기 -->
					</c:if>
					<!-- 사진이 있는 책일 경우 -->
					<img src="${data.get(i).getImage()}">
				</td>
				<td id="row1col3"><!-- 열3: 제목 -->
					<a href="bookInfo?isbn=${data.get(i).getIsbn()}"><p id="bookTitle">${data.get(i).getTitle()}</p></a>		
				</td>
				<!-- <td id="row1col4">열4: 저자
					
				</td> -->
				<td rowspan="3" id="blank"><!-- 열5: 공백 --></td>
				<td id="buyButton" ><!-- 열6: 구매 -->
					<a class="cart-btn btn-default" href=""><i class="flaticon-shop"></i>구매하기</a>
				</td>	
			</tr>
			<!-- 행2 -->
			<tr>
				<td id="row2col3"><!-- 열3: 가격 -->
					<p>${data.get(i).getPrice()}원 | ${data.get(i).getAuthor()} | ${data.get(i).getPublisher()}</p>
				</td>
				<!-- <td id="row2col4">열4: 출판사
					
				</td> -->
				<td id="presentButton"><!-- 열5: 선물 -->
					<a class="cart-btn btn-default" href=""><i class="flaticon-shop"></i>선물하기</a>
				</td>
			</tr>
			<!-- 행3 -->
			<tr>
				<td id="row3col3" colspan="2"><!-- 열3-4: 책 설명 -->
					<p>${data.get(i).getDescription()}</p>
				</td>
				<td id="cartButton">
					<a class="cart-btn btn-default" href=""><i class="flaticon-shop"></i>카트넣기</a>
				</td>
			</tr>
			<!-- 행4 : 구분선 -->
			<tr>
				<td colspan="6" id="line"></td>
			</tr>
		</c:forEach>
			<tr><td colspan="6" style="height: 150px;"><p>↑ 검색 결과</p></td></tr>
		</c:if>
	</table>
</div>











		
		<!-- 본문 배너 -->		
		<!-- Mobile Menu End -->   
        <!-- Breadcrumbs Area Start -->
<!--         <div class="breadcrumbs-area" style="height:100px; text-transform: none;">
				<div style="padding:20px;">
					<h2>GROUPS</h2> 
						<ul>
							<li>find your group to join!</li>
						</ul>
				</div>
		</div>  -->
		
		
		
		<!-- 작업 -->  <!-- 3.22 1차 작업 종료: DB에서 그룹 정보 넘어오는 백엔드 완성시 진행 -->
		<!-- Breadcrumbs Area Start --> 
		<!-- Cart Area Start -->
<!--  		<div class="shopping-cart-area section-padding">
		    <div class="container" style="padding-bottom: 50px;">
		        <div class="row">
		            <div class="col-md-12" style="width:850px;">
                        <div class="wishlist-table-area table-responsive">
                            <table style="">
                                    <tr>
                                        <th colspan="2" style="height:30px; width:600px; text-align: left;">그룹 명</th>
                                        <th colspan="2" style="height:30px; width:200px;">회원 수</th>
                                    </tr>
                                    <tr>
                                        <td style="width: 600px; height:30px; text-align: left; padding-left: 10px;">그룹장 id</td>
                                        <td rowspan="2" colspan="3">
                                        	<div class="shopingcart-bottom-area pull-right" style="widht:200px;">
											<a class="right-shoping-cart" href="#">JOIN GROUP</a>
                                        </td>
                                    </tr>
                                    <tr>
                                       <td style="width: 600px; height:60px; text-align: left; padding-left: 10px;">그룹 소개</td>
                                    </tr>
                            </table>
                        </div>	               
		            </div>
		        </div>
		    </div>
		</div> -->
		
		
		
		
		
<!-- 		Cart Area End
        Discount Area Start
        <div class="discount-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <div class="discount-main-area">
                            <div class="discount-top">
                                <h3>DISCOUNT CODE</h3>
                                <p>Enter your coupon code if have one</p>
                            </div>
                            <div class="discount-middle">
                                <input type="text" placeholder="">
                                <a class="" href="#">APPLY COUPON</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <div class="subtotal-main-area">
                            <div class="subtotal-area">
                                <h2>SUBTOTAL<span>$ 200</span></h2>
                            </div>
                            <div class="subtotal-area">
                                <h2>GRAND TOTAL<span>$ 200</span></h2>
                            </div>
                            <a href="#">CHECKOUT</a>
                            <p>Checkout With Multiple Addresses</p>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- Discount Area End -->	
		<!-- Footer Area Start -->
		
		
		<!-- 주석처리 -->
		
		
<!-- 		<footer>
		    <div class="footer-top-area">
		        <div class="container">
		            <div class="row">
		                <div class="col-md-3 col-sm-8">
		                    <div class="footer-left">
		                        <a href="index.html">
		                            <img src="img/logo-2.png" alt="">
		                        </a>
		                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
		                        <ul class="footer-contact">
		                            <li>
		                                <i class="flaticon-location"></i>
		                                450 fifth Avenue, 34th floor. NYC
		                            </li>
		                            <li>
		                                <i class="flaticon-technology"></i>
		                                (+800) 123 4567 890
		                            </li>
		                            <li>
		                                <i class="flaticon-web"></i>
		                                info@bookstore.com
		                            </li>
		                        </ul>
		                    </div>
		                </div>
		                <div class="col-md-2 col-sm-4">
		                    <div class="single-footer">
		                        <h2 class="footer-title">Information</h2>
		                        <ul class="footer-list">
		                            <li><a href="about.html">About Us</a></li>
		                            <li><a href="#">Delivery Information</a></li>
		                            <li><a href="#">Privacy & Policy</a></li>
		                            <li><a href="#">Terms & Conditions</a></li>
		                            <li><a href="#">Manufactures</a></li>
		                        </ul>
		                    </div>
		                </div>
		                <div class="col-md-2 hidden-sm">
		                    <div class="single-footer">
		                        <h2 class="footer-title">My Account</h2>
		                        <ul class="footer-list">
		                            <li><a href="my-account.html">My Account</a></li>
		                            <li><a href="account.html">Login</a></li>
		                            <li><a href="cart.html">My Cart</a></li>
		                            <li><a href="wishlist.html">Wishlist</a></li>
		                            <li><a href="checkout.html">Checkout</a></li>
		                        </ul>
		                    </div>
		                </div>
		                <div class="col-md-2 hidden-sm">
		                    <div class="single-footer">
		                        <h2 class="footer-title">Shop</h2>
		                        <ul class="footer-list">
		                            <li><a href="#">Orders & Returns</a></li>
		                            <li><a href="#">Search Terms</a></li>
		                            <li><a href="#">Advance Search</a></li>
		                            <li><a href="#">Affiliates</a></li>
		                            <li><a href="#">Group Sales</a></li>
		                        </ul>
		                    </div>
		                </div>
		                <div class="col-md-3 col-sm-8">
		                    <div class="single-footer footer-newsletter">
		                        <h2 class="footer-title">Our Newsletter</h2>
		                        <p>Consectetur adipisicing elit se do eiusm od tempor incididunt ut labore et dolore magnas aliqua.</p>
		                        <form action="#" method="post">
		                            <div>
		                                <input type="text" placeholder="email address">
		                            </div>
		                            <button class="btn btn-search btn-small" type="submit">SUBSCRIBE</button>
		                            <i class="flaticon-networking"></i>
		                        </form>
		                        <ul class="social-icon">
		                            <li>
		                                <a href="#">
		                                    <i class="flaticon-social"></i>
		                                </a>
		                            </li>
		                            <li>
		                                <a href="#">
		                                    <i class="flaticon-social-1"></i>
		                                </a>
		                            </li>
		                            <li>
		                                <a href="#">
		                                    <i class="flaticon-social-2"></i>
		                                </a>
		                            </li>
		                            <li>
		                                <a href="#">
		                                    <i class="flaticon-video"></i>
		                                </a>
		                            </li>
		                        </ul>
		                    </div>
		                </div>
		                <div class="col-md-2 col-sm-4 visible-sm">
		                    <div class="single-footer">
		                        <h2 class="footer-title">Shop</h2>
		                        <ul class="footer-list">
		                            <li><a href="#">Orders & Returns</a></li>
		                            <li><a href="#">Search Terms</a></li>
		                            <li><a href="#">Advance Search</a></li>
		                            <li><a href="#">Affiliates</a></li>
		                            <li><a href="#">Group Sales</a></li>
		                        </ul>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    <div class="footer-bottom">
		        <div class="container">
		            <div class="row">
		                <div class="col-md-6">
                            <div class="footer-bottom-left pull-left">
                                <p>Copyright &copy; 2016 <span><a href="#">DevItems</a></span>. All Right Reserved.</p>
                            </div>
		                </div>
		                <div class="col-md-6">
		                    <div class="footer-bottom-right pull-right">
		                        <img src="img/paypal.png" alt="">
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</footer>
		Footer Area End
		all js here
		jquery latest version
        <script src="js/vendor/jquery-1.12.0.min.js"></script>
		bootstrap js
        <script src="js/bootstrap.min.js"></script>
		owl.carousel js
        <script src="js/owl.carousel.min.js"></script>
		jquery-ui js
        <script src="js/jquery-ui.min.js"></script>
		jquery Counterup js
        <script src="js/jquery.counterup.min.js"></script>
        <script src="js/waypoints.min.js"></script>	
		jquery countdown js
        <script src="js/jquery.countdown.min.js"></script>
		jquery countdown js
        <script type="text/javascript" src="venobox/venobox.min.js"></script>
		jquery Meanmenu js
        <script src="js/jquery.meanmenu.js"></script>
		wow js
        <script src="js/wow.min.js"></script>	
		<script>
			new WOW().init();
		</script>
		scrollUp JS		
        <script src="js/jquery.scrollUp.min.js"></script>
		plugins js
        <script src="js/plugins.js"></script>
		Nivo slider js
		<script src="lib/js/jquery.nivo.slider.js" type="text/javascript"></script>
		<script src="lib/home.js" type="text/javascript"></script>
		main js
        <script src="js/main.js"></script> -->
    </body>
</html>