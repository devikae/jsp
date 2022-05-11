package com.di.step3;

public class Test2 {
	// FreeBoardSerivce, FreeBoardDaoOracle을 만들자
	public static void main(String[] args) {
		
		// Test2에서는 Oracle이 아니고 MySql로 변경하려 한다면?
		// Assembler생성자에서 생성할 때 Oracle 객체를 만들지 않고 MySQL 객체를 만들면 된다.
		
		Assembler assembler = new Assembler();
		
		FreeBoardService1 freeBoardService1 = assembler.getFreeBoardService1();
		FreeBoardService2 freeBoardService2 = assembler.getFreeBoardService2();
		FreeBoardService3 freeBoardService3 = assembler.getFreeBoardService3();
		
		freeBoardService1.getBoard();
		freeBoardService2.getBoard();
		freeBoardService3.getBoard();
		
	}
	
}
