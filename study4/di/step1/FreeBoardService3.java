package com.di.step1;

public class FreeBoardService3 {
	FreeBoardDaoOracle freeBoardDao = new FreeBoardDaoOracle();
	
	public void getBoard() {
		freeBoardDao.getBoard();
	}
}
