package com.sy.model.dc;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;


//资讯管理表
public class Information {

    private Integer id ;//主键ID（必填）系统生成
    private String title;//标题（必填）
    private String content;//内容
    private Integer state;//状态（必填）1发布、0不发布
    private String publisher;//发布人
    @JsonFormat(pattern = "yyyy-MM-dd ", timezone="GMT+8")
    private Date publishTime;//发布时间
    private Integer typeId;//附件类型ID（必填）来源于数据字典表data_dictionary中typeCode =’INFO_TYPE’的valueId
    private String typeName;//附件类型NAME（必填）来源于数据字典表data_dictionary中typeCode        =’INFO_TYPE’的valueName
    private String fileName;//附件名称（必填）
    private String filePath;//附件存放路径（必填）
    private Double fileSize;//附件大小（必填）
    @JsonFormat(pattern = "yyyy-MM-dd ", timezone="GMT+8")
    private Date uploadTime;//上传时间（必填
    private Integer download;//下载次数

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
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

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public Double getFileSize() {
        return fileSize;
    }

    public void setFileSize(Double fileSize) {
        this.fileSize = fileSize;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    public Integer getDownload() {
        return download;
    }

    public void setDownload(Integer download) {
        this.download = download;
    }

    @Override
    public String toString() {
        return "Information{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", state=" + state +
                ", publisher='" + publisher + '\'' +
                ", publishTime=" + publishTime +
                ", typeId=" + typeId +
                ", typeName='" + typeName + '\'' +
                ", fileName='" + fileName + '\'' +
                ", filePath='" + filePath + '\'' +
                ", fileSize=" + fileSize +
                ", uploadTime=" + uploadTime +
                ", download=" + download +
                '}';
    }
}
