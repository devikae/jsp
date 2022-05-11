package com.di.step1;

public class Test {
	// FreeBoardSerivce, FreeBoardDaoOracle을 만들자
	public static void main(String[] args) {
		
		// !step1 
		
		// DI => DI란 Dependency Injection의 약자로서 우리말로는 의존주입이라고 합니다. 
		
		// FreeBoardService에서 다른객체(FreeBoardDaoOracle)의 메소드를 호출
		// FreeBoardService가 FreeBoardDaoOracle에 "의존"한다 
		
		// step1에서는 의존하는 객체를 내부에서 직접 생산 (new해서 객체 직접 생성) 
		// 클라이언트: Oracle 말고 MySQL로 변경 요청
		// FreeBoardService1 ~3 다 바꿔줘야함 
		
	
		
		FreeBoardService1 freeBoardService1 = new FreeBoardService1();
		freeBoardService1.getBoard();
		
		FreeBoardService2 freeBoardService2 = new FreeBoardService2();
		freeBoardService2.getBoard();
		
		FreeBoardService3 freeBoardService3 = new FreeBoardService3();
		freeBoardService3.getBoard();
	}
	
}
