package com.jckj.service;


import com.jckj.dto.PageDto;
import com.jckj.model.Demo;
import com.jckj.model.User;
import com.jckj.vo.PageVo;

import java.util.Map;

/**
 * @author: ljp
 * @description: 测试
 * @date: 2022年8月12日 上午11:20:16
 */
public interface UserService {

	/**
	 * 列表
	 */
	Map<String, Object> list(int page, int limit);
	/**
	 * 详情
	 */
	User info(String uid);
	/**
	 * 新增
	 */
	void add(User user);
	/**
	 * 修改
	 */
	void update(User user);
	/**
	 * 删除
	 */
	void remove(String uid);
}
