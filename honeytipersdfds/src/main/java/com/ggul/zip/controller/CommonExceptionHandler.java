package com.ggul.zip.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;



@ControllerAdvice
public class CommonExceptionHandler {

	
	@ExceptionHandler(ArithmeticException.class)
	public ModelAndView handleException(ArithmeticException e){ 
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("exception", e); 
		mav.setViewName("/error/errorArithmetic"); 
		return mav; 

		} 
	
	@ExceptionHandler(NullPointerException.class)
	public ModelAndView handleException(NullPointerException e){ 
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("exception", e); 
		mav.setViewName("/error/errorNullPointer"); 
		return mav; 

		} 
	
	@ExceptionHandler(IllegalArgumentException.class)
	public ModelAndView handleException(IllegalArgumentException e){ 
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("exception", e); 
		mav.setViewName("/error/errorException"); 
		return mav; 

		}
	
//최상위 Exception은 제일 하단에 작성
	@ExceptionHandler(Exception.class)
	public ModelAndView handleException(Exception e){ 
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("exception", e); 
		mav.setViewName("/error/errorException"); 
		return mav; 

		}
	
}
