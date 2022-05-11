package com.di.step2;

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

		
		// 의존이 항상 좋은것은 아니다 객체별로 한개씩 필요하다면 한개씩 해야하고, 지금처럼 한개로 처리 가능할땐 이렇게
		FreeBoardDaoOracle freeBoardDaoOracle= new FreeBoardDaoOracle();
		// step1과 다르게 객체 1개만 생성됨 
		
		FreeBoardService1 freeBoardService1 = new FreeBoardService1(freeBoardDaoOracle);
		// 생성할 때 객체 받음.
		freeBoardService1.getBoard();
		
		FreeBoardService2 freeBoardService2 = new FreeBoardService2(freeBoardDaoOracle);
		freeBoardService2.getBoard();
		
		FreeBoardService3 freeBoardService3 = new FreeBoardService3(freeBoardDaoOracle);
		freeBoardService3.getBoard();
	}
	
}
