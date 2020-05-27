
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>
    <link href="/css/main.css" rel="stylesheet" >
    <style>
        #main_left{
            display: inline-block;
            margin-left: 40px;
            width: 300px;
            height: 900px;
            background: chartreuse;
            float: left;
        }

        #main_content{
            display: inline-block;
            width: 802px;
            height: 900px;
            background: darkorange;
            float: left;
        }

        #main_right{
            display: inline-block;
            width: 300px;
            height: 900px;
            background: brown;
            float: left;
        }
        #update_user{
            display: none;
        }
    </style>
</head>
<body>
<%@include file="header.jsp"%>
<div style="float: left">
    <div id="main_left">
        <br><br>
        我的帖子:<br>
        <ol>
             <c:forEach items="${requestScope.topics}" var="topic">
            <li><a href="/toViewContent/${topic.id}"><c:out value="${topic.title}"></c:out></a></li>
             </c:forEach>
        </ol>
    </div>
    <div id="main_content">
        <form action="/createTitle" method="post">
            <br><br>
            贴子标题:<input type="text" name="title" style="height:30px;width: 150px"><br><br>
            贴子类别:<select name="kind" style="height:30px;width: 80px">
                主题: <c:forEach items="${requestScope.allTop}" var="kind">
                           <option value="${kind.id}"><c:out value="${kind.typeName}" ></c:out></option>
                     </c:forEach>
            </select><br><br>
            贴子内容:<textarea name="content" cols="109" rows="30">
                    </textarea><br><br>
            <input type="submit" value="发布贴子">
        </form>
        <p>${sessionScope.out}</p>
    </div>
    <div id="main_right">
        <br>
        欢迎回来:
        <span>${sessionScope.userName}</span><br><br>
        <input type="button" value="修改个人信息" onclick="fn()"><br><br>
        <span>${sorry}</span>
        <div id="update_user">
            <form action="/toUpdate" method="post" enctype="multipart/form-data">
            用户名:<input type="text" id="userName"><br><br>
            用户密码:<input type="password" id="password"><br><br>
            手机号:<input type="text" id="telephone"><br><br>
            性别:<select id="sex">
            <option value="男">男</option>
            <option value="女">女</option>
        </select><br><br>
            出生日期:<input type="text" id="birthday"><br><br>
            头像:<input type="file" id="picture" value="上传图片"><br><br>
            <input type="button" value="提交"><br><br>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">

    function fn() {
        let divStyle =  document.getElementById("update_user");
        divStyle.style.display='block';
    }

</script>
