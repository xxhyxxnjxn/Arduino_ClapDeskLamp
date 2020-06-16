<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page import="java.sql.*" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<% 
	request.setCharacterEncoding("UTF-8");
	
	int idx = 1;
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	content=content.replace("\r\n","<br>");
	String password = request.getParameter("password");
	int count = 0;
	//write.jsp에서 넘겨져 온 값을 선언한 변수들에게 저장한다.

try{
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@sedb.deu.ac.kr:1521:orcl";
	
	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url,"b20153292","20153292");
	out.println("오라클 디비에 성공적으로 접속했습니다.");
	
	Statement stmt = con.createStatement();
	//위에서 선언한 변수들에 넣어준 값을 accessories테이블에 insert한다.
	String sql = "INSERT INTO question "+
           "(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT,PASSWORD) "+
           "VALUES (b_seq.nextval, '"+title+"', '"+writer+"' , sysdate, "+count+", '"+content+"','"+password+"')";
	
	out.println(sql);
	stmt.executeQuery(sql);
	
	con.close();
}catch(Exception e){
	out.println("오라클 디비에 접속을 하지 못했습니다.<hr>");
	out.println(e.getMessage());
}finally{
	//테이블에 레코드들을 넣어주면 다시 원래 게시판으로 돌아간다. 
	out.println("<script>location.href='question.jsp';</script>");
}
%>
<body>

</body>
</html>