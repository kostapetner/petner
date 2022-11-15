package com.kosta.petner.aspect;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import com.kosta.petner.bean.Users;

@Aspect
@Component
public class CheckAuth {

	// 로그인이 되었다면 세션에서 ID 값으로 각각의 컨트롤러에서 공통적으로 필요한 정보를 묶어서 담아보내준다
	// 마이페이지의 경우
	/*
	 * 나의 프로필 나의 시터/ 보호자일 경우 동물정보 팔로워수 정보가 쿼리 하나로 조인되서 보여져야 한다.
	 */
	@Around("execution(* com.kosta.petner.controller.MyPageController.*(..)) ") 
	//("execution(public * com.pamyferret.test.controller.*.*(..)")
	//@Before("@annotation(com.kosta.petner.aop.CheckAuth) && @annotation(CheckAuth)")
	public Object execute(ProceedingJoinPoint joinPoint) throws Throwable {
//		System.out.println("advice");
//		HttpServletRequest request = null;
//		Model m = null;
//		String method = joinPoint.getSignature().getName();
//		
//		StopWatch stopWatch = new StopWatch();
//		stopWatch.start();
		
		//HttpSession session = null;
		
//		boolean is_login = false;
//		Users sessionVo = (Users) session.getAttribute("authUser");
//		String id = sessionVo.getId();
//
//		if (id != null) {
//			is_login = true;
//		}else {
//			System.out.print("로그인필요함");
//			//throw new IllegalStateException("로그인(유저)이 필요합니다.");
//		}

		System.out.println("뭘까이게도대체");
		return joinPoint.proceed();

	}

}
