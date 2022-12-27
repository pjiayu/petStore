<%--
  Created by IntelliJ IDEA.
  User: pi
  Date: 2022/11/5
  Time: 0:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="WEB-INF/mainJsp/header.jsp"%>
<%@include file="WEB-INF/mainJsp/top.jsp"%>

<link rel="stylesheet" type="text/css" href="Login/login.css"/>
<link rel="stylesheet" type="text/css" href="font/iconfont.css"/>

<style>
    body{
        background-image: url(Login/pet3.jpg);
        background-repeat: no-repeat;
        background-size:100%;
        background-position: 0px -50px;
    }
    .container {
        width: 40%;
        margin: 20px auto;
    }

    .info{
        font-size: large;
        text-align: center;
        margin-top: 20px;
    }
    .info input{
        border: none;
        background: none;
        border-bottom: #a6ead2 2px solid;
        padding: 5px 10px;
        outline: none;
        color: aqua;
    }

    .submit{
        line-height :30px;
        margin-top: 20px;
        width: 130px;
        height: 30px;
        border-radius:13px ;
        outline: none;
        border: none;
        background-image: linear-gradient(120deg, #a6c0fe 0%, #f68084 100%);
        color: #FFFFFF;
    }

     .submit:hover{
        background-image: linear-gradient(to top, #30cfd0 0%, #330867 100%);
    }
    .okmsg{
        color: green;
    }
    .errormsg{
        color: red;
    }
</style>


<script>
    var xhr;
    function checkAccount(){
        console.log("checkAccount");
        var account=document.getElementById('account').value;
        xhr=new XMLHttpRequest();
        xhr.onreadystatechange=process;
        xhr.open("GET","accountIsExist?account="+account,true);
        xhr.send(null);
    }

    function process() {
        if(xhr.readyState==4){
            if(xhr.status==200){
                var responseInfo=xhr.responseText;
                console.log(responseInfo);
                var msg=document.getElementById('isExistInfo');
                if(responseInfo==='Not Exist'){
                    msg.classList.remove('errormsg')
                    msg.classList.add('okmsg');
                    msg.innerText='Account可用';
                }else{
                    msg.classList.add('errormsg');
                    msg.innerText='Account不可用';
                }
            }
        }
    }

</script>
<%
    User user=(User)request.getSession().getAttribute("user");
    String account=user.getAccount();
%>
<h1 style="font-family: 华文隶书;text-align: center;color: aqua"><span style="color: gold"><%=account%></span> Account-info</h1>

<form action="accountInfo" method="post" class="container">
        <div class="info">
            <label>
                <span style="color: #ee9900">nickname:</span>
            <input type="text" placeholder="Nickname" name="name">
            </label>
            <%
                //想实现注册完登录栏默认有account
                account=(String)request.getSession().getAttribute("account");
            %>
        </div>

        <div class="info">
            <label><span style="color: #ee9900">password:</span>
            <span><input type="password" placeholder="Password" name="password"></span>
            </label>
        </div>

        <div class="info">
            <label><span style="color: #ee9900">confirm:</span>
            <span><input type="password" placeholder="Confirm" name="password_Confirm"></span>
            </label>
        </div>

        <div class="info">
            <%
                String msg=(String)request.getAttribute("msg");
                if(msg!=null){
                    out.print("<font color='darkorange'>"+msg+"</font>");
                }
            %>
        </div>

        <div class="info" >
            <label><span style="color: #ee9900">address:</span></label>
            <label>
                <select name="province"class="common">
                    <option value="江西省" name="province">江西省</option>
                    <option value="湖北省" name="province">湖北省</option>
                    <option value="广东省" name="province">广东省</option>
                    <option value="湖南省" name="province" selected="selected">湖南省</option>
                    <option value="福建省" name="province">福建省</option>
                    <option value="浙江省" name="province">浙江省</option>
                </select>
                <select name="city" class="common">

                    <option value="长沙市" name="city">长沙市</option>
                    <option value="株洲市" name="city">株洲市</option>
                    <option value="" name="city" selected="selected">-请选择-</option>
                </select>
                <select name="region" class="common">
                    <option value="岳麓区" name="region">岳麓区</option>
                    <option value="雨花区" name="region">雨花区</option>
                    <option value="天心区" name="region">天心区</option>
                    <option value="选择" name="region" selected="selected">-请选择-</option>
                </select>
            </label>
        </div>
        <div class="info">
            <label>
                <span style="color: #ee9900">email:</span>
            <span><input type="text" placeholder="email" name="email"></span>
            </label>
        </div>

        <div class="info">
            <label>
                <span style="color: #ee9900">phone:</span>
            <span><input type="text" placeholder="Phone" name="phone"></span>
            </label>
        </div>

        <div class="info">
            <label>
              <span style="color: #ee9900">pets_love:</span>
            </label>
            <label>
                <span><input type="checkbox" value="cats" name="pet1" checked="checked"></span>
                <span>小猫</span>
            </label>
            <label>
                <span><input type="checkbox" value="dogs" name="pet2" ></span>
                <span>小狗</span>
            </label>
            <label>
                <span><input type="checkbox" value="hamsters" name="pet3" ></span>
                <span>小仓鼠</span>
            </label>
            <label>
                <span><input type="checkbox" value="rabbits" name="pet4" ></span>
                <span>小兔</span>
            </label>
            <label>
                <span><input type="checkbox" value="birds" name="pet5" ></span>
                <span>小鸟</span>
            </label>
        </div>

    <div style="text-align: center">
        <input type="submit" value="保存" class="submit">
    </div>



</form>

<%@include file="WEB-INF/mainJsp/footer.jsp"%>
