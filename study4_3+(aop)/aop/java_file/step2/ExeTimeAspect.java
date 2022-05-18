package com.aop.step2;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;

// 무엇, 시간측정 > 어떤클래스의 어떤 메소드가 와도 다 실행 가능 
public class ExeTimeAspect {
	
	public Object timeMeasure(ProceedingJoinPoint joinPoint) throws Throwable{
		// joinPoint > 실제 실행할 메소드
		// ~~.method(); > 이렇게 코드를 적어도 실행되고, 여기에 작성한 timeMeasure도 실행 되도록 설정 파일에서 설정
		// 설정 파일 > xml에서 적용하는것
		long start = System.nanoTime();
		try {
			Object result = joinPoint.proceed();
			return result;
		}finally {
			long end=System.nanoTime();
			System.out.println("걸린시간 " + (end-start));
			Signature sig = joinPoint.getSignature(); //Signature 메소드 정보 
			
			System.out.println("클래스: " + joinPoint.getTarget().getClass().getSimpleName());
			System.out.println("메소드: " + sig.getName());
			System.out.println("메소드 파라미터: " +Arrays.toString(joinPoint.getArgs())); 
			// 
		}
		
	}

}
