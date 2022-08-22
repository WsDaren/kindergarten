package com.jckj.service.impl;

import com.jckj.dto.PageDto;
import com.jckj.mapper.UserMapper;
import com.jckj.model.User;
import com.jckj.service.UserService;
import com.jckj.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: ljp
 * @description: 
 * @date: 2022年8月12日 上午11:26:47
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 列表
	 * @param
	 * @return
	 */
	@Override
	public Map<String, Object> list(int page, int limit) {
		List<User> list = userMapper.findAll((page - 1) * limit, limit);
		Map<String,Object> map = new HashMap<>();
		map.put("code",0);
		map.put("msg","");
		map.put("count",userMapper.count());
		map.put("data",list);
		return map;
	}

	/**
	 * 详情
	 * @param uid
	 * @return
	 */
	@Override
	public User info(String uid) {
		return userMapper.info(uid);
	}

	/**
	 * 添加
	 * @param user
	 */
	@Override
	public void add(User user) {
		userMapper.add(user);
	}

	/**
	 * 修改
	 * @param user
	 */
	@Override
	public void update(User user) {
		userMapper.update(user);
	}

	/**
	 * 删除
	 * @param uid
	 */
	@Override
	public void remove(String uid) {
		userMapper.remove(uid);
	}

}
