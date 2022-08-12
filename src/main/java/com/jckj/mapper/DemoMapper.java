package com.jckj.mapper;

import java.util.List;

import com.jckj.dto.PageDto;
import com.jckj.model.Demo;

/**
 * @author: ljp
 * @description: 测试
 * @date: 2022年8月12日 上午11:28:19
 */
public interface DemoMapper {
	/**
	 * 列表
	 */
	List<Demo> list(PageDto dto);
	
	/**
	 * 列表总数
	 */
	Integer count(PageDto dto);
	
	/**
	 * 详情
	 */
	Demo info(Integer id);
	
	/**
	 * 新增
	 */
	void add(Demo demo);
	
	/**
	 * 修改
	 */
	void update(Demo demo);
	
	/**
	 * 删除
	 */
	void remove(Integer id);

}
