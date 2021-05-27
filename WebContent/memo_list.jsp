<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "twoline.OnelineDAO"%>
<%@ page import= "twoline.OnelineDTO"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		*{
			text-align:center;
			font-size:15px;
		}
		h2{
			text-align:center;
			font-size:35px;
			letter-spacing:3px;
		}
		button{
			padding: 10px 10px;
			border-radius: 0.5em;
		}
	</style>
</head>

<%
	OnelineDAO dao = new OnelineDAO();
	ArrayList<OnelineDTO> dtos = dao.getList();
%>

<body>
	<header>
	<br><h2>메모장</h2><br>
	<hr><br>
	</header>

	<form method="post" action="memo_write.jsp">
	<input type="text" name="memo" size=44 maxlength=20 autofocus placeholder="메모를 입력하세요"></input><br><br>
	<button type ="submit">메모 저장</button>
	</form>
<%
	for(int i = 0; i < dtos.size() ; i++) {
		OnelineDTO dto = dtos.get(i);
		out.println("<p>(" + dto.getWdate() + ") " + dto.getMemo() + 
				"<input type=\"button\" value=\"X\" onClick=\"location.href='memo_delete.jsp?no=" + dto.getNo() + "\"><br>");
		out.println("</input></p>");
	}
%>
</body>
</html>
