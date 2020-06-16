<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device=width",initial-scale="1">
        <title>인터넷 프로그래밍 기말 프로젝트</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../html5up-future-imperfect/assets/css/main.css" />

        <script>
            function formCheck(){
                //오류체크 하는 script 함수 부분
                var title=document.forms[0].title.value;
                //변수 title에 name이 title인 값을 넣어준다.
                var writer=document.forms[0].writer.value;
                //변수 writer에 name이 writer인 값을 넣어준다.
                var regdate=document.forms[0].regdate.value;
                //변수 regdate에 name이 regdate인 값을 넣어준다.
                var content=document.forms[0].content.value;
                //변수 content에 name이 content인 값을 넣어준다.

                if(title==null || title==""){
                    alert('제목을 입력하세요');
                    document.forms[0].title.focus();
                    return false;
                }
                //제목을 입력하는 부분이 null값이면 alert를 이용해 알림창을 뜨게하고 글을 쓸 수 없다.
                if(wirter==null || wirter==""){
                    alert('작성자를 입력하세요');
                    document.forms[0].writer.focus();
                    return false;
                }
                //작성자를 입력하는 부분이 null값이면 alert를 이용해 알림창을 뜨게하고 글을 쓸 수 없다.
                if(content==null || content==""){
                    alert('내용을 입력하세요');
                    document.forms[0].content.focus();
                    return false;
                }
                //내용을 입력하는 부분이 null값이면 alert를 이용해 알림창을 뜨게하고 글을 쓸 수 없다.
            }
        </script>
    </head>
    <body>
            <%if(session.getAttribute("id")==null){ %>
                <script> alert("로그인 후 이용해주세요!");  history.go(-1); </script> 
                <!--로그인을 하지 않았을 때 session에 id값이 널 값이다 그러므로 alert를 
                    이용해 알림창을 띄우고 그 전페이지로 돌아간다.-->
            <% } else { %>
            <div class="container">
                <div id="wrapper">

                        <!-- Header -->
                        <header id="header">
                                <h1><a href="#">The Interior</a></h1>
                                <nav class="links">
                                    <ul>
                                        <li><a href="../InteriorAccessories/InteriorAccessories.jsp">인테리어 소품</a></li>
                                        <li><a href="../sofa/sofa.jsp">가구</a></li>
                                        <li><a href="../interior/interior.jsp">인테리어</a></li>
                                        <li><a href="question.jsp">Q & A</a></li>
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
                    <caption> 글쓰기 </caption>
                </thead>
                <tbody>
                    <form action="question_insert.jsp" onsubmit="return formCheck();" method="post">
                        <tr>
                            <th>제목: </th>
                            <td><input type="text" placeholder="제목을 입력하세요. " name="title"/></td>
                        </tr>
                        <tr>
                            <th>작성자: </th>
                            <td><input type="text" value="<%=(String)session.getAttribute("id")%>" name="writer"/></td>
                        </tr>
                        <tr>
                            <th>내용: </th>
                            <td><textarea rows="20" cols="100" placeholder="내용을 입력하세요. " name="content"></textarea></td>
                        </tr>
                        <tr>
                            <th>비밀번호: </th>
                            <td><input type="text" value="<%=(String)session.getAttribute("pw")%>" name="password"/></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit"/> 
                                <input type="button" value="reset"/> 
                                <input type="button" value="글 목록으로... " onclick="question.jsp"/>
                            </td>
                        </tr>
                    </form>
                </tbody>
        </table>
        </div>
    </div>
    <% } %> 
        <script src="../js/bootstrap.js"></script>
        <?php 
         print_r($_FILES);
        ?>
        <!--파일 입력을 위한 php소스이다.-->
    </body>
</html>