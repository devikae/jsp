package com.di.step5;

import javax.inject.Inject;

import org.springframework.stereotype.Component;

@Component
public class FreeBoardService1 implements IFreeBoardSerivce{
	IFreeBoardDao freeBoardDao;
	
	@Inject
	public FreeBoardService1(IFreeBoardDao freeBoardDao) {
		this.freeBoardDao = freeBoardDao;
	}
	
	public void getBoard() {
		freeBoardDao.getBoard();
	}
}
