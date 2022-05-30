package com.study.todo.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.todo.dao.IToDoDao;
import com.study.todo.vo.ToDoVO;

@Controller
public class ToDoController {

	@Inject
	IToDoDao todoDao;
	
	@RequestMapping("/todo/todoList.wow")
	public String todoList(Model model) {
		List<ToDoVO> todoList = todoDao.getTodoList();
		model.addAttribute("todoList", todoList);
		
		return "todoList";
	}
	
	@RequestMapping("/todo/todoView.wow")
	public String todoView(Model model, int tdNo) {
		ToDoVO todo = todoDao.getTodo(tdNo);
		model.addAttribute("todo", todo);
		return "todoView";
	}
	
	@RequestMapping("/todo/todoEdit.wow")
	public String todoEdit(Model model, int tdNo) {
		ToDoVO todo = todoDao.getTodo(tdNo);
		model.addAttribute("todo", todo);
		return "todoEdit";
	}
	
	@RequestMapping("/todo/todoModify.wow")
	public String todoModify(@ModelAttribute("todo")ToDoVO todo) {
		todoDao.updateTodo(todo);
		return "todoModify";
	}
	
	@RequestMapping("/todo/todoDelete.wow")
	public String todoDelete(@ModelAttribute("todo")ToDoVO todo) {
		todoDao.deleteTodo(todo);
		return "todoDelete";
	}
	
	@RequestMapping("/todo/todoForm.wow")
	public String todoForm(){
		return "todoForm";
	}
	
	@RequestMapping("/todo/todoRegist.wow")
	public String todoEdit(@ModelAttribute("todo")ToDoVO todo){
		todoDao.insertTodo(todo);
		return "todoRegist";
	}
	
}
