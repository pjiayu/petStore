package com.chilun.petStore.controller;

import com.chilun.petStore.Util.Logback;
import com.chilun.petStore.pojo.User;
import com.chilun.petStore.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author 皮皮皮
 * @date 2022/11/5 0:39
 */
public class AccountInfoServlet extends HttpServlet {
    private String name;
    private String address;
    private String email;
    private String password;
    private String account;
    private String phone;
    private String pets_love;

    private UserService userService;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            name=req.getParameter("name");
            password=req.getParameter("password");
            account=req.getParameter("account");
            address=req.getParameter("address");
            email=req.getParameter("email");
            phone=req.getParameter("phone");
            pets_love=req.getParameter("pets_love");
            userService=new UserService();



            if(userService.isExist(account)){
                req.setAttribute("msg","该账户名已存在!");
                req.getRequestDispatcher("/WEB-INF/mainJsp/info.jsp").forward(req,resp);
            }else{
                User user=new User();

                user.setAccount(account);
                user.setPassword(password);
                user.setName(name);
                user.setAddress(address);

                userService.updatePsw(user);
                resp.sendRedirect("/main");
            }



    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    public void  a() throws IOException {
        Logger logger= Logback.getlog();
        logger.finest("finest");
        logger.finer("finer");
        logger.fine("fine");
        logger.config("config");
        logger.info("info");
        logger.warning("warning");
        logger.severe("severe");
    }
}
