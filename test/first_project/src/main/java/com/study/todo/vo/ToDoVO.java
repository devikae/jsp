package com.study.todo.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ToDoVO {
	private int tdNo;               // 글번호        
	private String tdNm;            // 작성자        
	private String tdPass;          // 비밀번호        
	private String tdContent;			// 내용               
	private String tdDeadline;      // 마감일         
	private String tdRegDate;       // 게시일        
	private String tdModDate;       // 수정날짜        
	private String tdDelYn;         // 삭제여부   
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}


	public int getTdNo() {
		return tdNo;
	}


	public void setTdNo(int tdNo) {
		this.tdNo = tdNo;
	}


	public String getTdNm() {
		return tdNm;
	}


	public void setTdNm(String tdNm) {
		this.tdNm = tdNm;
	}


	public String getTdPass() {
		return tdPass;
	}


	public void setTdPass(String tdPass) {
		this.tdPass = tdPass;
	}


	public String getTdContent() {
		return tdContent;
	}


	public void setTdContent(String tdContent) {
		this.tdContent = tdContent;
	}


	public String getTdDeadline() {
		return tdDeadline;
	}


	public void setTdDeadline(String tdDeadline) {
		this.tdDeadline = tdDeadline;
	}


	public String getTdRegDate() {
		return tdRegDate;
	}


	public void setTdRegDate(String tdRegDate) {
		this.tdRegDate = tdRegDate;
	}


	public String getTdModDate() {
		return tdModDate;
	}


	public void setTdModDate(String tdModDate) {
		this.tdModDate = tdModDate;
	}


	public String getTdDelYn() {
		return tdDelYn;
	}


	public void setTdDelYn(String tdDelYn) {
		this.tdDelYn = tdDelYn;
	}
	
	
	
	
	
}