package com.ypf.feijibookserver.entity;

/**
 * MonthRecordBean
 *
 * @author PengFei Yue
 * @date 2022/4/4
 * @description
 */
public class MonthRecordBean {
    String account;
    String year;
    String month;
    String ioe;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getIoe() {
        return ioe;
    }

    public void setIoe(String ioe) {
        this.ioe = ioe;
    }
}
