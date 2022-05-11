package com.di.step1;

public class FreeBoardService2 {
	FreeBoardDaoOracle freeBoardDao = new FreeBoardDaoOracle();
	
	public void getBoard() {
		freeBoardDao.getBoard();
	}
}
