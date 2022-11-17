<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<h1>Add New Post</h1>
<form action="addpost.jsp" method="post" enctype="multipart/form-data">
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
            <td><input type="text" name="title"/></td>
        </tr>
        <tr>
            <td>Writer:</td>
            <td><input type="text" name="writer"/></td>
        </tr>
        <tr>
            <td>Content:</td>
            <td><textarea cols="50" rows="5" name="content"></textarea></td>
        </tr>
        <tr>
            <td align="left"><input type='file' name="photo"></td>
        <tr>
            <td><a href="posts.jsp">View All Records</a></td>
            <td align="right"><input type="submit" value="Add Post"/></td>
        </tr>
    </table>
</form>

</body>
</html>