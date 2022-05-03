package com.study.common.vo;

public class main {

	public static void main(String[] args) {
		PagingVO page = new PagingVO();
		// rowSizeperPage = 10; 한 페이지 당 10개의 글 
		// pageSize = 10; 페이지 사이즈: 10
		page.setCurPage(13); // 현재 페이지 13 페이지로 설정 
		page.setTotalPageCount(338);
		page.pageSetting();
		System.out.println(page);
	}

}
