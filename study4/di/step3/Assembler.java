package com.di.step3;

// 조립기
public class Assembler {
	// 객체를 직접 가지고 있으면서, 사용자에게 제공하는 역할 
	private IFreeBoardDao freeBoardDao;
	private FreeBoardService1 freeBoardService1;
	private FreeBoardService2 freeBoardService2;
	private FreeBoardService3 freeBoardService3;
	
	public Assembler() {
		// Assembler 생성자를 이용하면 객체를 가지고 있도록 하기 위해 생성자에서 객체 만듬 
		freeBoardDao = new FreeBoardDaoMySql();
		freeBoardService1 = new FreeBoardService1(freeBoardDao);
		freeBoardService2 = new FreeBoardService2(freeBoardDao);
		freeBoardService3 = new FreeBoardService3(freeBoardDao);
		
	}

	public IFreeBoardDao getFreeBoardDao() {
		return freeBoardDao;
	}

	public void setFreeBoardDao(IFreeBoardDao freeBoardDao) {
		this.freeBoardDao = freeBoardDao;
	}

	public FreeBoardService1 getFreeBoardService1() {
		return freeBoardService1;
	}

	public void setFreeBoardService1(FreeBoardService1 freeBoardService1) {
		this.freeBoardService1 = freeBoardService1;
	}

	public FreeBoardService2 getFreeBoardService2() {
		return freeBoardService2;
	}

	public void setFreeBoardService2(FreeBoardService2 freeBoardService2) {
		this.freeBoardService2 = freeBoardService2;
	}

	public FreeBoardService3 getFreeBoardService3() {
		return freeBoardService3;
	}

	public void setFreeBoardService3(FreeBoardService3 freeBoardService3) {
		this.freeBoardService3 = freeBoardService3;
	}

	
	
}
