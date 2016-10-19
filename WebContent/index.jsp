<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:directive.page import="dao.Book_dao" />
<jsp:directive.page import="java.util.List" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* Border styles */
#table-4 thead, #table-4 tr {
border-top-width: 1px;
border-top-style: solid;
border-top-color: rgb(211, 202, 221);
}
#table-4 {
border-bottom-width: 1px;
border-bottom-style: solid;
border-bottom-color: rgb(211, 202, 221);
}

/* Padding and font style */
#table-4 td, #table-4 th {
padding: 5px 10px;
font-size: 15px;
font-family: Verdana;
color: rgb(95, 74, 121);
}
/* Alternating background colors */
#table-4 tr:nth-child(even) {
background: rgb(223, 216, 232)
}
#table-4 tr:nth-child(odd) {
background: #FFF
}
#but{

}
</style>
</head>
<body>
   <%
   List bookList=Book_dao.ListAllBook();
   request.setAttribute("bookList",bookList);
    %>
 <form action="list" method="post"><!-- 注释 -->
    <table align="center">
      <tr>
        <td><input  name=authorname placeholder="输入作者名字查询作品"></td>
        <td><input type="submit" value="查询" id="but"></td>
      </tr>
    </table>
    <table align="center" id="table-4">
      <thead>
      <tr>
        <th>ISBN</th>
        <th>title</th>
        <th>AuthorID</th>
        <th>Publisher</th>
        <th>PublishDate</th>
        <th>Price</th>
        <th>删除</th>
    	</tr>
      </thead>
      <c:forEach items="${bookList}" var="book">
      <tr>
        <td>${book.getIsbn()}</td>
        <td>${book.getTitle()}</td>
        <td>${book.getAuthorid()}</td>
        <td>${book.getPublisher()}</td>
        <td>${book.getPublishdate()}</td>
        <td>${book.getPrice()}</td>
        <td><a href="delete?isbn=${book.getIsbn()}" onClick="return confirm('您确认要删除吗？')">删除 </a></td>
    	</tr>
    	</c:forEach>
  	</table>
  </form>
  <p>注:数据库中作者有宋振、吴亦凡、奥巴马、司汤达、孙武、马尔克斯、罗贯中、吴承恩...</p>
</body>
</html>