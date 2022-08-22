package com.jckj.controller;

import com.jckj.dto.PageDto;
import com.jckj.model.User;
import com.jckj.service.UserService;
import com.jckj.vo.JsonResult;
import com.jckj.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @author:
 * @description:
 * @date:
 */
@RequestMapping("user")
@RestController
public class UserController {
	
	@Autowired
	private UserService userService;
	/**
	 * 列表
	 */
	@RequestMapping("list")
	public Map<String, Object> list(int page, int limit) {
		Map<String, Object> map = userService.list(page, limit);
		return map;
	}
	/**
	 * 详情
	 */
	@PostMapping("info")
	public JsonResult info(String uid) {
		return JsonResult.success(userService.info(uid));
	}
	/**
	 * 新增
	 */
	@PostMapping("add")
	public JsonResult add(@RequestBody User user) {
		userService.add(user);
		return JsonResult.success();
	}
	/**
	 * 修改
	 */
	@PostMapping("update")
	public JsonResult update(@RequestBody User user) {
		userService.update(user);
		return JsonResult.success();
	}
	/**
	 * 删除
	 */
	@PostMapping("remove")
	public JsonResult remove(String uid) {
		userService.remove(uid);
		return JsonResult.success();
	}

}
