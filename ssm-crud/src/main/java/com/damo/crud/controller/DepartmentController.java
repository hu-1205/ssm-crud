package com.damo.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.damo.crud.bean.Department;
import com.damo.crud.bean.Msg;
import com.damo.crud.service.DepartmentService;

//处理和部门有关的控制器
@Controller
public class DepartmentController {
	
	@Autowired
	private DepartmentService departmentService;
	
	//返回部门信息
	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDepts() {
		
		List<Department> list = departmentService.getDepts();
		
		return Msg.success().add("depts", list);
	}
}
