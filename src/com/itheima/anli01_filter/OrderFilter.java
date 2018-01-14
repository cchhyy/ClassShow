package com.itheima.anli01_filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *订单模块的过滤器
 */
public class OrderFilter implements Filter {
	public void destroy() {
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//1:将request和response对象,转换成子类对象
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		//2:通过req对象获取session对象
		HttpSession se = req.getSession();
		//3:从session中获取用户的登录状态
		Object o = se.getAttribute("user");
		//4:判断,如果o是null,说明用户没有登录,权限不足,提示登录
		if(o==null){
			try {
				req.setAttribute("msg","亲,您还没有登录,请先登录...");
				req.getRequestDispatcher("/jsp/info.jsp").forward(req, res);
				return;
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
		//5:说明已经登录了,可以直接放行...
		chain.doFilter(req, res);
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
