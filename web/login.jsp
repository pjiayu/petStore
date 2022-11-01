<%--
  Created by IntelliJ IDEA.
  User: pi
  Date: 2022/10/29
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>Sign in</title>
    <link rel="stylesheet" type="text/css" href="Login/login.css"/>
    <link rel="stylesheet" type="text/css" href="font/iconfont.css"/>
    <script src="jquery/jquery-3.6.1.min.js"></script>

</head>

<body>
<form action="login" method="post">

    <div id="login-box">
        <h1>Login</h1>
        <div class="input-box">
            <i class="iconfont">&#xe682;</i>    <!--字体图标-->

            <input type="text" placeholder="Account" name="account"/>
        </div>
        <div class="input-box">
            <i class="iconfont">&#xe676;</i>      <!--字体图标-->
            <input type="password" placeholder="Password" name="password"/>
        </div>

        <div>
            <a href="ForgetPsw.jsp"><span style="font-size: x-small; color: aqua;float: right ">Forgot password?</span></a>
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
            <input type="submit" value="Sign in" class="submit">
        </div>
        <div>
            <span style="font-size: small;float: right ">
                new to petStore?
            <a href="Register.jsp"><span style=" color: aquamarine;">create account?</span></a>
            </span>
        </div>

        <div class="input-box">
            <%

                String msg=(String)request.getAttribute("msg");
                if(msg==null) {
                    msg = (String) request.getSession().getAttribute("msg");
                }
                if(msg!=null){
                    out.print("<font color='darkorange'>"+msg+"</font>");
                }
            %>
        </div>

    </div>

</form>
</body>
</html>
