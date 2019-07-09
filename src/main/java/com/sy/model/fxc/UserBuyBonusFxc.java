package com.sy.model.fxc;

import java.util.Date;

public class UserBuyBonusFxc {
    private Integer buyBonusId;
    private String bonusMonth;
    private Date calTime;
    private Integer bonusUserId;
    private Double buyPv;
    private Double bonusRate;
    private Double bonusPv;

    public Integer getBuyBonusId() {
        return buyBonusId;
    }

    public void setBuyBonusId(Integer buyBonusId) {
        this.buyBonusId = buyBonusId;
    }

    public String getBonusMonth() {
        return bonusMonth;
    }

    public void setBonusMonth(String bonusMonth) {
        this.bonusMonth = bonusMonth;
    }

    public Date getCalTime() {
        return calTime;
    }

    public void setCalTime(Date calTime) {
        this.calTime = calTime;
    }

    public Integer getBonusUserId() {
        return bonusUserId;
    }

    public void setBonusUserId(Integer bonusUserId) {
        this.bonusUserId = bonusUserId;
    }

    public Double getBuyPv() {
        return buyPv;
    }

    public void setBuyPv(Double buyPv) {
        this.buyPv = buyPv;
    }

    public Double getBonusRate() {
        return bonusRate;
    }

    public void setBonusRate(Double bonusRate) {
        this.bonusRate = bonusRate;
    }

    public Double getBonusPv() {
        return bonusPv;
    }

    public void setBonusPv(Double bonusPv) {
        this.bonusPv = bonusPv;
    }

    @Override
    public String toString() {
        return "UserBuyBonusFxc{" +
                "buyBonusId=" + buyBonusId +
                ", bonusMonth='" + bonusMonth + '\'' +
                ", calTime=" + calTime +
                ", bonusUserId=" + bonusUserId +
                ", buyPv=" + buyPv +
                ", bonusRate=" + bonusRate +
                ", bonusPv=" + bonusPv +
                '}';
    }
}
