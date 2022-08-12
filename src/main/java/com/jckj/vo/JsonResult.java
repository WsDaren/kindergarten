package com.jckj.vo;


import java.io.Serializable;

/**
 * 基于此对象封装控制层对象 的响应结果,在此对象中应该 包含返回到客户端的数据以及 一个状态码和状态信息
 */
public class JsonResult implements Serializable {
	private static final long serialVersionUID = -5766977494287555486L;
	/** 状态码 */
	private int state = 200;// 200 ok,500 error
	/** 状态码对应的信息 */
	private String message = "ok";
	/** 正常数据 */
	private Object data;

	public JsonResult(String message) {
		this.message = message;
	}

	public JsonResult(Object data) {
		this.data = data;
	}

	public JsonResult(int state,String message){
		this.state=state;
		this.message=message;
	}
	public JsonResult(Throwable e) {
		this.state = 500;
		this.message = e.getMessage();
	}
	/**
	 * 返回成功
	 * @param data
	 * @return
	 */
	public static JsonResult success() {
		return new JsonResult();
	}
	/**
	 * 返回成功
	 * @param data
	 * @return
	 */
	public static JsonResult success(Object data) {
		return new JsonResult(data);
	}
	/**
	 * 返回失败
	 * @param msg
	 * @return
	 */
	public static JsonResult error(String msg) {
		return new JsonResult(msg);
	}
	/**
	 * 返回失败
	 * @param msg
	 * @return
	 */
	public static JsonResult error(Integer code,String msg) {
		return new JsonResult(code,msg);
	}
	/**
	 * 返回失败
	 * @param msg
	 * @return
	 */
	public static JsonResult error(Throwable e) {
		return new JsonResult(500,e.getLocalizedMessage());
	}
	
	
	
	

	public JsonResult() {
		super();
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
	
	

}
