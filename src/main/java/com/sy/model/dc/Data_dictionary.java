package com.sy.model.dc;

public class Data_dictionary {
   private Integer id  ;// 主键 ID，系统生成
   private String typeCode  ;// 类型编码（必填） 必须唯一
   private String typeName   ;// 类型名称（必填）
   private Integer valueId    ;// 类型值 ID（必填） 必须唯一
   private String valueName ;// 类型值 Name（必填）

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public Integer getValueId() {
        return valueId;
    }

    public void setValueId(Integer valueId) {
        this.valueId = valueId;
    }

    public String getValueName() {
        return valueName;
    }

    public void setValueName(String valueName) {
        this.valueName = valueName;
    }

    @Override
    public String toString() {
        return "Data_dictionary{" +
                "id=" + id +
                ", typeCode='" + typeCode + '\'' +
                ", typeName='" + typeName + '\'' +
                ", valueId=" + valueId +
                ", valueName='" + valueName + '\'' +
                '}';
    }
}
