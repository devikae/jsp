package com.di.step4;

public class FreeBoardService3 implements IFreeBoardSerivce  {
	IFreeBoardDao freeBoardDao;
	
	public FreeBoardService3(IFreeBoardDao freeBoardDao) {
		this.freeBoardDao = freeBoardDao;
	}
	
	public void getBoard() {
		freeBoardDao.getBoard();
	}
}
