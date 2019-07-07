package com.sy.model.hyc;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.math.BigDecimal;
import java.util.Date;

public class UserAccountLog201404 {
    private Integer accountlogid;

    private Integer userid;

    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date actiontime;

    private String actiondesc;

    private Integer actiontype;

    private BigDecimal basein;

    private BigDecimal baseout;

    private BigDecimal basebalance;

    private BigDecimal repeatin;

    private BigDecimal repeatout;

    private BigDecimal repeatbalance;

    public Integer getAccountlogid() {
        return accountlogid;
    }

    public void setAccountlogid(Integer accountlogid) {
        this.accountlogid = accountlogid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getActiontime() {
        return actiontime;
    }

    public void setActiontime(Date actiontime) {
        this.actiontime = actiontime;
    }

    public String getActiondesc() {
        return actiondesc;
    }

    public void setActiondesc(String actiondesc) {
        this.actiondesc = actiondesc == null ? null : actiondesc.trim();
    }

    public Integer getActiontype() {
        return actiontype;
    }

    public void setActiontype(Integer actiontype) {
        this.actiontype = actiontype;
    }

    public BigDecimal getBasein() {
        return basein;
    }

    public void setBasein(BigDecimal basein) {
        this.basein = basein;
    }

    public BigDecimal getBaseout() {
        return baseout;
    }

    public void setBaseout(BigDecimal baseout) {
        this.baseout = baseout;
    }

    public BigDecimal getBasebalance() {
        return basebalance;
    }

    public void setBasebalance(BigDecimal basebalance) {
        this.basebalance = basebalance;
    }

    public BigDecimal getRepeatin() {
        return repeatin;
    }

    public void setRepeatin(BigDecimal repeatin) {
        this.repeatin = repeatin;
    }

    public BigDecimal getRepeatout() {
        return repeatout;
    }

    public void setRepeatout(BigDecimal repeatout) {
        this.repeatout = repeatout;
    }

    public BigDecimal getRepeatbalance() {
        return repeatbalance;
    }

    public void setRepeatbalance(BigDecimal repeatbalance) {
        this.repeatbalance = repeatbalance;
    }
}