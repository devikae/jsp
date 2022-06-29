package com.study.reply.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.study.common.vo.PagingVO;

// 검색의 용도 보다는 페이징, "더 보기" 눌렀을 때 처음 댓글 1-10개, 다음 11-20개 가져오는 용도 
public class ReplySearchVO extends PagingVO {
	private int reParentNo;
	private String reParentCategory;
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);}
	
	public int getReParentNo() {
		return reParentNo;
	}
	public void setReParentNo(int reParentNo) {
		this.reParentNo = reParentNo;
	}
	public String getReParentCategory() {
		return reParentCategory;
	}
	public void setReParentCategory(String reParentCategory) {
		this.reParentCategory = reParentCategory;
	}
	
	
	
}
