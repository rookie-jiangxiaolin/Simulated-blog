
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        html,body,div,form,a,h1,h2,h3,h4,h5,h6,img{
            margin: 0;
            padding: 0;
        }
        html,body{
            height: 100%;
            width: 100%;
        }
        body{
            background-image: url("/img/register.jpg");
            background-repeat: no-repeat;
            background-size: 100%;
        }
    </style>
</head>
<body>
<div style="height: 600px;width: 400px; margin: 0 auto;text-align: center;background: aqua;color: azure">
    <h2>欢迎注册新浪博客</h2>
    <p></p>
    <form name="form1" action="/toCreate" method="post" enctype="multipart/form-data" onsubmit="return checkSubmit()">
        <input type="text" name="userName" placeholder="请输注册入账号" style="height: 40px;width: 280px"><br><br>
        <input type="password" name="password" placeholder="请输入密码" style="height: 40px;width: 280px"><br><br>
        <input type="text" name="telephone" placeholder="请输入手机号" style="height: 40px;width: 280px"><br><br>
        <input type="text" name="birthday" placeholder="请输入个人生日YYYY-MM-DD" style="height: 40px;width: 280px"><br><br>
        <select name="sex" >
            <option>男</option>
            <option>女</option>
        </select><br><br>
        <input type="file" name="picture"><br><br>
        <input type="submit" value="提交">
    </form>
</div>
</body>
</html>
<script>
    function checkSubmit() {
        let userName= document.form1.userName.value;
        let password= document.form1.password.value;
        let telephone= document.form1.telephone.value;
        let birthday= document.form1.birthday.value;
        let picture= document.form1.picture.value;
        //定义日期格式
        let a = /^(\d{4})-(\d{2})-(\d{2})$/;
        if (userName==null||userName.trim()==""){
            alert("用户名不能为空");
            return false;
        }
        if (password==null||password.trim()==""||password.length<6){
            alert("密码长度不能小于6");
            return false;
        }
        if (telephone.trim()==""&&telephone.length==11){
            alert("请输入11位的手机号");
            return false;
        }
        if (!a.test(birthday)){
            alert("生日格式为'YYYY-MM-DD'");
            return false;
        }
        if (picture.type==".jpg"||picture.type==".JPG"||picture.type==".gif"||picture.type==".GIF"||picture.type==".bmp"||picture.type==".BMP"||picture.type==".jpeg"||picture.type==".JPEG"||picture.type==".PNG"||picture.type==".png"||picture.trim()==""){
            alert("图片格式不正确");
            return false;
        }
    }
</script>
