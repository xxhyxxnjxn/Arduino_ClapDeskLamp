<%@ page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html" charset="UTF-8">
<title>게시판을 지워보자용 </title>


</head>

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String password=null;
	String passw=request.getParameter("password");
	//passw에는 delete_ok.jsp에서 삭제하기 위해 입력한 비밀번호를 저장시킨다.

try{
    String driverName = "oracle.jdbc.driver.OracleDriver"; 
    
    String url = "jdbc:oracle:thin:@sedb.deu.ac.kr:1521:orcl";
	ResultSet rs = null;
	ResultSet rs1 = null;


	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, "b20153292", "20153292");
	out.println("Oracle DataBase Connection Success.");
	
	Statement stmt = con.createStatement();

	String sql1 = "SELECT PASSWORD from interior where idx = " + idx;
	//삭제할 게시물의 idx값을 accessories테이블에서 조건을 걸어 그 idx에 해당하는 password값을 꺼내온다.

	rs1=stmt.executeQuery(sql1);
	if(rs1.next()){
		password=rs1.getString("PASSWORD");
		//테이블에서 찾은 password를 위에서 선언해준 password변수에 저장시킨다.
	}
	if(password.equals(passw)){
		//테이블에서 찾은 패스워드와 delete_ok.jsp에서 입력해준 비밀번호가 맞다면

		String sql = "DELETE from interior where idx = " + idx;
		//그 idx에 해당하는 레코드를 삭제시킨다.

		rs = stmt.executeQuery(sql);
	
		con.close();
%>

	<script>
		alert("삭제되었습니다.");
		location.href="interior_redirect.jsp";
		//삭제되면 삭제가 되었다는 알림창과 함께 중복 삭제를 막아주는 redirect.jsp로 넘어가게 한다.
	</script>
<%
	
}else{
%>
		<script>
		alert("삭제가 안되었어요.");
		location.href="interior_redirect.jsp";
		</script>
<%
}

}catch(Exception e){
	// out.println("Oracle Database Connection Problem");
	out.println(e.getMessage());
	e.printStackTrace();
}
%>

<body>

</body>
</html>