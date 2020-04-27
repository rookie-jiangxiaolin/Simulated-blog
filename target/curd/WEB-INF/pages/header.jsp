<%--
  Created by IntelliJ IDEA.
  User: guo
  Date: 2020/3/8
  Time: 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>

<div id="header">
    <a href="/reMain" style="float: left;margin-left: 86px;"><img src="/img/1.png"></a>
    <ul>
        <c:forEach items="${requestScope.allTop}" var="kind">
            <li><a href="/topicKindView?id=${kind.id}"><c:out value="${kind.typeName}" ></c:out></a></li>
        </c:forEach>
    </ul>
    <a href="/reMain">返回首页</a>
</div>