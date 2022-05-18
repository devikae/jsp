package com.aop.step3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Test {

	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext("aop/step3.xml");
		Calculator forCal = context.getBean(ForCalculator.class);
		Calculator recCal = context.getBean(RecCalculator.class);
		
		System.out.println(forCal.factiorial(5));
		System.out.println(recCal.factiorial(5));
		
	}
	

}
