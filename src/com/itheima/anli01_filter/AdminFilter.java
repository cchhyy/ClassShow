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

/**
 * 后台管理系统的权限过滤器
 */
public class AdminFilter implements Filter {
    public AdminFilter() {
    }
	public void destroy() {
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//1:查看是否是管理员登录了,
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		Object o = req.getSession().getAttribute("admin");
		if(o==null){
			//2:说明管理员没有登录,提示权限不足
			req.setAttribute("msg","亲,不要乱搞,只有管理员才能操作...您的权限不足...");
			req.getRequestDispatcher("/jsp/info.jsp").forward(req, res);
			return;
		}
		//3:说明登录了,可以放行
		chain.doFilter(request, response);
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
