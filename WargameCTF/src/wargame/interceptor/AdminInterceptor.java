package wargame.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		HttpSession session = request.getSession();
		if(session.getAttribute("admin")==null) {
			String redirect = request.getContextPath()+"/login.htm";
			try {
				response.sendRedirect(redirect);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return false;
		}
		return true;
	}
}
