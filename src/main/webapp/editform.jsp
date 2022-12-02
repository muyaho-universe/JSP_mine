<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.example.dao.BoardDAO" %>
<%@ page import="com.example.bean.BoardVO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Form</title>
</head>
<body>

<%
    BoardDAO boardDAO = new BoardDAO();
    String id = request.getParameter("id");
    BoardVO u = boardDAO.getBoard(Integer.parseInt(id));
    request.setAttribute("vo", u);

%>

<h1>Edit Form</h1>
<form action="editpost.jsp" method="post" enctype="multipart/form-data">
    <input type="hidden" name="seq" value="<%=u.getSeq() %>"/>
    <table>
        <li>
            <label class="category" for="category">Category</label>
            <select id="category" name="category">
                <optgroup label="공학부">
                    <option value="공간환경시스템공학부">공간환경시스템공학부</option>
                    <option value="기계제어공학부">기계제어공학부</option>
                    <option value="전산전자공학부" selected>전산전자공학부</option>
                </optgroup>
                <optgroup label="인문사회과학부">
                    <option value="법학부">법학부</option>
                    <option value="커뮤니케이션학부">커뮤니케이션학부</option>
                    <option value="경영경제학부">경영경제학부</option>
                </optgroup>
                <optgroup label="융합학부">
                    <option value="글로벌리더십학부">글로벌리더십학부</option>
                    <option value="ICT창업학부">ICT창업학부</option>
                    <option value="창의융합교육원">창의융합교육원</option>
                    <option value="AI융합교육원">AI융합교육원</option>
                </optgroup>
            </select>
        </li>
        <tr>
            <td>Title:</td>
            <td><input type="text" name="title" value="<%= u.getTitle()%>"/></td>
        </tr>
        <tr>
            <td>Writer:</td>
            <td><input type="text" name="writer" value="<%= u.getWriter()%>"/></td>
        </tr>
        <tr>
            <td>Content:</td>
            <td><textarea cols="50" rows="5" name="content"><%= u.getContent()%></textarea></td>
        </tr>
        <tr>
            <td colspan="2"><input type='file' name="photo"><input type="submit" value="Edit Post"/>


                <input type="button" value="Cancel" onclick="history.back()"/></td>
        </tr>
    </table>
</form>

</body>
</html>