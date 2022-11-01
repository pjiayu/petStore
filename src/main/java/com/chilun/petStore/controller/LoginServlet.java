package com.chilun.petStore.controller;


import com.chilun.petStore.pojo.User;
import com.chilun.petStore.service.UserService;
import com.mysql.cj.xdevapi.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


/**
 * @author 皮皮皮
 * @date 2022/10/29 22:23
 */
@WebServlet(name="LoginServlet",urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    private UserService userService=new UserService();
    private String account;
    private String password;
    private String checkCode;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        account=request.getParameter("account");
        password=request.getParameter("password");
        checkCode=request.getParameter("checkCode");

        //先检查验证码，再检查账号密码
        if(account==null){
            request.setAttribute("msg","请输入账号或密码");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        } else if (request.getSession().getAttribute("code").equals(checkCode)) {
            if(userService.login(account,password)){
                User user=new User(account,password,"p");
                request.getSession().setAttribute("user",user);
                response.sendRedirect("MainInterface.jsp");
            }else{
                request.setAttribute("msg","账号或密码不正确");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }
        } else{
            request.setAttribute("msg","验证码错误");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }


}
