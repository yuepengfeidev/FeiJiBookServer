package com.ypf.feijibookserver.entity;

import java.math.BigDecimal;

/**
 * YearExpendBean
 *
 * @author PengFei Yue
 * @date 2022/4/2
 * @description
 */
public class YearExpendBean {
    String account;
    int year;
    BigDecimal money;
    String type;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
