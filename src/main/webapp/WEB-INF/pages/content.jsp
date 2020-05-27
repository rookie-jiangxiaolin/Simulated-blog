
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <link href="/css/main.css" rel="stylesheet" >
<style>
    html,body{
        height: 100%;
        width: 100%;
    }
    body{
        background: lightskyblue;
    }
    #main_content{
        width: 80%;
        height: 50%;
        margin: 0 auto;
        background: aqua;
    }
    #reply_content{
        width: 80%;
        height: 20%;
        margin: 0 auto;
    }
    #reply{
        width: 80%;
        height: 30%;
        margin: 0 auto;
        background: beige;
    }
    ul li{
        list-style: none;
    }
</style>
</head>
<body>
<%@include file="header.jsp" %>
<h2 style="text-align: center">${topic.title}</h2>
<div id="main_content">
${topic.content}
    <br>
    发布时间:${topic.postTime}
    <br>
    作者:${user.userName}
    <br>
    点击量:${topic.click}
</div>
<div id="reply">
    <ul>
        <c:forEach items="${requestScope.replies}" var="reply">
            <li>
                <p>${sessionScope.userName}:<c:out value="${reply.replyContent}"></c:out></p>
                <p><c:out value="${reply.replyTime}"></c:out></p>
            </li><hr>
        </c:forEach>
    </ul>
</div><br>
<div id="reply_content">
    <form action="/reply/${topic.id}" method="post">
        <textarea name="reply_content" rows="10" cols="163"></textarea>
        <input type="submit" value="发表评论">
    </form>
</div>
</body>
</html>
