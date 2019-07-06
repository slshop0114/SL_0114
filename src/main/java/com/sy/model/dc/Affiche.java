package com.sy.model.dc;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

//公告表
public class Affiche {

   private Integer id;//主键ID
   private String code;//编码
    private String title;//标题
    private String content;//内容
    private String publisher;//发布人
    @JsonFormat(pattern = "yyyy-MM-dd ", timezone="GMT+8")
    private Date publishTime;//发布时间
//    @JsonFormat(pattern = "yyyy-MM-dd ", timezone="GMT+8")
    private  Date startTime;//生效时间
//    @JsonFormat(pattern = "yyyy-MM-dd ", timezone="GMT+8")
    private  Date endTime;//失效时间

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "Affiche{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", publisher='" + publisher + '\'' +
                ", publishTime=" + publishTime +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                '}';
    }
}
