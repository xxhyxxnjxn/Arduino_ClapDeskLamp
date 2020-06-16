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

	//파일 저장 경로 설정
	String uploadPath = request.getRealPath("/uploadFile");
    out.println("절대경로 : " + uploadPath + "<br/>");
     
    int maxSize = 1024 * 1024 * 10; // 한번에 올릴 수 있는 파일 용량 : 10M로 제한
    String fileName1 = ""; // 중복처리된 이름
    String originalName1 = ""; // 중복 처리전 실제 원본 이름
    long fileSize = 0; // 파일 사이즈
    String fileType = ""; // 파일 타입
	MultipartRequest multi = null;

	try{
        // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
        multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
         
        // 전송한 전체 파일이름들을 가져옴
        Enumeration files = multi.getFileNames();
         
        while(files.hasMoreElements()){
            
            String file1 = (String)files.nextElement(); // 파일 input에 지정한 이름을 가져옴
            // 그에 해당하는 실재 파일 이름을 가져옴
            originalName1 = multi.getOriginalFileName(file1);
            // 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
            // 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
            fileName1 = multi.getFilesystemName(file1);
            // 파일 타입 정보를 가져옴
            fileType = multi.getContentType(file1);
            // input file name에 해당하는 실재 파일을 가져옴
            File file = multi.getFile(file1);
            // 그 파일 객체의 크기를 알아냄
            fileSize = file.length();
        }
    }catch(Exception e){
        e.printStackTrace();
	}
	
	int idx = 1;
	String title = multi.getParameter("title");
	String writer = multi.getParameter("writer");
	String content = multi.getParameter("content");
	content=content.replace("\r\n","<br>");
	String password = multi.getParameter("password");
	int count = 0;
	//write.jsp에서 넘겨져 온 값을 선언한 변수들에게 저장한다.

	if(fileName1==null){
		%>
		<script> alert("파일을 첨부해주세요.");  history.go(-1); </script> 
		<%
	}else{
try{
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@sedb.deu.ac.kr:1521:orcl";
	
	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url,"b20153292","20153292");
	out.println("오라클 디비에 성공적으로 접속했습니다.");
	
	Statement stmt = con.createStatement();
	//위에서 선언한 변수들에 넣어준 값을 accessories테이블에 insert한다.
	String sql = "INSERT INTO sofa "+
           "(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT,PASSWORD,FILEPATH) "+
           "VALUES (b_seq.nextval, '"+title+"', '"+writer+"' , sysdate, "+count+", '"+content+"','"+password+"','"+fileName1+"')";
	
	out.println(sql);
	stmt.executeQuery(sql);
	
	con.close();
}catch(Exception e){
	out.println("오라클 디비에 접속을 하지 못했습니다.<hr>");
	out.println(e.getMessage());
}finally{
	//테이블에 레코드들을 넣어주면 다시 원래 게시판으로 돌아간다. 
	out.println("<script>location.href='sofa.jsp';</script>");
}
	}
%>
<body>

</body>
</html>