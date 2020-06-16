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
<title> JoinCheck </title>
</head>
<body>
 
    <%
        // JOIN.jsp input ���� �Է��� ȸ�����Կ� �ʿ��� ������ ������ ����ش�
        String email     = request.getParameter("emails");
        String password     = request.getParameter("passwords");
        String name = request.getParameter("names");

        ResultSet rs = null;
        ResultSet rs2 = null;
        
        String checkemail=null;
        System.out.println(email + password + name);
        
        try {
            // ����̹� �ε�
            String driver = "oracle.jdbc.driver.OracleDriver";
            Class.forName(driver);
            
            // ������ Login
            String url = "jdbc:oracle:thin:@sedb.deu.ac.kr:1521:orcl";
            String id = "b20153292";
            String pw = "20153292";
            

            // ����
            // INSERT �ش޶� USERTABLE�� 
            // id, pw, name �̶�� �ʵ带 ����
            Connection conn = DriverManager.getConnection(url, id, pw);
            Statement st = conn.createStatement();

            String sql2 = "SELECT * FROM USER3TABLE WHERE EMAIL='" + email + "' ";
            rs2 = st.executeQuery(sql2);
            while(rs2.next()){
                checkemail=rs2.getString("email");
            }

            if(email.equals(checkemail)){
                %>
                <script> alert("이메일이 중복됩니다.");  history.go(-1); </script> 
                <%
                
            }
            else{
                String sql = "INSERT INTO USER3TABLE VALUES ('" + email + 
                "','" + password + 
                "','" + name + 
                "')";
                st.executeUpdate(sql);
                //rs = st.executeQuery(sql);
                response.sendRedirect("Login.html");  
            }
            

            // ȸ�����Կ� �����Ͽ����� ù �������� ������      
            
        } catch (Exception e) {       
            out.println(e.getMessage());
        }    
    %>
 
</body>
</html>
 