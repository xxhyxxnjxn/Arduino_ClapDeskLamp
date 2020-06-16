<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html" charset="UTF-8">
<title>게시판을 수정해보자용 </title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	int count=0;

try{
    String driverName = "oracle.jdbc.driver.OracleDriver"; 

    String url = "jdbc:oracle:thin:@sedb.deu.ac.kr:1521:orcl";

	ResultSet rs = null;

	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, "b20153292", "20153292");
	out.println("Oracle DataBase Connection Success.");
	
	Statement stmt = con.createStatement();

	//조회수를 꺼내오기 위한 구문
	String sql1="SELECT COUNT from sofa where idx = " + idx;
	rs=stmt.executeQuery(sql1);
	if(rs.next()){
		count=rs.getInt("COUNT");
		//선택한 게시물의 idx를 조건을 걸어 question테이블에 count 필드에 해당하는 값을 위에서 선언한 count변수에 저장한다.
	}

	String sql = "UPDATE sofa SET title= '"+title+"', WRITER='"+writer+"', CONTENT ='"+content+"', REGDATE = sysdate, count ="+count+" WHERE idx="+idx+"";
	//수정한 내용을 question테이블에 update시켜 새로운 내용으로 덮어쓰게 한다.

	out.println(sql);
	stmt.executeQuery(sql);
	con.close();

}catch(Exception e){
	out.println("Oracle Database Connection Problem <hr>");
	e.printStackTrace();
}finally{
	out.println("<script>location.href='sofa_content.jsp?idx="+idx+"';</script>");
	//게시물을 수정하면 수정한 게시물로 다시 돌아가게 한다.
}
%>
<body>


</body>
</html>