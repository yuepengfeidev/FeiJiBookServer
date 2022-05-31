package com.ypf.feijibookserver.entity;

/**
 * DataModelBean
 *
 * @author PengFei Yue
 * @date 2022/4/1
 * @description
 */
public class DataModelBean {
    int id;
    int catering;
    int traffic;
    int shopping;
    int daily;
    int amusement;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCatering() {
        return catering;
    }

    public void setCatering(int catering) {
        this.catering = catering;
    }

    public int getTraffic() {
        return traffic;
    }

    public void setTraffic(int traffic) {
        this.traffic = traffic;
    }

    public int getShopping() {
        return shopping;
    }

    public void setShopping(int shopping) {
        this.shopping = shopping;
    }

    public int getDaily() {
        return daily;
    }

    public void setDaily(int daily) {
        this.daily = daily;
    }

    public int getAmusement() {
        return amusement;
    }

    public void setAmusement(int amusement) {
        this.amusement = amusement;
    }
}
