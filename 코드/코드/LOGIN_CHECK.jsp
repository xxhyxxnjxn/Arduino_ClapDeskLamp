<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Login_Check </title>
</head>
<body>
 
    <h1> 로그인 체크 페이지</h1>
    
    <%
    try {
        // ����̹� �ε�
        String driver = "oracle.jdbc.driver.OracleDriver";
        Class.forName(driver);
        
        // ������ Login
        String url = "jdbc:oracle:thin:@sedb.deu.ac.kr:1521:orcl";
        String id = "b20153292";
        String pw = "20153292";
        
        // ����
        Connection conn = DriverManager.getConnection(url, id, pw);
        
         // sql ����
         // �� �������� LOGIN.jsp input�� �Է��� ������ ������ ��´�
         String email = request.getParameter("email");
         String password = request.getParameter("password");
         String name=null;
         
        Statement st = conn.createStatement();
        // ���� �Է��� id�� pw ���� DB�ȿ� �ִ��� Ȯ���Ѵ�
        String sql = "SELECT * FROM USER3TABLE WHERE EMAIL='" + email + "' AND PASSWORD='" + password + "'";
        st.executeUpdate(sql);
        ResultSet rs = st.executeQuery(sql);

        

        // isLogin �� �α��� Ȯ�� ������ ���� ����
        Boolean isLogin = false;
        while(rs.next()) {
            // rs.next�� true ��� = ������ �ִ�
            isLogin = true;
            name=rs.getString("name");
        }
        
        // DB�� ���� ���� ������ �ִٸ�
        if(isLogin) {
            // ���� �α����� id�� pw�� session�� �����ϰ�
            //session.setAttribute("id", email);
            session.setAttribute("id", name); 
            session.setAttribute("pw", password);

            // ù �������� ����������
            response.sendRedirect("Project.jsp");
        } else {
            // DB�� �������� ������ ���ٸ� ���â�� ����ش�
            %> <script> alert("존재하지 않는 정보입니다."); history.go(-1); </script> <%            
        }
        
        
    } catch (Exception e) {       
        out.println("DB 연동실패");
    }
    %>
 
</body>
</html>