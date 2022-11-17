<%--
  Created by IntelliJ IDEA.
  User: dale
  Date: 2022/11/17
  Time: 3:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<html>
<head>
    <title>File Upload</title>
</head>
<body>
<%
    String fileName = "";
    int sizeLimit = 15 * 1024 * 1024;

    String directory = request.getServletContext().getRealPath("upload");

    File file = new File(directory);
    if (!file.exists()) file.mkdir();
    MultipartRequest multipartRequest = new MultipartRequest(request, directory, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
    fileName = multipartRequest.getFilesystemName("photo");
%>
파일명: <%=fileName%></br>
<img src="${pageContext.request.contextPath }/upload/<%=fileName%>">
</body>
</html>
