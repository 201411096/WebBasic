<%@page import="mybatis.board.service.BoardService"%>
<%@ page import="board.service.ReplyArticleService, board.model.BoardRec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mybatis.board.model.*" %>
<%@ page import="mybatis.board.service.*" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="rec" class="mybatis.board.model.Board">
	<jsp:setProperty name="rec" property="*"/>
</jsp:useBean>

<%
	// 1. 부모게시물의 게시번호를 넘겨받기
	// 다른 인자들은 빈즈를 사용해서 다 받아옴
	String parentId = request.getParameter("parentId");
/******************************** JDBC 사용 예시 *************************************/
	// 2. Service에 reply() 호출하여 답변글 등록하기
// 	BoardRec reRec = ReplyArticleService.getInstance().reply(parentId, rec);
/******************************** Mybatis 사용 예시 *************************************/
	Board reRec = BoardService.getInstance().reply(parentId, rec);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 답변 글 저장하기 </title>
</head>
<body>

답변글을 등록하였습니다. <br/><br/>

<a href="BoardList.jsp"> 목록보기 </a> &nbsp;
<a href="BoardView.jsp?id=<%=reRec.getArticleId()%>"> 게시글 읽기 </a>

</body>
</html>