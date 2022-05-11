package com.di.step2;

public class FreeBoardService1 {
	FreeBoardDaoOracle freeBoardDao;
	
	public FreeBoardService1(FreeBoardDaoOracle freeBoardDao) {
		this.freeBoardDao = freeBoardDao;
	}
	
	public void getBoard() {
		freeBoardDao.getBoard();
	}
}
