package com.chilun.petStore.Util;



import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.util.logging.ConsoleHandler;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @Title:
 * @Description:
 * @author: anthor
 * @date:2022/11/120:57
 */
public class Logback {

    private volatile static Logger log = null;
    private volatile static FileHandler fileHandler = null;

    public static Logger getlog() throws IOException {
        if (log == null) {
            synchronized (Logback.class) {
                if (log == null) {
                    Logger log = Logger.getLogger("com.chilun.petStore.Util.Logback");
                    log.setLevel(Level.ALL);
                    ConsoleHandler consoleHandler = new ConsoleHandler();
                    consoleHandler.setLevel(Level.ALL);
                    log.addHandler(consoleHandler);
                    try {
                        String filePath = "E:\\" + File.separator + "logs";
                        String logPath = "LoggingDemo.log";
                        File fi = new File(filePath);
                        if ((fi.exists()) && (fi.isDirectory())) {
                            logPath = filePath + File.separator + logPath;
                        } else if (!fi.exists()) {
                            try {
                                fi.mkdirs();
                                logPath = filePath + File.separator + logPath;
                            } catch (Exception localException) {
                            }
                        }
                        if (fileHandler == null) {
                            fileHandler = new FileHandler(logPath, true);//true表示日志内容在文件中追加
                            fileHandler.setLevel(Level.ALL);//级别为ALL，记录所有消息
                            fileHandler.setFormatter(new LoggerFormatter());
                        }
                        log.addHandler(fileHandler);

                    } catch (Throwable e) {
                        System.out.println("创建文件失败！" + e.getMessage());
                    }
                    return log;
                }
            }
        }
        return log;
    }

    @Test
    public void a() throws IOException {
        Logger logger = Logback.getlog();
        getlog().log(Level.FINEST, "A");
        logger.finest("finest");
        logger.finer("finer");
        logger.fine("fine");
        logger.config("config");
        logger.info("info");
        logger.warning("warning");
        logger.severe("severe");
    }
}
