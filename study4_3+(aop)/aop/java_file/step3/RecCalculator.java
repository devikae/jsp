package com.aop.step3;

public class RecCalculator implements Calculator{
	@Override
	public long factiorial(long num) {
		
		// 재귀함수에서 부가기능을 만들 수 없음
		if(num==1) return 1;
		return num*factiorial(num-1);
	}
}
