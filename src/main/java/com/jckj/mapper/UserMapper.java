package com.jckj.mapper;

import com.jckj.dto.PageDto;
import com.jckj.model.Demo;
import com.jckj.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: ljp
 * @description: 测试
 * @date: 2022年8月12日 上午11:28:19
 */
public interface UserMapper {
	/**
	 * 列表
	 */
	List<User> findAll(@Param(value = "page") int page,@Param(value = "limit") int limit);
	
	/**
	 * 列表总数
	 */
	int count();

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
