<%@ page import="com.chilun.petStore.pojo.User" %>
<%--
  Created by IntelliJ IDEA.
  User: pi
  Date: 2022/11/3
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>
<nav class="top">
    <%-- 返回首页图标   --%>
    <a href="${contextPath}">
        <span style="color: #c40000; margin: 0px;" class="glyphicon glyphicon-home redColor"></span>
    </a>

    <span>喵，欢迎来到petStore</span>


    <c:if test="${not empty user}">
<%--        user ne empty--%>
        <a href="info.jsp">${user.account}</a>
        <a href="main">退出</a>

<%--        <%--%>
<%--            // 设置购物车总数--%>
<%--            User user = (User) request.getSession().getAttribute("user");--%>
<%--            if(null != user) {--%>
<%--                List<OrderItem> ois = new OrderItemDAO().listByUser(user.getId());--%>
<%--                request.setAttribute("cartTotalItemNumber", ois.size());--%>
<%--            }--%>
<%--        %>--%>
    </c:if>

    <c:if test="${empty user}">
        <a href="login.jsp">请登录</a>
        <a href="Register.jsp">免费注册</a>
    </c:if>

    <span style="margin-right: 200px" class="pull-right">
        <a href="forebought">我的订单</a>
        <a href="forecart">
            <span style="color: #c40000;" class="glyphicon glyphicon-shopping-cart redColor"></span>
            购物车 <strong style="color: #c40000">${cartTotalItemNumber}</strong> 件
        </a>

        <a href="">关于我</a>
    </span>
</nav>
