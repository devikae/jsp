package com.aop.step1;

// (재귀함수를 위한) 대리자, 외부 계산기
public class ExeCalculator implements Calculator{

	Calculator cal;
	
	public ExeCalculator(Calculator cal) {
		this.cal = cal;
	
	}
	
	@Override
	public long factiorial(long num) {
		long start = System.nanoTime();
		
		long factResult = cal.factiorial(num);
		
		long end = System.nanoTime();
		
		System.out.println(end - start);
		return factResult;
	}

}
