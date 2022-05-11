package com.di.step1;

public class FreeBoardService1 {
	FreeBoardDaoOracle freeBoardDao = new FreeBoardDaoOracle();
	
	public void getBoard() {
		freeBoardDao.getBoard();
	}
}
