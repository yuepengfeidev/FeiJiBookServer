package com.ypf.feijibookserver.entity;

/**
 * AdminBean
 *
 * @author PengFei Yue
 * @date 2022/3/17
 * @description
 */
public class AdminBean {
    String name;// 字段带下划线，mybatis不能封装成类
    String password;

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
}
