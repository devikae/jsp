package com.study.common.util;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect
public class CommonControllerParameter {
	// Edit > Modify 처럼 넘어갈 때 파라미터가 잘 넘어가는지 알기 위해 모든곳에서 콘솔로 보려고 만듬 
	
	// return type가 String이기 때문에 *(모든것) 안써도 됨 
	@Pointcut("execution(public String com.study.*.web..*(*,..))") // 경로 > (web)컨트롤러 단의 모든걸 보겠다 보통은 컨트롤러보다 서비스를 많이 봄
	private void publicTarget() {
		
	}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Around("publicTarget()")
	public Object logConsole(ProceedingJoinPoint joinPoint)throws Throwable{
		Signature sig = joinPoint.getSignature();
		System.out.println("클래스 : " + joinPoint.getTarget().getClass().getSimpleName());
		System.out.println("메소드 : " + sig.getName());
		// System.out.println("메소드의 파라미터 : " + Arrays.toString(joinPoint.getArgs()));
		// >> 필요한 파라미터 하나만 출력
		Object[] parameterArr = joinPoint.getArgs(); //이 메소드는 파라미터가 없는 메소드일때 null return 안함 > null체크 하지 않아도 된다, 
		// 애초에 execution 에서 매개변수 2개 이상인거로 했기때문에 null체크 하지 않아도 된다, 
		// 길이가 0인 배열을 return 하기 때문에 null이 아니다. 
		
		for(Object parameter : parameterArr) {
			// 매개변수 Model model을 제외하고 싶어서 작성
			// 제외하는 방법 
			if(parameter != null && !parameter.getClass().getSimpleName().equals("BindingAwareModelMap")) {
				// 실행될 때 모델과 searchVO가 매개변수 (parametArr)
				// 위에서 null이 안온다했지만 파라미터가 null로 올 수있기 떄문에
				logger.info("logger를 이용한 파라미터 타입 : {}", parameter.getClass().getSimpleName());
				logger.info("logger를 이용한 파라미터 값 : {}", parameter);
				
				System.out.println(parameter.getClass().getName().startsWith("com.study"));
				//com.study에서 실행된건지 boolean 
				
				System.out.println(parameter.getClass().getName());
				// 경로까지 콘솔에 출력 가능하다.
				
				System.out.println("파라미터 타입 : " + parameter.getClass().getSimpleName());
				System.out.println("파라미터 값 : " + parameter);
			}
		}
		
		
		
		// 파라미터에 serchVO가 있다면? curPage, 검색 관련 필드 몇개인데 아래 오브젝트에서 
		
		try {
			Object obj = joinPoint.proceed(); // .pageSetting() 
			return obj;
		}finally {
//			System.out.println("클래스 : " + joinPoint.getTarget().getClass().getSimpleName());
//			System.out.println("메소드 : " + sig.getName());
//			System.out.println("메소드의 파라미터 : " + Arrays.toString(joinPoint.getArgs())); // 실행메소드 전 후로 위의 파라미터와 값이 다름
			// 굳이 잘 쓰진 않음
		}
		
		
	}
 	
}
