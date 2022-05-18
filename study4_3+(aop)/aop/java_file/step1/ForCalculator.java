package com.aop.step1;

public class ForCalculator implements Calculator {

	@Override
	public long factiorial(long num) {
		
		// 시간측정 start
		long fact = 1;
		
		for(int i=1; i<=num; i++) {
			fact *= i;
		}
		
		// 시간측정 end 후 출력
		return fact;
		
	}
}
