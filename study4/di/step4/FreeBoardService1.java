package com.di.step4;

public class FreeBoardService1 implements IFreeBoardSerivce{
	IFreeBoardDao freeBoardDao;
	
	public FreeBoardService1(IFreeBoardDao freeBoardDao) {
		this.freeBoardDao = freeBoardDao;
	}
	
	public void getBoard() {
		freeBoardDao.getBoard();
	}
}
