package com.di.step3;

public class FreeBoardService2 implements IFreeBoardSerivce{
	IFreeBoardDao freeBoardDao;
	
	public FreeBoardService2(IFreeBoardDao freeBoardDao) {
		this.freeBoardDao = freeBoardDao;
	}
	
	public void getBoard() {
		freeBoardDao.getBoard();
	}
}
