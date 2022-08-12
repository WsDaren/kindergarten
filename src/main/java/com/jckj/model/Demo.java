package com.jckj.model;

import java.io.Serializable;

/**
 * @author: ljp
 * @description: 测试用
 * @date: 2022年8月12日 上午11:17:50
 */
public class Demo implements Serializable{

	private static final long serialVersionUID = -7636690784258279346L;
	/** 主键 */
	private Integer id;
	/** 名称 */
	private String name;
	/** 创建时间 */
	private Long createTime;
	/** 更新时间 */
	private Long updateTime;
	/** 逻辑删除(不要boolean，工具生成的getset方法名会对不上) */
	private Integer isDelete;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	public Long getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Long createTime) {
		this.createTime = createTime;
	}
	public Long getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Long updateTime) {
		this.updateTime = updateTime;
	}
	
	

}
