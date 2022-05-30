package com.study.todo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.todo.vo.ToDoVO;

@Mapper
public interface IToDoDao {
	
	public List<ToDoVO>getTodoList();	 // List
	
	public ToDoVO getTodo(int tdNo); 				 // view 
	
	public int updateTodo(ToDoVO todo);// Modify

	public int deleteTodo(ToDoVO todo);// delete

	public int insertTodo(ToDoVO todo);// insert
	
	
	
	
}
