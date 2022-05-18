package com.aop.step1;

public class Test {
	public static void main(String[] args) {
//		long startF = System.currentTimeMillis(); 단위가 너무 작아서 안나와 변경 
		long startF = System.nanoTime(); 
		Calculator forCal = new ForCalculator();
		System.out.println(forCal.factiorial(5));
		long endF = System.currentTimeMillis();
		System.out.println(endF - startF);
		
		// 시간 측정을 메소드에서 정의 
		
		long startR = System.nanoTime(); 
		Calculator recCal = new RecCalculator();
		System.out.println(recCal.factiorial(5));
		long endR = System.currentTimeMillis();
		System.out.println(endR - startR);
		
		System.out.println("================================");
		
		// 외부 객체를 이용해서 하겠다면 ?? 
		// 로그 남기기, 시간측정 등 부가기능 만들기
		Calculator forCal2 = new ForCalculator();
		Calculator recCal2 = new RecCalculator();
		
		Calculator exeForCal = new ExeCalculator(forCal2);
		System.out.println(exeForCal.factiorial(5));
		Calculator exeForCal2 = new ExeCalculator(recCal2);
		System.out.println(exeForCal2.factiorial(5));
		
		
		
	}
}
