<%@ page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html" charset="UTF-8">
<title>게시판 내용을 보자용 </title>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../html5up-future-imperfect/assets/css/main.css" />

</head>

<%
	String idx = request.getParameter("idx");

try{
	//오라클 연결 주소
    String driverName = "oracle.jdbc.driver.OracleDriver"; 
	
	//오라클 연결 localhost
	String url = "jdbc:oracle:thin:@sedb.deu.ac.kr:1521:orcl";
	
	ResultSet rs = null;
	ResultSet rs2 = null;

	Class.forName(driverName);

	//오라클 연결 주소와 아이디,비밀번호
	Connection con = DriverManager.getConnection(url, "b20153292", "20153292");
	//out.println("Oracle DataBase Connection Success.");
	
	Statement stmt = con.createStatement();

	//InteriorAccessories.jsp에서 넘겨져 온 idx값으로 accessories테이블에 가서 레코드를 검색한다.
	String sql = "SELECT * from accessories where idx = " + idx;
	rs = stmt.executeQuery(sql);

	while(rs.next()){

		//게시글을 누를 때마다 조회수를 1씩 늘려주기 한 count변수 선언
		//accessories테이블에서 count수를 가져와서 게시글을 누를 때마다 1씩 올려준다.
		int count=rs.getInt("count");
		count++;
%>
<body>
<!-- Wrapper -->
<div class="container">
<div id="wrapper">

		<!-- Header -->
		<header id="header">
				<h1><a href="../Project.jsp">The Interior</a></h1>
				<nav class="links">
					<ul>
						<li><a href="InteriorAccessories.jsp">인테리어 소품</a></li>
						<li><a href="../sofa/sofa.jsp">가구</a></li>
						<li><a href="../interior/interior.jsp">인테리어</a></li>
						<li><a href="../question/question.jsp">Q & A</a></li>
					</ul>
				</nav>
				<%if(session.getAttribute("id")==null){ %>
					<section>
							<ul class="actions vertical">
								<li><a href="#" class="button big fit">LogIn</a></li>
							</ul>
					</section>
					<!--session의 id값이 null이 아니면 즉, 로그인을 했을 때 오른쪽 상단에 회원 이름과 로그아웃이라는 글자를 나타내게 한다.-->
				<% } else { %>
					<section>
							<ul class="actions vertical">
								<li><a href="#" class="button big fit">Logout</a></li>
							</ul>
					</section>
				<% } %> 
			</header>
			<div id="main">
		<article class="post">
			<header>
			<!--선택한 게시물의 제목을 나타낸다.-->
				<div class="title">
					<h2><a href="#"><%=rs.getString("title") %></a></h2>
				</div>
				<!--선택한 게시물의 제목 옆에 구간을 나누어 작성일과 작성자,조회수를 보여준다.-->
				<div class="meta">
					<time class="published" datetime="2015-11-01">작성일 : <%=rs.getString("regdate") %></time>
					<a href="#" class="author"><span class="name">작성자 : <%=rs.getString("writer") %></span></a>
					<a href="#" class="author"><span class="name">조회수 : <%=rs.getString("count") %></span></a>
				</div>
			</header>
			<!--선택한 게시물의 사진과 내용을 보여준다.-->
			<a href="#" class="image featured"><img src="../uploadFile/<%=rs.getString("FILEPATH") %>" alt=""/></a>
			<p><%=rs.getString("content") %></p>
			<footer>
				<ul class="actions">
					<li><a href="delete_ok.jsp?idx=<%=rs.getString("idx") %>" class="button big">게시글 삭제</a></li>
					<!--게시글 삭제 버튼을 누르면 비밀번호를 적어서 확인하는 delete_ok.jsp로 이동한다.-->
					<li><a href="modify_write.jsp?idx=<%=rs.getString("idx") %>" class="button big">게시글 수정</a></li>
					<!--게시글 수정 버튼을 누르면 게시글을 수정할 수 있는 modify_write.jsp로 이동한다.-->
					<li><a href="InteriorAccessories.jsp" class="button big">게시글 목록으로</a></li>
					<!--목록으로 버튼을 누르면 원래의 게시판으로 돌아간다.-->
				</ul>
			</footer>
		</article>
		</div>
		</div>
<%	
	
	sql = "UPDATE accessories SET COUNT=" + count + " where IDX=" +idx; 
	//accessories테이블의 조회수를 계속 업데이트 시켜주기 위한 구문이다.

	stmt.executeUpdate(sql);

	}

	con.close();
	}catch(Exception e){
		//out.println("Oracle Database Connection Problem <hr>");
		//out.println(e.getMessage());
		//e.printStackTrace();
	}
%>
		<%if(session.getAttribute("id")!=null){ %>
		<form action="comment.jsp?idx=<%=idx%>" method="post" onsubmit="return formCheck();">
		<!--제출 버튼을 누르면 post형식으로 comment.jsp로 값을 옮겨준다.-->
		<table class="table table-bordered">
			<thead>댓글쓰기</thead>
			<tr>
				<!--로그인 했을 때의 이름으로 기본값을 넣어준다.-->
				<th>작성자</th>
				<td><input type="text" value="<%=(String)session.getAttribute("id")%>" name="comment_name"/></td>
				<!--내용을 적는 부분-->
				<th >내용</th>
				<td ><input type="text" placeholder="내용을 입력하세요. " name="comment_content"/></td>
				<td><input type="submit"/></td></tr>
			</tr>
		</table>
		</form>
		<%} else{
		}
		%>
	<%
		String idx2 = request.getParameter("idx");
	
	try{
		String driverName = "oracle.jdbc.driver.OracleDriver"; 
		
		String url = "jdbc:oracle:thin:@sedb.deu.ac.kr:1521:orcl";
		ResultSet rs2 = null;
	
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, "b20153292", "20153292");
		//out.println("Oracle DataBase Connection Success.");
		
		Statement stmt2 = con.createStatement();
		//reply테이블에서 댓글을 쓰는 게시물의 idx값에 해당하는 댓글의 레코드를 가져온다.
		String sql2 = "SELECT * from reply where idx = " + idx2;
		rs2 = stmt2.executeQuery(sql2);
		
	
	%>
		<table class="table table-bordered">
			<tr>
				<th>작성자</th>
				<th>댓글</th>
			</tr>
		
	<%	while(rs2.next()){
				out.print("<tr>");
				out.print("<td> "+rs2.getString("name") + "</td> ");
				//작성자를 나타낸다.
				out.print("<td>"+rs2.getString("content") + "</td> ");
				//내용을 나타낸다.
				out.print("</tr>");
		}
	%>
	</table>
<%
	con.close();
	}catch(Exception e){
		//out.println("Oracle Database Connection Problem <hr>");
		//out.println(e.getMessage());
		//e.printStackTrace();
	}
%>
</div>
<script src="../js/bootstrap.js"></script>
</body>
</html>