<%--
  Created by IntelliJ IDEA.
  User: 齿轮
  Date: 2022/10/30
  Time: 21:47
  To change this template use File | Settings | File Templates.
  这个界面需要pet、page的实体类来获得链接
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>宠物具体界面</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.scheme }://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath}/css/PetCss.css">
    <style>
        body {
            background-image: url("${pageContext.request.scheme }://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath}/picture/PetBackground.jpg");
            background-size: 100% 100%;
        }

        .divLeft {
            float: left;
            width: 40%;
        }

        .divLeftOn {
            float: left;
            width: 40%;
            position: absolute;
            top: 20%;
            left: 3%;
        }

        .divLeftDown {
            float: left;
            width: 40%;
            position: absolute;
            top: 40%;
            left: 4%;
        }

        .divRight {
            float: right;
            width: 60%
        }

        .divRightOn {
            position: absolute;
            width: 60%
        }

        .divRightCenter {
            position: absolute;
            top: 60%;
            width: 60%
        }

        .divRightDown {
            position: absolute;
            top: 90%;
            width: 60%
        }

        .name {
            font-family: "华文彩云", serif;
            font-size: 50px;
            color: #ffc300;
        }

        .picture {
            width: auto;
            height: auto;
            max-width: 100%;
            max-height: 100%;
            border-radius: 20px;
            border-style: solid;
            border-width: 5px;
            border-color: #5d5d69;
        }

        .description {
            font-family: "Comic Sans MS", cursive, sans-serif;
        }

        .description2 {

        }

        .inputSubmit{

        }
        .inputText{
            height:27px;
            padding:0 6px;
            width:40px;
            background:transparent;
            border:1px solid #ffffff
        }

        .returnMain{
            text-decoration: none;
        }

        .continueView{
            text-decoration: none;
        }
    </style>
</head>
<body>
<div>
    <div class="divLeft">
        <div class="divLeftOn">
            <h1 class="name">${pet.name}</h1>
        </div>
        <div class="divLeftDown">
            <c:if test="${pet.picture eq '无'}">
                暂无图片
            </c:if>
            <c:if test="${pet.picture ne '无'}">
                <img src="${pageContext.request.scheme }://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath}/picture/${pet.picture}"
                     width="500" alt="没有这个宠物" class="picture"/>
            </c:if>
        </div>
    </div>
    <div class="divRight">
        <center>
            <div class="divRightOn">
                <br><br>
                <h2 class="description">Pet details</h2>
                <p class="description2">${pet.description }</p>
                <br><br>
            </div>
            <div class="divRightCenter">
                <br><br>
                单价: ${pet.prices }
                <br><br>
                宠物剩余: ${pet.amount }
                <br><br>
                <form action="cart" method="post">
                    加入购物车数量:
                    <input type="text" size="1" name="NumOfBuy" value="1" class="inputText"/>
                    <input type="hidden" size="1" name="petID" value="${pet.petID}">
                    <c:if test="${sessionScope.user ne null}">
                        <input type="submit" value="加入购物车" class="inputSubmit"/>
                    </c:if>
                    <br><br>
                    <c:if test="${sessionScope.user eq null}">
                        <a href="login"class="returnMain">登录以加入购物车</a>
                    </c:if>
                </form>
            </div>
            <div class="divRightDown">
                <c:if test="${requestScope.from eq 'main'}">
                    <a href="/" class="returnMain">返回主页</a>
                </c:if>
                <c:if test="${requestScope.from eq 'select'}">
                    <a href="select?pageNo=${page.pageNo+1}&back=true" class="continueView">继续浏览</a>
                </c:if>
            </div>
        </center>
    </div>
</div>
</body>
</html>
