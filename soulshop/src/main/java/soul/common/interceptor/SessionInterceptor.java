package soul.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import soul.main.model.Member;

public class SessionInterceptor extends HandlerInterceptorAdapter {
	
	//log 오브젝트
	private static final Logger log=LoggerFactory.getLogger(SessionInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session=request.getSession();
		Member member=(Member)session.getAttribute("member");
	
		log.info("session 체크");
		if (member==null) {
			if(request.getRequestURI().equals("/login.soul")){
				return true;
			}
			response.sendRedirect("/login.soul");
			
			return false;
		}else{
			if(request.getRequestURI().equals("/login.soul")){
				response.sendRedirect("/main.soul");
			}
			return true;
		}
	
	}
	
}
