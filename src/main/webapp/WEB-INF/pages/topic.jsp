
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>贴子分类页</title>
    <link href="/css/main.css" rel="stylesheet" >
    <style>
        #type_content{
            height: 800px;
            width: 1000px;
            margin: 0 auto;
            background-image: url("/img/register.jpg");
            background-repeat: no-repeat;
            background-size: 1000px 800px;
        }
    </style>
</head>
<body>
<%@include file="header.jsp"%>
<br>
<br>
<br>
<div id="type_content">
<ol>
    <c:forEach items="${requestScope.topics}" var="topic">
        <li><a href="/toViewContent/${topic.id}"><c:out value="${topic.title}"></c:out></a></li>
    </c:forEach>
</ol>
</div>
</body>
</html>
