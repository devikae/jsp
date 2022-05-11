package com.di.step3;

public class Test {
	// FreeBoardSerivce, FreeBoardDaoOracle을 만들자
	public static void main(String[] args) {
		
		// !step1 
		// DI => DI란 Dependency Injection의 약자로서 우리말로는 의존주입이라고 한다.
		// FreeBoardService에서 다른객체(FreeBoardDaoOracle)의 메소드를 호출
		// FreeBoardService가 FreeBoardDaoOracle에 "의존"한다 
		
		// step1에서는 의존하는 객체를 내부에서 직접 생산 (new해서 객체 직접 생성) 
		// 클라이언트: Oracle 말고 MySQL로 변경 요청
		// FreeBoardService1 ~3 다 바꿔줘야함 
		
		// !step2 
		// step2에서는 service2,3을 지우고, 의존객체를 외부에서 준다.(생성자)
		// 의존객체를 외부에서 주는것을 "의존주입"이라고 한다.
		// 의존주입의 장점: 객체 한개생성 > 메모리 낭비 감소, 유지보수,확장성 > 변경 용이
		// step1에서 service1,2,3 을 변경해야하지만 step2에서는 한 부분만 변경하면 된다
		
		// Test1과 2 모두 변경 해야 한다면? Assembler 이용 
		
		Assembler assembler = new Assembler();
		
		FreeBoardService1 freeBoardService1 = assembler.getFreeBoardService1();
		FreeBoardService2 freeBoardService2 = assembler.getFreeBoardService2();
		FreeBoardService3 freeBoardService3 = assembler.getFreeBoardService3();
		
		freeBoardService1.getBoard();
		freeBoardService2.getBoard();
		freeBoardService3.getBoard();
		
	}
	
}
