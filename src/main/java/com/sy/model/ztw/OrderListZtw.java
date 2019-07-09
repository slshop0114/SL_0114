package com.sy.model.ztw;

public class OrderListZtw {
    private String listId;
    private Integer goodsId;
    private String goodsSn;
    private String goodsName;
    private String goodsFormat;
    private Integer goodsNum;
    private Integer eachPrice;
    private Integer sumPrice;
    private Integer discount;
    private Integer healPrice;
    private String currency;
    private Integer realPv;
    private Integer pvRate;
    private Integer buy_userid;

    public Integer getBuy_userid() {
        return buy_userid;
    }

    public void setBuy_userid(Integer buy_userid) {
        this.buy_userid = buy_userid;
    }

    public String getListId() {
        return listId;
    }

    public void setListId(String listId) {
        this.listId = listId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsSn() {
        return goodsSn;
    }

    public void setGoodsSn(String goodsSn) {
        this.goodsSn = goodsSn;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsFormat() {
        return goodsFormat;
    }

    public void setGoodsFormat(String goodsFormat) {
        this.goodsFormat = goodsFormat;
    }

    public Integer getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(Integer goodsNum) {
        this.goodsNum = goodsNum;
    }

    public Integer getEachPrice() {
        return eachPrice;
    }

    public void setEachPrice(Integer eachPrice) {
        this.eachPrice = eachPrice;
    }

    public Integer getSumPrice() {
        return sumPrice;
    }

    public void setSumPrice(Integer sumPrice) {
        this.sumPrice = sumPrice;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public Integer getHealPrice() {
        return healPrice;
    }

    public void setHealPrice(Integer healPrice) {
        this.healPrice = healPrice;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public Integer getRealPv() {
        return realPv;
    }

    public void setRealPv(Integer realPv) {
        this.realPv = realPv;
    }

    public Integer getPvRate() {
        return pvRate;
    }

    public void setPvRate(Integer pvRate) {
        this.pvRate = pvRate;
    }

    @Override
    public String toString() {
        return "OrderListZtw{" +
                "listId='" + listId + '\'' +
                ", goodsId='" + goodsId + '\'' +
                ", goodsSn='" + goodsSn + '\'' +
                ", goodsName='" + goodsName + '\'' +
                ", goodsFormat='" + goodsFormat + '\'' +
                ", goodsNum=" + goodsNum +
                ", eachPrice=" + eachPrice +
                ", sumPrice=" + sumPrice +
                ", discount=" + discount +
                ", healPrice=" + healPrice +
                ", currency='" + currency + '\'' +
                ", realPv=" + realPv +
                ", pvRate=" + pvRate +
                ", buy_userid=" + buy_userid +
                '}';
    }
}
