package com.sy.model.hyc;

import java.math.BigDecimal;
import java.util.Date;

public class UserAccount201312 {
    private String accountId;

    private String userId;

    private Date accountDate;

    private Integer stat;

    private BigDecimal baseIn;

    private BigDecimal baseOut;

    private BigDecimal baseBalance;

    private BigDecimal repeatIn;

    private BigDecimal repeatOut;

    private BigDecimal repeatBalance;

    private BigDecimal freePv;

    private BigDecimal alreadyPv;

    private BigDecimal buyPv;

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId == null ? null : accountId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public Date getAccountDate() {
        return accountDate;
    }

    public void setAccountDate(Date accountDate) {
        this.accountDate = accountDate;
    }

    public Integer getStat() {
        return stat;
    }

    public void setStat(Integer stat) {
        this.stat = stat;
    }

    public BigDecimal getBaseIn() {
        return baseIn;
    }

    public void setBaseIn(BigDecimal baseIn) {
        this.baseIn = baseIn;
    }

    public BigDecimal getBaseOut() {
        return baseOut;
    }

    public void setBaseOut(BigDecimal baseOut) {
        this.baseOut = baseOut;
    }

    public BigDecimal getBaseBalance() {
        return baseBalance;
    }

    public void setBaseBalance(BigDecimal baseBalance) {
        this.baseBalance = baseBalance;
    }

    public BigDecimal getRepeatIn() {
        return repeatIn;
    }

    public void setRepeatIn(BigDecimal repeatIn) {
        this.repeatIn = repeatIn;
    }

    public BigDecimal getRepeatOut() {
        return repeatOut;
    }

    public void setRepeatOut(BigDecimal repeatOut) {
        this.repeatOut = repeatOut;
    }

    public BigDecimal getRepeatBalance() {
        return repeatBalance;
    }

    public void setRepeatBalance(BigDecimal repeatBalance) {
        this.repeatBalance = repeatBalance;
    }

    public BigDecimal getFreePv() {
        return freePv;
    }

    public void setFreePv(BigDecimal freePv) {
        this.freePv = freePv;
    }

    public BigDecimal getAlreadyPv() {
        return alreadyPv;
    }

    public void setAlreadyPv(BigDecimal alreadyPv) {
        this.alreadyPv = alreadyPv;
    }

    public BigDecimal getBuyPv() {
        return buyPv;
    }

    public void setBuyPv(BigDecimal buyPv) {
        this.buyPv = buyPv;
    }
}