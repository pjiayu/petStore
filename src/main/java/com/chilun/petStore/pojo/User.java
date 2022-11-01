package com.chilun.petStore.pojo;

/**
 * @auther 齿轮
 * @create 2022-10-26-15:50
 * 用户类
 */
public class User {
    private long userID;
    private String name;
    private String address;
    private String password;
    private String account;
    private Cart cart;

    public User() {
    }

    @Override
    public String toString() {
        return "User{" +
                "userID=" + userID +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", password='" + password + '\'' +
                ", account='" + account + '\'' +
                ", cart=" + cart +
                '}';
    }

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public User(String account,String password,String name){
        this.account=account;
        this.password=password;
        this.name=name;
    }

    public User(long userID, String name, String address, String password, String account, Cart cart) {
        this.userID = userID;
        this.name = name;
        this.address = address;
        this.password = password;
        this.account = account;
        this.cart = cart;
    }
}
