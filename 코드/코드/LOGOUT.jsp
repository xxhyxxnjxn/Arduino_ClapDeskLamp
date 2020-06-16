<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Logout </title>
</head>
<body>
 
    <%
    // �α׾ƿ� ��ư�� ������ ���ԵǴ� ���ε�
    // session�� ������ؼ� ����� ������ ������
    session.invalidate();
    // �׸��� �ٽ� LOGIN.jsp�� ���ư��� �Ѵ�
    response.sendRedirect("Project.jsp"); 
    %>
 
</body>
</html>