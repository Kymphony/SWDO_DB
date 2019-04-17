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
		.ebookList{margin: 1px auto; background-color: #80dfff;}
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
	                        		<option value="total">통합 검색</option>
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
<!-- 상단바와의 공간 끝 -->
<!-- 이북 검색 결과 목록 -->
	<div align="center" class="ebookList">
	<div style="height: 30px; text-align: center;" align="center"><p style="color: white;">e-Book</p></div>
		<table align="center">
			<c:if test="${ebook!=null}">
				<c:forEach var = "i" items="${ebook}" varStatus="var">
				
				<!-- 윗 공간 여백 주기 -->
				<tr><td colspan="6"><p>　</p></td></tr>
				
				<!-- 행1 -->
				<tr>
					<td rowspan="3" id="col1"><!-- 열1: 번호 -->
						<p>${var.count}</p>
					</td>
					<td rowspan="3" id="col2"><!-- 열2: 사진 -->
						<!-- 사진이 없는 책일 경우 -->
						<c:if test="${i.bookNum == null}">
							<p>이미지 없음</p><!-- 또는 아카이브 로고 넣기 -->
						</c:if>
						<!-- 사진이 있는 책일 경우 -->
						<%-- <img src="${ebook.get(i).getBookNum()}"> --%>
						<p>${i.bookNum}</p>
					</td>
					<td id="row1col3"><!-- 열3: 제목 -->
						<a href="ebookInfo?bookNum=${i.bookNum}"><p id="bookTitle">${i.title}</p></a>		
					</td>
					<td rowspan="3" id="blank"><!-- 열4: 공백 --></td>
					<td id="buyButton" ><!-- 열5: 구매 -->
						<a class="cart-btn btn-default" href=""><i class="flaticon-shop"></i>구매하기</a>
					</td>	
				</tr>
				<!-- 행2 -->
				<tr>
					<td id="row2col3"><!-- 열3: 가격 -->
						<p>가격정보 들어갈 곳 | ${i.author} | ${i.publisher}</p>
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
						<p>도서 설명 들어갈 곳</p>
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
			</c:if>
		</table>
	<!-- 이북이 없을때 출력할 화면 -->
		<c:if test="${ebook==null || ebook.size() == 0}">
			<div style="height: 60px; text-align: center;" align="center"><br><p>검색 내용과 일치하는 eBook이 없습니다</p></div>
		</c:if>
	</div>
<!-- 일반도서 검색 결과 목록 -->
	<div style="height: 30px; text-align: center; margin-top: 30px;" align="center"><p>일반 도서</p></div>

	<div align="center" class="bookList">
		<table align="center">
			<c:if test="${data!=null && data.size() > 0}">
				<c:forEach var = "i" items="${data}" varStatus="var">
				
				<!-- 윗 공간 여백 주기 -->
				<tr><td colspan="6"><p>　</p></td></tr>
				
				<!-- 행1 -->
				<tr>
					<td rowspan="3" id="col1"><!-- 열1: 번호 -->
						<p>${var.count}</p>
					</td>
					<td rowspan="3" id="col2"><!-- 열2: 사진 -->
						<!-- 사진이 없는 책일 경우 -->
						<c:if test="${i.image == null}">
							<p>이미지 없음</p><!-- 또는 아카이브 로고 넣기 -->
						</c:if>
						<!-- 사진이 있는 책일 경우 -->
						<img src="${i.image}">
					</td>
					<td id="row1col3"><!-- 열3: 제목 -->
						<a href="bookInfo?isbn=${i.isbn}"><p id="bookTitle">${i.title}</p></a>		
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
						<p>${i.price}원 | ${i.author} | ${i.publisher}</p>
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
						<p>${i.description}</p>
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
				<tr><td colspan="6" style="height: 150px;" align="center"><p>↑ 검색 결과</p></td></tr>
			</c:if>
			<c:if test="${data == null || data.size() == 0}">
				<tr><td colspan="6" style="height: 150px;" align="center"><p>검색 내용과 일치하는 도서가 없습니다</p></td></tr>
			</c:if>
		</table>
	</div>
</body>
</html>