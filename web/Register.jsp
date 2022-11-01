<%--
  Created by IntelliJ IDEA.
  User: pi
  Date: 2022/10/30
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="Login/login.css"/>
    <script src="jquery/jquery-3.6.1.min.js"></script>

</head>
<body>
<form action="register" method="post">
    <div id="login-box">
        <h1>Register</h1>

        <div class="input-box">
            <label><span style="color: gainsboro">account:</span></label>
            <span><input type="text" placeholder="Account" name="account"></span>
            <%
                //想实现注册完登录栏默认有account
                String account=(String)request.getSession().getAttribute("account");
            %>
        </div>

       <div class="input-box">
          <label><span style="color: gainsboro">password:</span></label>
          <span><input type="password" placeholder="Password" name="password"></span>
       </div>

       <div class="input-box">
          <label><span style="color: gainsboro">Confirm:</span></label>
          <span><input type="password" placeholder="Confirm" name="password_Confirm"></span>
       </div>
        <br>
        <div>
            <img src="CheckCodeServlet" width="13%" height="20" id="checkCodeImg"/>
            <script type="text/javascript">
                $("#checkCodeImg").click(function () {
                    //重新设置属性的值，当点击该图片时
                    $("#checkCodeImg").attr("src","CheckCodeServlet?m="+Math.random());
                });
            </script>
            <input name="checkCode" placeholder="验证码" type="text" />
        </div>
        <div>
            <input type="submit" value="Sign up" class="submit">
        </div>

        <div class="input-box">
            <%
                String msg=(String)request.getAttribute("msg");
                if(msg!=null){
                    out.print("<font color='darkorange'>"+msg+"</font>");
                }
            %>
        </div>

    </div>

</form>
</body>
</html>
