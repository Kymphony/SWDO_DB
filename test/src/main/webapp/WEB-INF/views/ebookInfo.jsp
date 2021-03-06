<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Product Details || Witter Multipage Responsive Template</title>
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
        $(document).ready(function(){
    		//서평 정보 가져오기
        	$('#reviewButton').on('click',runRev);
        });
//--------------------------------<서평>----------------------------------------------------------        
		function runRev(){//이북 - 책 제목으로 서평 정보 검색
			
			//alert('runRev실행');
			
			var title = document.getElementById('revTitle').value;
			
			//alert('확인된 책 제목: ' + title);
			
			revTrans(title);
		}

		function revTrans(t){
			
			$.ajax({
				url:		'ebookrev',
				type:		'POST',
				data:		{title: t},
				dataType:	'json',
				success:	revList,
				error:		function(){alert('서평 검색 실패');}
			});
		}
		
		function revList(rev){
			//작업
			if(rev == "" || rev == null){
				var rev = '<div id="product-comments-block-tab"><a href="#" class="comment-btn"><span>첫번째 서평의 주인공이 되세요!</span></div></a>';
				$('#data').html(rev);
			}
			else{
				//div 태그에 서평 목록 삽입
				var print = '<table>';
				$.each(rev, function(key, data){
					
					print += '<tr>';//첫번재 행 - 리뷰 내용
					print += '<td>' + data.content + '</td></tr>';//행끝
					print += '<tr>';//두번째 행 - 작성자 닉네임, 작성 날짜, 대상 도서명
					print += '<td>' + data.nickname + ' | ' + data.inputdate + ' | ' + data.title + '</td></tr>';//행끝
					
				});
				print += '</table>';
				
				$('#data').html(print);
			
			}
		}
//--------------------------------<서평 끝>----------------------------------------------------------
//--------------------------------<검색 기능>-------------------------------------------------------        
		function runSearch(){
			
			var bookName = document.getElementById('bookName');
			if(bookName.value.length < 1){alert('검색할 내용을 입력하세요'); return false;}
			
			return true;
		}
