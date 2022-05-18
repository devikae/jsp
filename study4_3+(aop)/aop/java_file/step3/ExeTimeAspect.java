package com.aop.step3;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

// 무엇, 시간측정, 어떤클래스의 어떤 메소드가 와도 다 실행가능하다 기본적으로는.
@Aspect()
public class ExeTimeAspect {
	
	@Pointcut("execution(public * com.aop.step2..*(..))")
	public void publicMethod() {
		
	}
	
	@Around("publicMethod()")
	public Object timeMeasure(ProceedingJoinPoint joinPoint) throws Throwable{
		long start = System.nanoTime();
		try {
			Object result = joinPoint.proceed();
			return result;
		}finally {
			long end = System.nanoTime();
			System.out.println("걸린시간 " + (end-start));
			Signature sig = joinPoint.getSignature();
			
			System.out.println("클래스 : " + joinPoint.getTarget().getClass().getSimpleName());
			System.out.println("메소드 : " + sig.getName());
			System.out.println("파라미터 : " + Arrays.toString(joinPoint.getArgs()));
		}
	}
	
}