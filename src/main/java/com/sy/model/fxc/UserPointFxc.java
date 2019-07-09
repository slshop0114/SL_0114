package com.sy.model.fxc;

import java.util.Date;

public class UserPointFxc {
    private Integer pointId;
    private Date buytime;
    private Integer bonusUserId;
    private Integer userId;
    private Double buyPv;
    private Double bonusRate;
    private Double bonusPv;

    @Override
    public String toString() {
        return "UserPointFxc{" +
                "pointId=" + pointId +
                ", buytime=" + buytime +
                ", bonusUserId=" + bonusUserId +
                ", userId=" + userId +
                ", buyPv=" + buyPv +
                ", bonusRate=" + bonusRate +
                ", bonusPv=" + bonusPv +
                '}';
    }

    public Integer getPointId() {
        return pointId;
    }

    public void setPointId(Integer pointId) {
        this.pointId = pointId;
    }

    public Date getBuytime() {
        return buytime;
    }

    public void setBuytime(Date buytime) {
        this.buytime = buytime;
    }

    public Integer getBonusUserId() {
        return bonusUserId;
    }

    public void setBonusUserId(Integer bonusUserId) {
        this.bonusUserId = bonusUserId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
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
}
