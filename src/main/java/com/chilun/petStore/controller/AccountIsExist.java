package com.chilun.petStore.controller;

import com.chilun.petStore.pojo.User;
import com.chilun.petStore.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author 皮皮皮
 * @date 2022/12/26 20:10
 */
@WebServlet(name="AccountIsExist" ,urlPatterns = "/accountIsExist")
public class AccountIsExist extends HttpServlet {
    public UserService userService=new UserService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String account=request.getParameter("account");
        boolean result=userService.isExist(account);
        response.setContentType("text/plain");
        PrintWriter out=response.getWriter();
        if(result){
            out.print("Exist");
        }else{
            out.print("Not Exist");
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
