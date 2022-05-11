package com.di.step2;

public class FreeBoardService3 {
	FreeBoardDaoOracle freeBoardDao;
	
	public FreeBoardService3(FreeBoardDaoOracle freeBoardDao) {
		this.freeBoardDao = freeBoardDao;
	}
	
	public void getBoard() {
		freeBoardDao.getBoard();
	}
}
