package com.jckj.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jckj.dto.PageDto;
import com.jckj.mapper.DemoMapper;
import com.jckj.model.Demo;
import com.jckj.service.DemoService;
import com.jckj.vo.PageVo;

/**
 * @author: ljp
 * @description: 
 * @date: 2022年8月12日 上午11:26:47
 */
@Service
public class DemoServiceImpl implements DemoService {

	@Autowired
	private DemoMapper demoMapper;
	
	/**
	 * 列表
	 * @param dto
	 * @return
	 */
	@Override
	public PageVo list(PageDto dto) {
		Integer count = demoMapper.count(dto);
		if(count ==0) {
			return PageVo.successPage();
		}
		return PageVo.successPage(demoMapper.list(dto),count);
	}

	/**
	 * 详情
	 * @param id
	 * @return
	 */
	@Override
	public Demo info(Integer id) {
		return demoMapper.info(id);
	}

	/**
	 * 添加
	 * @param demo
	 */
	@Override
	public void add(Demo demo) {
		demo.setCreateTime(System.currentTimeMillis());
		demo.setUpdateTime(System.currentTimeMillis());
		demoMapper.add(demo);
	}

	/**
	 * 修改
	 * @param demo
	 */
	@Override
	public void update(Demo demo) {
		demo.setUpdateTime(System.currentTimeMillis());
		demoMapper.update(demo);
	}

	/**
	 * 删除
	 * @param id
	 */
	@Override
	public void remove(Integer id) {
		demoMapper.remove(id);
	}

}
