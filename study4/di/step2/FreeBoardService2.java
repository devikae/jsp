package com.di.step2;

public class FreeBoardService2 {
	FreeBoardDaoOracle freeBoardDao;
	
	public FreeBoardService2(FreeBoardDaoOracle freeBoardDao) {
		this.freeBoardDao = freeBoardDao;
	}
	
	public void getBoard() {
		freeBoardDao.getBoard();
	}
}
