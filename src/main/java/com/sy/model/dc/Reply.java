package com.sy.model.dc;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

//留言回复表
public class Reply {
    private Integer id;//主键 ID （必填） 系统生成
    private Integer messageId;//留言 ID（主表）必填 取自 leave_message 表的主键 id
    private String replyContent;//回复内容
    private String createdBy;//createdBy 回复人 取自 au_user 表中的 loginCode
    @JsonFormat(pattern = "yyyy-MM-dd ", timezone="GMT+8")
    private Date createTime;//回复时间

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMessageid() {
        return messageId;
    }

    public void setMessageid(Integer messageid) {
        this.messageId = messageid;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Reply{" +
                "id=" + id +
                ", messageId=" + messageId +
                ", replyContent='" + replyContent + '\'' +
                ", createdBy='" + createdBy + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
