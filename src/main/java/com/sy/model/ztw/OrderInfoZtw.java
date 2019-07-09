package com.sy.model.ztw;

import java.util.Date;

public class OrderInfoZtw {
    private String orderid;
    private Date ordertime;
    private String ordersn;
    private int pickuserid;
    private int buyuserid;
    private int repeatpv;
    private int basepv;
    private int servicefee;
    private int shipfre;
    private String tax;
    private String country;
    private String tel;
    private String mobile;
    private String email;
    private String useraddress;
    private int postcode;
    private Integer sata;
    private String shiptype;
    private String shipnum;
    private Date shiptime;
    private String shipnote;

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public String getOrdersn() {
        return ordersn;
    }

    public void setOrdersn(String ordersn) {
        this.ordersn = ordersn;
    }

    public int getPickuserid() {
        return pickuserid;
    }

    public void setPickuserid(int pickuserid) {
        this.pickuserid = pickuserid;
    }

    public int getBuyuserid() {
        return buyuserid;
    }

    public void setBuyuserid(int buyuserid) {
        this.buyuserid = buyuserid;
    }

    public int getRepeatpv() {
        return repeatpv;
    }

    public void setRepeatpv(int repeatpv) {
        this.repeatpv = repeatpv;
    }

    public int getBasepv() {
        return basepv;
    }

    public void setBasepv(int basepv) {
        this.basepv = basepv;
    }

    public int getServicefee() {
        return servicefee;
    }

    public void setServicefee(int servicefee) {
        this.servicefee = servicefee;
    }

    public int getShipfre() {
        return shipfre;
    }

    public void setShipfre(int shipfre) {
        this.shipfre = shipfre;
    }

    public String getTax() {
        return tax;
    }

    public void setTax(String tax) {
        this.tax = tax;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUseraddress() {
        return useraddress;
    }

    public void setUseraddress(String useraddress) {
        this.useraddress = useraddress;
    }

    public int getPostcode() {
        return postcode;
    }

    public void setPostcode(int postcode) {
        this.postcode = postcode;
    }

    public Integer getSata() {
        return sata;
    }

    public void setSata(Integer sata) {
        this.sata = sata;
    }

    public String getShiptype() {
        return shiptype;
    }

    public void setShiptype(String shiptype) {
        this.shiptype = shiptype;
    }

    public String getShipnum() {
        return shipnum;
    }

    public void setShipnum(String shipnum) {
        this.shipnum = shipnum;
    }

    public Date getShiptime() {
        return shiptime;
    }

    public void setShiptime(Date shiptime) {
        this.shiptime = shiptime;
    }

    public String getShipnote() {
        return shipnote;
    }

    public void setShipnote(String shipnote) {
        this.shipnote = shipnote;
    }

    @Override
    public String toString() {
        return "OrderInfoZtw{" +
                "orderid='" + orderid + '\'' +
                ", ordertime=" + ordertime +
                ", ordersn='" + ordersn + '\'' +
                ", pickuserid=" + pickuserid +
                ", buyuserid=" + buyuserid +
                ", repeatpv=" + repeatpv +
                ", basepv=" + basepv +
                ", servicefee=" + servicefee +
                ", shipfre=" + shipfre +
                ", tax='" + tax + '\'' +
                ", country='" + country + '\'' +
                ", tel='" + tel + '\'' +
                ", mobile='" + mobile + '\'' +
                ", email='" + email + '\'' +
                ", useraddress='" + useraddress + '\'' +
                ", postcode=" + postcode +
                ", sata='" + sata + '\'' +
                ", shiptype='" + shiptype + '\'' +
                ", shipnum='" + shipnum + '\'' +
                ", shiptime=" + shiptime +
                ", shipnote='" + shipnote + '\'' +
                '}';
    }
}
