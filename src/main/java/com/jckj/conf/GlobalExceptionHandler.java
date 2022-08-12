package com.jckj.conf;

import com.jckj.vo.JsonResult;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.BindException;
import org.springframework.validation.ObjectError;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.util.Set;

/**
 * @author: hxy
 * @description: 统一异常拦截
 * @date: 2017/10/24 10:31
 */
@ControllerAdvice
@ResponseBody
public class GlobalExceptionHandler {
	private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

	/**
	 * 前端json传参格式不正确会出现该异常
	 * */
	@ExceptionHandler(value = HttpMessageNotReadableException.class)
	public JsonResult HttpMessageNotReadableExceptionHandler(HttpServletRequest req, Exception e){
		e.printStackTrace();
		return JsonResult.error("后端拦截到json参数格式异常，请检查json传参格式是否有误");
	}
	/**
	 * 当接口需要son传参的时候，前端使用了formj传参，会报此异常
	 * */
	@ExceptionHandler(value = HttpRequestMethodNotSupportedException.class)
	public JsonResult HttpRequestMethodNotSupportedExceptionHandler(HttpServletRequest req, Exception e){
		e.printStackTrace();
		return JsonResult.error("该接口需要json格式传参，请检查传参格式是否有误");
	}

	@ExceptionHandler(value = Exception.class)
	public JsonResult defaultErrorHandler(HttpServletRequest req, Exception e) {
		String errorPosition = "";
		//如果错误堆栈信息存在
		if (e.getStackTrace().length > 0) {
			StackTraceElement element = e.getStackTrace()[0];
			String fileName = element.getFileName() == null ? "未找到错误文件" : element.getFileName();
			int lineNumber = element.getLineNumber();
			errorPosition = fileName + ":" + lineNumber;
		}
		logger.error("异常", e);
		return JsonResult.error(500, "请求处理异常:"+errorPosition);
	}


	/**
	 * hibernate validator 方法中使用@Valid时，数据绑定验证异常拦截
	 *
	 * @param e 绑定验证异常
	 * @return 错误返回消息
	 */
	@ExceptionHandler(BindException.class)
	public JsonResult validateErrorHandler(BindException e) {
		ObjectError error = e.getAllErrors().get(0);
		logger.error("数据验证异常：{}", error.getDefaultMessage());
		return JsonResult.error(error.getDefaultMessage());
	}

	/**
	 * hibernate validator 方法中使用@Valid时，数据绑定验证异常拦截
	 *
	 * @param e 绑定验证异常
	 * @return 错误返回消息
	 */
	@ExceptionHandler(MethodArgumentNotValidException.class)
	public JsonResult validateErrorHandler(MethodArgumentNotValidException e) {
		ObjectError error = e.getBindingResult().getAllErrors().get(0);
		logger.error("数据验证异常：{}", error.getDefaultMessage());
		return JsonResult.error(error.getDefaultMessage());
	}

	/**
	 * spring validator 类上使用@Validated时，参数验证异常拦截
	 *
	 * @param e 绑定验证异常
	 * @return 错误返回消息
	 */
	@ExceptionHandler(ConstraintViolationException.class)
	public JsonResult defaultErrorHandler(ConstraintViolationException e) {
		Set<ConstraintViolation<?>> violations = e.getConstraintViolations();
		ConstraintViolation<?> violation = violations.iterator().next();
		logger.error("数据验证异常：{}", violation.getMessage());
		return JsonResult.error(violation.getMessage());
	}
/*	*//**
	 * GET/POST请求方法错误的拦截器
	 * 因为开发时可能比较常见,而且发生在进入controller之前,上面的拦截器拦截不到这个错误
	 * 所以定义了这个拦截器
	 *//*
	@ExceptionHandler(HttpRequestMethodNotSupportedException.class)
	public JSONObject httpRequestMethodHandler() {
		return CommonUtil.errorJson(ErrorEnum.E_500);
	}*/

}
