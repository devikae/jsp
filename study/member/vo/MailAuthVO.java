package com.study.member.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MailAuthVO {
	
	private String mail;
	private String authKey;
	private int isAuth;
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	

	public String getMail() {
		return mail;
	}


	public void setMail(String mail) {
		this.mail = mail;
	}


	public String getAuthKey() {
		return authKey;
	}


	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}


	public int getIsAuth() {
		return isAuth;
	}


	public void setIsAuth(int isAuth) {
		this.isAuth = isAuth;
	}
	
	
	
}
