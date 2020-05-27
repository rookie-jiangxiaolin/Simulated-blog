
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>新浪博客</title>
    <link href="/css/main.css" rel="stylesheet" >

    <style>
        .pagination li{
            display: block;
            float: left;
            list-style: none;
        }
        .pagination li a{
            float: left;
            line-height: 16px;
            text-align: center;
            font-size: 12px;
            font-weight: bolder;
            text-decoration: none;
            color: sandybrown;
            padding: 0px 5px;
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<div id="tbody">
    <div id="ref_left">最新列表:</div>
    <div id="content">
        <div id="top">
            <div id="conner">
                <a href=""><img src="/img/2.jpg" style="height: 400px;width: 700px"></a>
                <h3 style="text-align: center">贴子列表</h3>
                <ol>
                    <c:forEach items="${requestScope.topics}" var="topic">
                        <li><a href="/toViewContent/${topic.id}"><c:out value="${topic.title}" ></c:out></a></li><hr>
                    </c:forEach>
                </ol>
<%--                <ul class="pagination">--%>
<%--                    <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>--%>
<%--                        <a href="?page.start=0">--%>
<%--                            <span>«</span>--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>--%>
<%--                        <a href="?page.start=${page.start-page.count}">--%>
<%--                            <span>‹</span>--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">--%>

<%--                        <c:if test="${status.count*page.count-page.start<=30 && status.count*page.count-page.start>=-10}">--%>
<%--                            <li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>--%>
<%--                                <a--%>
<%--                                        href="?page.start=${status.index*page.count}"--%>
<%--                                        <c:if test="${status.index*page.count==page.start}">class="current"</c:if>--%>
<%--                                >${status.count}</a>--%>
<%--                            </li>--%>
<%--                        </c:if>--%>
<%--                    </c:forEach>--%>

<%--                    <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>--%>
<%--                        <a href="?page.start=${page.start+page.count}">--%>
<%--                            <span>›</span>--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                    <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>--%>
<%--                        <a href="?page.start=${page.last}">--%>
<%--                            <span>»</span>--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                </ul>--%>
                <p>每页${page.pageSize}条 当前页${page.size}条${page.pageNum}/${page.pages}页 记录数${page.total}</p>
                <c:if test="${page.isFirstPage==true}"><a>首页</a></c:if>
                <c:if test="${page.isFirstPage==false}"><a href="/?leaf=1">首页</a> </c:if>
                <c:if test="${page.hasPreviousPage==true}"><a href="/?leaf=${page.prePage}">上一页</a> </c:if>
                <c:if test="${page.hasPreviousPage==false}"><a>上一页</a></c:if>
                <c:if test="${page.hasNextPage==true}"><a href="/?leaf=${page.nextPage}">下一页</a> </c:if>
                <c:if test="${page.hasNextPage==false}"><a>下一页</a></c:if>
                <c:if test="${page.isLastPage==true}"><a>末页</a></c:if>
                <c:if test="${page.isLastPage==false}"><a href="/?leaf=${page.pages}">末页</a> </c:if>
            </div>

            <div id="right">
                <h3 style="text-align: center">新浪博友,欢迎回来</h3>
                <form action="/login" method="post" style="margin:10px">
                    <input type="text" name="userName" style="height: 40px;width: 280px " placeholder="请输入账号"><br><br>
                    <input type="password" name="password" style="height: 40px;width: 280px " placeholder="请输入密码账号"><br><br>
                    <input type="submit" style="width: 80px;height: 40px;background: chocolate;color: aqua">&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="/toRegister" style="text-decoration: none;color: black">立即注册</a>
                </form>
                <span>${sessionScope.fault}</span>
                <span>${sessionScope.pass}</span>
                <span>${sessionScope.toLogin}</span>
                <img src="${sessionScope.picture}" style="height: 100px;width: 100px"><br>
                欢迎:<a href="/toUserHome?${sessionScope.id}">${sessionScope.userName}</a><br><br>
                <c:if test="${!empty userName}"><a href="/toExit">退出账号</a></c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>
