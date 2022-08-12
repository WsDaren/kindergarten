package com.jckj.vo;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

/**
 * @author: ljp
 * @description: 分页返回对象
 * @date: 2022年8月12日 上午11:24:29
 */
public class PageVo implements Serializable{

	private static final long serialVersionUID = -5098903228017788445L;

	/**
     * 数据总页数
     * */
    private Integer totalPage;
    /**
     * 分页数据
     * */
    private List<?> list;
    /**
     * 数据总个数
     * */
    private Integer totalCount;

	public static PageVo successPage() {
		PageVo vo=new PageVo();
		vo.setList(Collections.emptyList());
		vo.setTotalCount(0);
		return vo;
	}
    public static PageVo successPage(List<?> list,Integer totalCount) {
    	PageVo vo=new PageVo();
    	vo.setList(list);
    	vo.setTotalCount(totalCount);
    	return vo;
    }
    
    
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public List<?> getList() {
		return list;
	}
	public void setList(List<?> list) {
		this.list = list;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
}
