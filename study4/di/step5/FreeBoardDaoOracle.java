package com.di.step5;

import org.springframework.stereotype.Component;

@Component
public class FreeBoardDaoOracle implements IFreeBoardDao {

	public void getBoard() {
		System.out.println("Oracle에서 Board 얻음.");
	}


}
