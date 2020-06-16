<%@ page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html" charset="UTF-8">
<meta name="viewport" content="width=device=width",initial-scale="1">
<title>인터넷 프로그래밍 기말 프로젝트</title>
<!--jquery를 사용한다.-->
<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script> 
<!--외부 css파일을 가지고 온다.-->
<link rel="stylesheet" href="../html5up-future-imperfect/assets/css/main.css" />

    <script>
		/*로딩 화면을 띄우는 부분*/
        $(document).ready(function() { 
			/*페이지가 화면에 뿌려지고 나서 안에 있는 내용을 수행한다.*/
			$('#load').delay(1000).fadeOut(0);
			/*id가 load인 부분을 1초 유지하고 사라지게 한다.*/
		});
	</script>

	<style type = "text/css">
	/*id가 name값의 글자 색을 설정한다.*/
	#name{
		color:#FF9245;
	}
	</style>

</head>

<%

try{
	//오라클 드라이브에 대한 주소
    String driverName = "oracle.jdbc.driver.OracleDriver"; 
	
	//오라클에 접속하기 위한 localhost 설정
	String url = "jdbc:oracle:thin:@sedb.deu.ac.kr:1521:orcl";
	ResultSet rs = null;
	int num=0;

	Class.forName(driverName);

	//위에서 정한 url과 오라클 계정에 대한 정보를 적는다. (url,아이디,비밀번호)
	Connection con = DriverManager.getConnection(url, "b20153292", "20153292");
    //out.println("Oracle DataBase Connection Success.");
    
	
	Statement stmt = con.createStatement();

	//accessories의 테이블에 idx값을 오름차순으로 하여 모든 레코드를 선택한다.
	String sql = "SELECT * from interior order by idx desc";
	rs = stmt.executeQuery(sql);

%>
<body>
<!-- Wrapper -->
<div id="wrapper">

	<!-- Header -->
		<header id="header">
			<h1><a href="../Project.jsp">The Interior</a></h1>
			<nav class="links">
				<ul>
					<li><a href="../InteriorAccessories/InteriorAccessories.jsp">인테리어 소품</a></li>
					<li><a href="../sofa/sofa.jsp">가구</a></li>
					<li><a href="interior.jsp">인테리어</a></li>
					<li><a href="../question/question.jsp">Q & A</a></li>
				</ul>
			</nav>
			<%if(session.getAttribute("id")==null){ %>
				<section>
						<ul class="actions vertical">
							<li><a href="../Login.html" class="button big fit">LogIn</a></li>
						</ul>
				</section>
				<!--session의 id값이 null이 아니면 즉, 로그인을 했을 때 오른쪽 상단에 회원 이름과 로그아웃이라는 글자를 나타내게 한다.-->
			<% } else { %>
				<section>
						<ul class="actions vertical">
							<li><a href="../LOGOUT.jsp" class="button big fit">Logout</a></li>
						</ul>
				</section>
			<% } %> 
		</header>
<!-- Main -->
<div id="main">
<%
	while(rs.next()){
		//accessories테이블에 있는 레코드를 하나하나 가지고 오게 하기 위한 while문이다.
		num++;
		if(num==1){
		//테이블의 제일 최신 글을 가져오기 위하여 조건문을 이용해 하나의 글만 가져온다.
%>
	<!-- 메인 포스트 시작 -->
		<article class="post">
			<header>
				<!--글 제목-->
				<div class="title">
					<h2><a href="interior_content.jsp?idx=<%=rs.getString("idx") %>"><%=rs.getString("title") %></a></h2>
				</div>
				<!--글 제목 옆에 div로 공간을 나누어 작성일과 작성자, 조회수를 나타낼 수 있도록 한다.-->
				<div class="meta">
					<time class="published" datetime="2015-11-01">작성일 : <%=rs.getString("regdate") %></time>
					<a href="#" class="author"><span class="name">작성자 : <%=rs.getString("writer") %></span></a>
					<a href="#" class="author"><span class="name">조회수 : <%=rs.getString("count") %></span></a>
				</div>
			</header>
			<!--각각에 해당하는 idx를 이용해 그 글에 담겨져 있는 이미지를 미리 볼 수 있도록 한다.-->
			<a href="#" class="image featured"><img src="../uploadFile/<%=rs.getString("FILEPATH") %>" alt=""/></a>
			<p><%=rs.getString("content") %></p>
			<!--하단에 버튼을 하나 생성해서 이 글을 자세히 볼 수 있도록 링크를 걸어준다.-->
			<footer>
				<ul class="actions">
					<li><a href="interior_content.jsp?idx=<%=rs.getString("idx") %>" class="button big">Continue Reading</a></li>
				</ul>
			</footer>
		</article>
<%
	}
	}
	num--;
	//최신글이 표시가 되면 다시 num 값을 빼주어서 새로운 글이 작성될 때 다시 그 최신글이 표시될 수 있도록 한다.
	con.close();
	
}catch(Exception e){
	out.println("Oracle Database Connection Problem <hr>");
	out.println(e.getMessage());
	e.printStackTrace();
}
%>
	<!--글쓰기 버튼을 누르면 글을 쓸 수 있는 링크로 이동시킨다.-->
	<ul class="actions">
		<li><a href="interior_write.jsp" class="button big">글쓰기</a></li>
	</ul>
