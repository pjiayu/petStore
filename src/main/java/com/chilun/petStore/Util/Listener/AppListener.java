package com.chilun.petStore.Util.Listener;

import com.chilun.petStore.Util.Logback;


import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.IOException;
import java.util.logging.*;


/**
 * @Title:
 * @Description:
 * @author: anthor
 * @date:2022/11/120:10
 */

public class AppListener implements ServletContextListener {


    @Override
    public void contextInitialized(ServletContextEvent sce)  {
        try {
            Logback.getlog().log(Level.INFO, "context has Initialized");
        } catch (IOException e) {
            e.printStackTrace();
        }
        ServletContextListener.super.contextInitialized(sce);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ServletContextListener.super.contextDestroyed(sce);
        try {
            Logback.getlog().log(Level.INFO, "context has Destroyed");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
