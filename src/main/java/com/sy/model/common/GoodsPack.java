package com.sy.model.common;

import java.util.Date;
import java.util.List;

/**
 * GoodsPack
 *
 */
public class GoodsPack extends Base{
	private Integer id;
	private String goodsPackName;
	private String goodsPackCode;
	private Integer typeId;
	private String typeName;
	private Double totalPrice;
	private Integer state;
	private String note; 
	private Integer num;
	private String createdBy;
	private Date createTime;
	private Date lastUpdateTime;
	
	private List<GoodsInfo> goodsInfos;


	public List<GoodsInfo> getGoodsInfos() {
		return goodsInfos;
	}

	public void setGoodsInfos(List<GoodsInfo> goodsInfos) {
		this.goodsInfos = goodsInfos;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGoodsPackName() {
		return goodsPackName;
	}
	public void setGoodsPackName(String goodsPackName) {
		this.goodsPackName = goodsPackName;
	}
	public String getGoodsPackCode() {
		return goodsPackCode;
	}
	public void setGoodsPackCode(String goodsPackCode) {
		this.goodsPackCode = goodsPackCode;
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
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
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
	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	@Override
	public String toString() {
		return "GoodsPack{" +
				"id=" + id +
				", goodsPackName='" + goodsPackName + '\'' +
				", goodsPackCode='" + goodsPackCode + '\'' +
				", typeId=" + typeId +
				", typeName='" + typeName + '\'' +
				", totalPrice=" + totalPrice +
				", state=" + state +
				", note='" + note + '\'' +
				", num=" + num +
				", createdBy='" + createdBy + '\'' +
				", createTime=" + createTime +
				", lastUpdateTime=" + lastUpdateTime +
				'}';
	}
}
