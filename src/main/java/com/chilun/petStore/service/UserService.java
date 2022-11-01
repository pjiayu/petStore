package com.chilun.petStore.service;

import com.chilun.petStore.dao.ConnUtil;
import com.chilun.petStore.dao.specialDAO.UserDAO;
import com.chilun.petStore.pojo.User;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * @author 皮皮皮
 * @date 2022/10/30 12:28
 */
public class UserService {

    private UserDAO userDAO=new UserDAO();
    Connection connection;


    public boolean login(String account, String password) {

        try{
            //获取数据库连接
            connection= ConnUtil.getConn();
            //查询账号和密码
            User user= userDAO.getUserByAcc(account);
            if(user!=null){
                if(user.getPassword().equals(password)){  //不能用 ==来判断
                    return true;
                }else{
                    return false;
                }
            }else{
                return false;
            }

        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        finally {
            try {
                ConnUtil.closeConn();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }

    public boolean isExist(String account){
        try{
            //获取数据库连接
            connection= ConnUtil.getConn();
            //查询账号和密码
            User user= userDAO.getUserByAcc(account);
            if(user==null){
                return false;
            }
                return true;
        }catch (Exception e){
            e.printStackTrace();
            return true;
        }
        finally {
            try {
                ConnUtil.closeConn();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public void add(User user) {
        try {
            //获取数据库连接
            connection= ConnUtil.getConn();
            //数据库增加用户

            userDAO.addUser(user);
        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            try {
                ConnUtil.closeConn();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public User getUser(String account){
        try{
            //获取数据库连接
            connection= ConnUtil.getConn();
            //查询账号和密码
            User user= userDAO.getUserByAcc(account);
            return user;

        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
        finally {
            try {
                ConnUtil.closeConn();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public void updatePsw(User user){
        try{
            //获取数据库连接
            connection= ConnUtil.getConn();
            //查询账号和密码
            userDAO.updateUserById(user);


        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            try {
                ConnUtil.closeConn();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
