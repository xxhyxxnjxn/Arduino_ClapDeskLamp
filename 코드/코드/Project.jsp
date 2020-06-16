<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML>
<html>
	<head>
        <title>The Interior</title>
        <meta http-equiv="Content-Type" content= "text/html" charset="UTF-8">
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link href="https://fonts.googleapis.com/css?family=Philosopher" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Tangerine" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">
        <link rel="stylesheet" href="css/Project.css?ver=1">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="js/bootstrap.min.js">
		<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
		<script>
            $(document).ready(function() { $('#load').delay(500).hide();});
        </script>
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="html5up-future-imperfect/assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h1><a href="Project.jsp">The Interior</a></h1>
						<nav class="links">
							<ul>
								<li><a href="InteriorAccessories/InteriorAccessories.jsp">인테리어 소품</a></li>
								<li><a href="sofa/sofa.jsp">가구</a></li>
								<li><a href="interior/interior.jsp">인테리어</a></li>
								<li><a href="question/question.jsp">Q & A</a></li>
							</ul>
						</nav>
						<%if(session.getAttribute("id")==null){ %>
                            <section>
                                    <ul class="actions vertical">
                                        <li><a href="Login.html" class="button big fit">LogIn</a></li>
                                    </ul>
                            </section>
                            <!--session의 id값이 null이 아니면 즉, 로그인을 했을 때 오른쪽 상단에 회원 이름과 로그아웃이라는 글자를 나타내게 한다.-->
                        <% } else { %>
                            <section>
                                    <ul class="actions vertical">
                                        <li><a href="LOGOUT.jsp" class="button big fit">Logout</a></li>
                                    </ul>
                            </section>
                        <% } %> 
					</header>
				<!-- Main -->
					<div id="main">
                            <!--캐러셀 부분-->
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                    <!-- 지표 설정-->
                                    <ol class="carousel-indicators">
                                      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                      <li data-target="#myCarousel" data-slide-to="1"></li>
                                      <li data-target="#myCarousel" data-slide-to="2"></li>
                                    </ol>
                                  
                                    <!-- 각 슬라이드마다 들어가는 이미지를 설정한다.-->
                                    <div class="carousel-inner">
                                      <div class="item active">
                                        <img class="img-responsive center-block" src="images/cover4.jpg" alt="img1">
                                      </div>
                                  
                                      <div class="item">
                                        <img class="img-responsive center-block" src="images/cover3.jpg" alt="img2">
                                      </div>
                                  
                                      <div class="item">
                                        <img class="img-responsive center-block" src="images/cover2.jpg" alt="img3">
                                      </div>
                                    </div>
                                  
                                    <!-- 왼쪽 오른쪽 화살표 아이콘을 넣어서 그 아이콘을 클릭시 사진이 이동한다. -->
                                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                                      <span class="glyphicon glyphicon-chevron-left"></span>
                                      <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                                      <span class="glyphicon glyphicon-chevron-right"></span>
                                      <span class="sr-only">Next</span>
                                    </a>
                            </div>

						<!-- Post -->
							<article class="post">
								<header>
									<div class="title">
										<h2><a href="#">자원이의 집을 소개합니다~~~~~~~~~~~~~~~~~`</a></h2>
										<p>자원's house 부산시 연제구 거제1동 226-1</p>
									</div>
									<div class="meta">
										<time class="published" datetime="2018-06-11">2018-06-11</time>
										<a href="#" class="author"><span class="name">Ja-Won</span><img src="images/avatar6.jpg" alt="" /></a>
									</div>
								</header>
								<a href="#" class="image featured"><img src="images/ii2.jpg" alt="" /></a>
								<p>자언이처럼 이쁘게 꾸며봤더용 저희 집 놀러오고싶죵?</p>
								<footer>
									<ul class="stats">
										<li><a href="#">General</a></li>
										<li><a href="#" class="icon fa-heart">13228</a></li>
										<li><a href="#" class="icon fa-comment">128</a></li>
									</ul>
								</footer>
							</article>

						<!-- Post -->
							<article class="post">
								<header>
									<div class="title">
										<h2><a href="#">현디니의 집을 소개합니당~~~~</a></h2>
										<p>꽃이 좋은 현디니's house</p>
									</div>
									<div class="meta">
										<time class="published" datetime="2018-06-11">2018-06-11</time>
										<a href="#" class="author"><span class="name">Hyun-Jin</span><img src="images/avatar2.jpg" alt="" /></a>
									</div>
								</header>
								<a href="#" class="image featured"><img src="images/ii3.JPG" alt="" /></a>
								<p>우아한 현디니의 티타임 같이 즐기실래용? 꺄르륽ㄹ륵</p>
								<footer>
									<ul class="stats">
										<li><a href="#">General</a></li>
										<li><a href="#" class="icon fa-heart">2342328</a></li>
										<li><a href="#" class="icon fa-comment">128</a></li>
									</ul>
								</footer>
							</article>
					</div>

				<!-- Sidebar -->
					<section id="sidebar">

						<!-- Intro -->
							<section id="intro">
								<header>
									<h2><span style = "color:#FF9245">The INTERIOR</span></h2>
									<p>Share your interior</a></p>
								</header>
							</section>

						<!-- Mini Posts -->
							<section>
								<div class="mini-posts">

									<!-- Mini Post -->
										<article class="mini-post">
											<header>
												<h3><a href="#">군대가기 10분 전</a></h3>
												<time class="published" datetime="2018-06-11">2018-06-11</time>
												<a href="#" class="author"><img src="images/avatar3.jpg" alt="" /></a>
											</header>
											<a href="#" class="image"><img src="images/ii4.JPG" alt="" /></a>
										</article>

									<!-- Mini Post -->
										<article class="mini-post">
											<header>
												<h3><a href="#">미진 = 꽃</a></h3>
												<time class="published" datetime="2018-06-11">2018-06-11</time>
												<a href="#" class="author"><img src="images/avatar4.jpg" alt="" /></a>
											</header>
											<a href="#" class="image"><img src="images/ii5.JPG" alt="" /></a>
										</article>

									<!-- Mini Post -->
										<article class="mini-post">
											<header>
												<h3><a href="#">딩굥이가 꾸민 집</a></h3>
												<time class="published" datetime="2018-06-11">2018-06-11</time>
												<a href="#" class="author"><img src="images/avatar5.jpg" alt="" /></a>
											</header>
											<a href="#" class="image"><img src="images/ii6.jpg" alt="" /></a>
										</article>

									<!-- Mini Post -->
										<article class="mini-post">
											<header>
												<h3><a href="#">Light, Right</a></h3>
												<time class="published" datetime="2018-06-11">2018-06-11</time>
												<a href="#" class="author"><img src="images/avatar1.jpg" alt="" /></a>
											</header>
											<a href="#" class="image"><img src="images/ii7.JPG" alt="" /></a>
										</article>

								</div>
							</section>

						<!-- Posts List -->
							<section>
								<ul class="posts">
									<li>
										<article>
											<header>
												<h3><a href="#">3CE, PINK</a></h3>
												<time class="published" datetime="2018-06-11">2018-06-11</time>
											</header>
											<a href="#" class="image"><img src="images/ii13.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="#">이런 탁자 보신적 있나요?</a></h3>
												<time class="published" datetime="2018-06-11">2018-06-11</time>
											</header>
											<a href="#" class="image"><img src="images/ii9.JPG" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="#">모루식당, 카레, 성공적.</a></h3>
												<time class="published" datetime="2018-06-11">2018-06-11</time>
											</header>
											<a href="#" class="image"><img src="images/ii10.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="#">Table.</a></h3>
												<time class="published" datetime="2018-06-11">2018-06-11</time>
											</header>
											<a href="#" class="image"><img src="images/ii11.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="#">Rose, House..</a></h3>
												<time class="published" datetime="2018-06-11">2018-06-11</time>
											</header>
											<a href="#" class="image"><img src="images/ii12.jpg" alt="" /></a>
										</article>
									</li>
								</ul>
							</section>

						<!-- About -->
							<section class="blurb">
								<h2>ABOUT</h2>
								<p>We Will Eventually Win.</p>
							</section>

						<!-- Footer -->
							<section id="footer">
								<ul class="icons">
									<li><a href="https://twitter.com/?lang=ko" class="fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="https://www.facebook.com/" class="fa-facebook"><span class="label">Facebook</span></a></li>
									<li><a href="https://www.instagram.com/?hl=ko" class="fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="fa-rss"><span class="label">RSS</span></a></li>
									<li><a href="#" class="fa-envelope"><span class="label">Email</span></a></li>
								</ul>
								<p class="copyright">&copy; CREATOR: <a href="#">현진,자원</a>.</p>
							</section>

					</section>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
            <script src="assets/js/main.js"></script>
            <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
            <script src="js/bootstrap.js"></script>

	</body>
</html>