</div>
	<!-- 사이드 바를 생성한다. -->
	<section id="sidebar">

		<!-- 이 메뉴 소개를 나타내는 글을 적어준다. -->
			<section id="intro">
				<header>
					<h2 id="name">인테리어</h2>
					<p>예쁜 인테리어를 공유해 보세요.</p>
				</header>
			</section>
			<%

			try{
				//오라클 드라이브에 대한 주소
				String driverName = "oracle.jdbc.driver.OracleDriver"; 
				
				//오라클에 접속하기 위한 localhost 설정
				String url = "jdbc:oracle:thin:@sedb.deu.ac.kr:1521:orcl";
				ResultSet rs2=null;
				int num=0;
			
				Class.forName(driverName);
			
				//위에서 정한 url과 오라클 계정에 대한 정보를 적는다. (url,아이디,비밀번호)
				Connection con = DriverManager.getConnection(url, "b20153292", "20153292");
				//out.println("Oracle DataBase Connection Success.");
				
				
				Statement stmt = con.createStatement();
			
				//accessories의 테이블에 idx값을 오름차순으로 하여 모든 레코드를 선택한다.
				String sql2 = "SELECT * from interior order by idx desc";
				rs2 = stmt.executeQuery(sql2);
			
			%>
			<section>
			<!-- 메뉴 소개 부분 밑에 작은 포스트를 만들어서 해당 메뉴의 모든 게시물 리스트를 나타낼 수 있도록 한다.-->
			<%
			while(rs2.next()){
			//accessories테이블에 있는 레코드를 하나하나 가지고 오게 하기 위한 while문이다.
			%>
					<div class="mini-posts">
						<!-- Mini Post -->
							<article class="mini-post">
								<header>
									<!--제목을 누르면 이 글을 자세히 볼 수 있도록 하기 위해 content.jsp부분을 연결시켜준다.-->
									<h3><a href="interior_content.jsp?idx=<%=rs2.getString("idx") %>"><%=rs2.getString("title") %></a></h3>
									<!--작성일과 작성자를 나타내준다.-->
									<time class="published" ><%=rs2.getString("regdate") %></time>
									<time class="published" ><%=rs2.getString("writer") %></time>
								</header>
							</article>
					</div>
					<%
					}
					con.close();
	
				}catch(Exception e){
					out.println("Oracle Database Connection Problem <hr>");
					out.println(e.getMessage());
					e.printStackTrace();
				}
				%>
			<!--하단에 부가적인 정보를 적을 수 있도록 한다.-->
			</section>
				<section id="footer">
						<p class="copyright">&copy; 개발자: <br>정현진 : hyunjin077@naver.com <br>이자원 : aprtlvls@naver.com</a> <br>즐겁다 </p>
					</section>
			</section>
	<script src="../js/bootstrap.js"></script>
</body>
</html>