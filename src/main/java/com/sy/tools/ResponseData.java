package com.sy.tools;

public class ResponseData {
    private Integer code;//响应数据的状态
    private String message;//响应的消息内容
    private Object data;//响应的实体

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;

    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
