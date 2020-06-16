<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <meta name="viewport" content="width=device=width",initial-scale="1">
        <title>인터넷 프로그래밍 기말 프로젝트</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../html5up-future-imperfect/assets/css/main.css">

        
    </head>
    <%
	int idx = Integer.parseInt(request.getParameter("idx"));
	
    %>
    <body>
        <div class="container">
            <div id="wrapper">
            <!-- Header -->
            <header id="header">
                    <h1><a href="../Project.jsp">The Interior</a></h1>
                    <nav class="links">
                        <ul>
                            <li><a href="../InteriorAccessories/InteriorAccessories.jsp">인테리어 소품</a></li>
                            <li><a href="sofa.jsp">가구</a></li>
                            <li><a href="../interior/interior.jsp">인테리어</a></li>
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
        <table class="table table-bordered">
                <thead>
                    <caption> 비밀번호 확인 </caption>
                </thead>
                <tbody>
                    <form action="sofa_delete.jsp?idx=<%=idx%>" method="post">
                        <!--선택한 게시판의 idx값을 delete.jsp에 넘겨주어서 그 idx에 해당하는 게시물을 삭제하도록 한다.-->
                        
                        <tr>
                            <th>비밀번호: </th>
                            <td><input type="text" placeholder="비밀번호을 입력하세요. " name="password"/></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" class="btn btn-default"/>
                            </td>
                        </tr>
                    </form>
                </tbody>
        </table>
        </div>
        </div>
        <script src="../js/bootstrap.js"></script>
    </body>
</html>