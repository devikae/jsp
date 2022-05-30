package com.study.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.study.user.vo.UserVO;

@Mapper
public interface ILoginDao {
	public UserVO getUser(String user_id);
	public int insertUser(UserVO user);

}
