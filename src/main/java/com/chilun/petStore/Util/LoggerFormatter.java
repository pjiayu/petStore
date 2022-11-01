package com.chilun.petStore.Util;

import java.io.IOException;
import java.util.Date;
import java.util.logging.*;

/**
 * Created by N3verL4nd on 2017/4/24.
 */

class LoggerFormatter extends Formatter {

    @Override
    public String format(LogRecord record) {
        return "[" + new Date() + "]" + " [" + record.getLevel() + "] "
                + record.getClass() + record.getMessage() + "\n";
    }
}

//public class LogDemo {
//    public static void main(String[] args) throws IOException {
//        Logger logger = Logger.getLogger("com.xiya.test.LogDemo");
//        logger.setLevel(Level.ALL);
//        ConsoleHandler consoleHandler = new ConsoleHandler();
//        logger.addHandler(consoleHandler);
//        FileHandler fileHandler = new FileHandler("testLog.log");
//        fileHandler.setFormatter(new LoggerFormatter());
//        logger.addHandler(fileHandler);
//        logger.info("hi");
//    }
//}