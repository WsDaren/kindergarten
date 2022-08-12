package com.jckj.service;


import com.jckj.dto.PageDto;
import com.jckj.model.Demo;
import com.jckj.vo.PageVo;

/**
 * @author: ljp
 * @description: 测试
 * @date: 2022年8月12日 上午11:20:16
 */
public interface DemoService {

	/**
	 * 列表
	 */
	PageVo list(PageDto dto);
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
