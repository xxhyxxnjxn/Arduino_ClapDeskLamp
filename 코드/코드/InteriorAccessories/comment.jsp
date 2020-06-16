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
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	String comment_name = request.getParameter("comment_name");
	String comment_content = request.getParameter("comment_content");
	
try{
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@sedb.deu.ac.kr:1521:orcl";
	
	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url,"b20153292","20153292");
	out.println("오라클 디비에 성공적으로 접속했습니다.");
	
	Statement stmt = con.createStatement();

	//댓글 저장을 위한 reply테이블에 content.jsp에서 적어주었던 작성자와 내용, 
	//그리고 그 댓글을 적은 게시물의 idx값을 넣어준다.
	//왜냐하면 그 게시물의 idx값을 넣어줌으로써 그 게시물에 해당하는 댓글임을 알기 때문이다.
	String sql = "INSERT INTO REPLY "+
           "(IDX, NAME, CONTENT) "+
           "VALUES ("+idx+", '"+comment_name+"' , '"+comment_content+"')";
	
	out.println(sql);
	stmt.executeQuery(sql);
	
	con.close();
}catch(Exception e){
	out.println("오라클 디비에 접속을 하지 못했습니다.<hr>");
	out.println(e.getMessage());
}finally{
	out.println("<script>location.href='content.jsp?idx="+idx+"';</script>");
	//댓글을 reply테이블에 넣어주면 댓글을 적었던 게시물로 다시 돌아간다.
}
%>
<body>

</body>
</html>