package com.jckj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jckj.dto.PageDto;
import com.jckj.model.Demo;
import com.jckj.service.DemoService;
import com.jckj.vo.JsonResult;

/**
 * @author: ljp
 * @description:  测试
 * @date: 2022年8月12日 上午11:42:20
 */
@RequestMapping("demo")
@RestController
public class DemoController {
	
	@Autowired
	private DemoService demoService;
	/**
	 * 列表
	 */
	@PostMapping("list")
	public JsonResult list(PageDto dto) {
		return JsonResult.success(demoService.list(dto));
	}
	/**
	 * 详情
	 */
	@PostMapping("info")
	public JsonResult info(Integer id) {
		return JsonResult.success(demoService.info(id));
	}
	/**
	 * 新增
	 */
	@PostMapping("add")
	public JsonResult add(@RequestBody Demo demo) {
		demoService.add(demo);
		return JsonResult.success();
	}
	/**
	 * 修改
	 */
	@PostMapping("update")
	public JsonResult update(@RequestBody Demo demo) {
		demoService.update(demo);
		return JsonResult.success();
	}
	/**
	 * 删除
	 */
	@PostMapping("remove")
	public JsonResult remove(Integer id) {
		demoService.remove(id);
		return JsonResult.success();
	}

}