//--------------------------------<검색 기능 끝>-------------------------------------------------------
        </script>
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
                                <img src="img/logo.png" alt="">
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
                                                <a href="bookInfo.jsp">
                                                    <img src="img/shop/1.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="cart-product-info">
                                                <p>
                                                    <span>1</span>
                                                    x
                                                    <a href="bookInfo.jsp">East of eden</a>
                                                </p>
                                                <a href="bookInfo.jsp">S, Orange</a>
                                                <span class="cart-price">$ 140.00</span>
                                            </div>
                                            <div class="cart-product-remove">
                                                <i class="fa fa-times"></i>
                                            </div>
                                        </div>
                                        <div class="cart-product">
                                            <div class="cart-product-image">
                                                <a href="bookInfo.jsp">
                                                    <img src="img/shop/1.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="cart-product-info">
                                                <p>
                                                    <span>1</span>
                                                    x
                                                    <a href="bookInfo.jsp">East of eden</a>
                                                </p>
                                                <a href="bookInfo.jsp">S, Orange</a>
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
                                    <li><a href="">HOME</a></li>
                                    <li><a href="">FEATURED</a></li>
                                    <li><a href="">REVIEW BOOK</a></li>
                                    <li><a href="">ABOUT AUTHOR</a></li>
                                    <li><a href="">pages</a>
                                        <ul class="sub-menu">
                                            <li><a href="">About Us</a></li>
                                            <li><a href="">Cart Page</a></li>
                                            <li><a href="">Check Out</a></li>
                                            <li><a href="">Contact</a></li>
                                            <li><a href="">Login</a></li>
                                            <li><a href="">My Account</a></li>
                                            <li><a href="">Shopping Page</a></li>
                                            <li><a href="bookInfo.jsp">Single Shop Page</a></li>
                                            <li><a href="">Wishlist Page</a></li>
                                            <li><a href="">404 Page</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="">CONTACT</a></li>
                                </ul>
                            </nav>
                        </div>                        
                    </div>
                    <div class="col-md-1 hidden-sm">
                        <div class="header-right">
                            <ul>
                                <li>
                                    <a href=""><i class="flaticon-people"></i></a>
                                </li>
                                <li class="shoping-cart">
                                    <a href="#">
                                        <i class="flaticon-shop"></i>
                                        <span>2</span>
                                    </a>
                                    <div class="add-to-cart-product">
                                        <div class="cart-product">
                                            <div class="cart-product-image">
                                                <a href="bookInfo.jsp">
                                                    <img src="img/shop/1.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="cart-product-info">
                                                <p>
                                                    <span>1</span>
                                                    x
                                                    <a href="bookInfo.jsp">East of eden</a>
                                                </p>
                                                <a href="bookInfo.jsp">S, Orange</a>
                                                <span class="cart-price">$ 140.00</span>
                                            </div>
                                            <div class="cart-product-remove">
                                                <i class="fa fa-times"></i>
                                            </div>
                                        </div>
                                        <div class="cart-product">
                                            <div class="cart-product-image">
                                                <a href="bookInfo.jsp">
                                                    <img src="img/shop/1.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="cart-product-info">
                                                <p>
                                                    <span>1</span>
                                                    x
                                                    <a href="bookInfo.jsp">East of eden</a>
                                                </p>
                                                <a href="bookInfo.jsp">S, Orange</a>
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
                                    <li><a href="">HOME</a></li>
                                    <li><a href="">FEATURED</a></li>
                                    <li><a href="">REVIEW BOOK</a></li>
                                    <li><a href="">ABOUT AUTHOR</a></li>
                                    <li><a href="">pages</a>
                                        <ul>
                                            <li><a href="">About Us</a></li>
                                            <li><a href="">Cart Page</a></li>
                                            <li><a href="">Check Out</a></li>
                                            <li><a href="">Contact</a></li>
                                            <li><a href="">Login</a></li>
                                            <li><a href="">My Account</a></li>
                                            <li><a href="">Shopping Page</a></li>
                                            <li><a href="bookInfo.jsp">Single Shop Page</a></li>
                                            <li><a href="">Wishlist Page</a></li>
                                            <li><a href="">404 Page</a></li>
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
		<!-- Breadcrumbs Area Start --> 
        <!-- Single Product Area Start -->
        <div class="single-product-area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-7">
                        <div class="single-product-image-inner">
                        
                        	<!-- 책 사진 or 표지 넣는 곳 -->
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="one">
                                    <a class="venobox" href="${ebook.bookNum}" data-gall="gallery" title="">
                                    	<!-- 사진 크기, 위치 지정 -->
                                       		<img src="${ebook.bookNum}" height="500" width="300" style="margin-left: 150px;" alt="">
                                    </a>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="two">
                                    <a class="venobox" href="img/single-product/bg-2.jpg" data-gall="gallery" title="">
                                        <img src="resources/img/single-product/bg-2.jpg" alt="">
                                    </a>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="three">
                                    <a class="venobox" href="img/single-product/bg-3.jpg" data-gall="gallery" title="">
                                        <img src="resources/img/single-product/bg-3.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                            <!-- Nav tabs -->
                            <ul class="product-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#one" aria-controls="one" role="tab" data-toggle="tab"><img src="img/single-product/1.jpg" alt=""></a></li>
                                <li role="presentation"><a href="#two" aria-controls="two" role="tab" data-toggle="tab"><img src="img/single-product/2.jpg" alt=""></a></li>
                                <li role="presentation"><a href="#three" aria-controls="three" role="tab" data-toggle="tab"><img src="img/single-product/3.jpg" alt=""></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-5">
                        <div class="single-product-details">
                        	<!-- 별점 표시 기능 삭제 -->
                            <!-- <div class="list-pro-rating">
                                <i class="fa fa-star icolor"></i>
                                <i class="fa fa-star icolor"></i>
                                <i class="fa fa-star icolor"></i>
                                <i class="fa fa-star icolor"></i>
                                <i class="fa fa-star"></i>
                            </div> -->
                            <!-- 책 제목 -->
                            <h2>${ebook.title}</h2>
                            <input type="hidden" id="revTitle" value="${ebook.title}">
                            <!-- 이북(ebook)이용 가능 여부 -->
                            <div class="availability">
                                <span>Ebook 제공 도서</span>
                            </div>
                            <!-- 가격 -->
                            <div class="single-product-price">
                                <h2 style="margin-bottom: 20px;">가격 정보</h2>
                            </div>
                            <!--책 정보 -->
                            <p>
                                                                    저자 	| ${ebook.author}<br>
                                                                    출판사	| ${ebook.publisher}<br>
                               
                            <div class="product-attributes clearfix">
                               <span>
	                                    <a class="cart-btn btn-default" href="">
	                                        <i class="flaticon-shop"></i>
	                                        	구매하기
	                                    </a>
                               </span><p></p>
                               <span>
                                    <a class="cart-btn btn-default" href="">
                                        <i class="flaticon-shop"></i>
                                        	카트에 넣기
                                    </a>
                               </span>
                            </div>
                            <p></p>
                            <!-- <div class="single-product-categories">
                               <label>Categories:</label>
                                <span>e-book, biological, business</span>
                            </div>
                            <div class="social-share">
                                <label>Share: </label>
                                <ul class="social-share-icon">
                                    <li><a href="#"><i class="flaticon-social"></i></a></li>
                                    <li><a href="#"><i class="flaticon-social-1"></i></a></li>
                                    <li><a href="#"><i class="flaticon-social-2"></i></a></li>
                                </ul> 
                            </div> -->
                        </div>
                    </div>
                </div>
