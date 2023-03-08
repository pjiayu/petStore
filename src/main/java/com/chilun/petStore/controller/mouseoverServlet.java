package com.chilun.petStore.controller;

import com.chilun.petStore.pojo.Pet;
import com.chilun.petStore.service.PetService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Title:
 * @Description:
 * @author: anthor
 * @date:2022/12/2819:56
 */
public class mouseoverServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String categoryId = request.getParameter("categoryId");
        String resp = "这边展示的宠物是"+categoryId;
        response.setContentType("text/xml");
        PrintWriter out = response.getWriter();
        out.write(resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
