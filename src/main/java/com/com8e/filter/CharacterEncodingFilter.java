package com.com8e.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

//Tomcat 9.x : java 8 컴파일 interface 내부적으로 코딩이 가능 , default 기능 모든 메소드 구현 안해도됌 
//Tomcat 8.x : java 7 컴파일 interface 모든 메서드 구현 해야함 (init, destroy, dofilter)

public class CharacterEncodingFilter implements Filter {

	private String encoding;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		encoding = "UTF-8";

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub

		HttpServletRequest req = (HttpServletRequest) request;
		req.setCharacterEncoding(encoding);
		chain.doFilter(request, response);
	}

}
