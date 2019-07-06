package com.sy.model.dc;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.List;

//留言表
public class Leave_message {
    private Integer id;//ID。必填 系统生成
    private String createdBy;// 留言用户 取自 au_user
    private  String messageCode;// 留言编码 系统生成
    private  String messageTitle;// 留言标题
    private String messageContent;// 留言内容（必填）
    private Integer state;// 状态（必填） 1、已回复
    @JsonFormat(pattern = "yyyy-MM-dd ", timezone="GMT+8")
    private Date createTime;// 留言时间
    private List<Reply> reply;//回复


    public List<Reply> getReply() {
        return reply;
    }

    @Override
    public String toString() {
        return "Leave_message{" +
                "id=" + id +
                ", createdBy='" + createdBy + '\'' +
                ", messageCode='" + messageCode + '\'' +
                ", messageTitle='" + messageTitle + '\'' +
                ", messageContent='" + messageContent + '\'' +
                ", state=" + state +
                ", createTime=" + createTime +
                ", reply=" + reply +
                '}';
    }

    public void setReply(List<Reply> reply) {
        this.reply = reply;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getMessageCode() {
        return messageCode;
    }

    public void setMessageCode(String messageCode) {
        this.messageCode = messageCode;
    }

    public String getMessageTitle() {
        return messageTitle;
    }

    public void setMessageTitle(String messageTitle) {
        this.messageTitle = messageTitle;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
