package com.di.step5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Test {
	
	public static void main(String[] args) {
		// spring에서는 객체를 이렇게 생성한다.
		// 메인에서 문제가 없는데 에러(CreationException)가 난다면 읽어온 xml을 확인하자.
		
		ApplicationContext context = new GenericXmlApplicationContext("di/step5.xml");
		// xml 읽어서 만든 객체 
		FreeBoardService1 freeBoardService1 = context.getBean("freeBoardService1", FreeBoardService1.class);
		// xml 에서 만든 객체 받아옴 
		
		
	}
	
}
