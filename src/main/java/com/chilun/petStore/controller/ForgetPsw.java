package com.chilun.petStore.controller;

import com.chilun.petStore.pojo.User;
import com.chilun.petStore.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author 皮皮皮
 * @date 2022/11/1 19:51
 */
@WebServlet("/ForgetPsw")
public class ForgetPsw extends HttpServlet {
    private UserService userService=new UserService();
    private User user;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String account = request.getParameter("account");
        String password = request.getParameter("password");
        String password_confirm=request.getParameter("password_Confirm");
        String checkCode=request.getParameter("checkCode");

        User user=userService.getUser(account);
        //先判断验证码是否正确
        if(request.getSession().getAttribute("code").equals(checkCode)){
            //判断账户是否已经存在
            if(!userService.isExist(account)){

                request.setAttribute("msg","账户不存在!");
                request.getRequestDispatcher("ForgetPsw.jsp").forward(request,response);
            }else {
                user.setPassword(password);
                userService.updatePsw(user);
                response.sendRedirect("login.jsp");
            }
        }else {
            request.setAttribute("msg","验证码错误");
            request.getRequestDispatcher("Register.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

}