<!----------------------- 책 소개, 서평, 지도 박스 ----------------------------->
                
                <div class="row">
					<div class="col-md-9">
                        <div class="p-details-tab-content">
                            <div class="p-details-tab">
                                <ul class="p-details-nav-tab" role="tablist">
                                    <li role="presentation" class="active"><a href="#more-info" aria-controls="more-info" role="tab" data-toggle="tab">책 소개</a></li>
                                    <li role="presentation"><a href="#data" aria-controls="data" role="tab" data-toggle="tab" id="reviewButton">서평</a></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
               <!----- 소개 ----------------------> 
                            <div class="tab-content review">
                                <div role="tabpanel" class="tab-pane active" id="more-info">
                                    <!-- 책 소개 내용이 있을땐 출력 -->
                                	<c:if test="${data.get(0).getDescription() != null}">
                                    	<p style="font-size: 15spx;font-weight: bold;">${data.get(0).getDescription()}</p>
                                    </c:if>
                                    <!-- 책 소개 내용이 없으면 없다고 출력 -->
                                    <c:if test="${data.get(0).getDescription() == null}">
                                    	<p style="font-size: 15spx;font-weight: bold;">책 소개가 없는 도서입니다</p>	
                                    </c:if>
                                </div>
               <!----- 서평 ---------------------->
                                <div role="tabpanel" class="tab-pane" id="data">
                                </div>
                            </div>
                        </div>
					</div>
				</div>
<!-- -----------------------------책 소개, 서평, 지도 박스 끝 ------------------------------------>                
            </div>
        </div>
     	<script src="resources/js/vendor/jquery-1.12.0.min.js"></script>
		<!-- bootstrap js -->
        <script src="resources/js/bootstrap.min.js"></script>
		<!-- owl.carousel js -->
        <script src="resources/js/owl.carousel.min.js"></script>
		<!-- jquery-ui js -->
        <script src="resources/js/jquery-ui.min.js"></script>
		<!-- jquery Counterup js -->
        <script src="resources/js/jquery.counterup.min.js"></script>
        <script src="resources/js/waypoints.min.js"></script>	
		<!-- jquery countdown js -->
        <script src="resources/js/jquery.countdown.min.js"></script>
		<!-- jquery countdown js -->
        <script type="text/javascript" src="resources/venobox/venobox.min.js"></script>
		<!-- jquery Meanmenu js -->
        <script src="resources/js/jquery.meanmenu.js"></script>
		<!-- wow js -->
        <script src="resources/js/wow.min.js"></script>	
		<script>
			new WOW().init();
		</script>
		<!-- scrollUp JS -->		
        <script src="resources/js/jquery.scrollUp.min.js"></script>
		<!-- plugins js -->
        <script src="resources/js/plugins.js"></script>
		<!-- Nivo slider js -->
		<script src="resources/lib/js/jquery.nivo.slider.js" type="text/javascript"></script>
		<script src="resources/lib/home.js" type="text/javascript"></script>
		<!-- main js -->
        <script src="resources/js/main.js"></script>
    </body>
</html>