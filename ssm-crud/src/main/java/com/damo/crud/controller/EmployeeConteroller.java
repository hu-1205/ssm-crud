package com.damo.crud.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.damo.crud.bean.Employee;
import com.damo.crud.bean.Msg;
import com.damo.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class EmployeeConteroller {
	
	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg addDept(Employee employee) {
		employeeService.addDept(employee);
		return Msg.success();
	}
	
	@RequestMapping("/empName")
	@ResponseBody
	public Msg addEmpName(String empName) {
		boolean result = employeeService.sreachName(empName);
		if(result) {
			return Msg.success();
		}
		else {
			return Msg.fail();
		}
	}
	
	//当ajax有数据的时候需要@RequestParam(value="pn",defaultValue="1")指定一下
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getPageWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
		//引入PageHelper分页插件
		//查询之前只需调用即可
		//查询之前传入页码以及每页的大小
		PageHelper.startPage(pn, 5);
		//startPage后面紧跟的一个查询就是分页查询
		List<Employee> emps = employeeService.getAll();
		//使用pageInfo包装查询后结果，只需要将pageInfo交给页面就行
		//封装了详细的信息，包括我们查询出来的数据,传入连续显示的页数
		PageInfo page = new PageInfo(emps,5);
		return Msg.success().add("pageInfo", page);
	}
	
	//以默认方式get请求查询部门信息返回数据
	@RequestMapping("/searchOne")
	@ResponseBody
	public Msg searchOne(int id) {
		Employee searchOne = employeeService.searchOne(id);
		return Msg.success().add("preson", searchOne);
	}
	
	
	//修改数据
	@ResponseBody
	@RequestMapping(value="/Update/{empId}",method=RequestMethod.PUT)
	public Msg UpdateData(Employee employee) {
		
		employeeService.updateEmp(employee);
		return Msg.success();
		
	}
	
	//删除单个或批量员工
	@ResponseBody
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	public Msg deleteEmp(@PathVariable("ids")String ids) {
		//批量删除
		if(ids.contains("-")) {
			List<Integer> del_ids = new ArrayList<Integer>();
			//用split方法分割
			String[] str_ids = ids.split("-");
			//组装id的集合
			for(String id:str_ids) {
				del_ids.add(Integer.parseInt(id));
			}
			employeeService.deleteBatch(del_ids);
		}else {
			//单个删除
			Integer id = Integer.parseInt(ids);
			employeeService.deleteEmp(id);
			
		}
		return Msg.success();
	}
	/*
	 * 查询员工数据
	 * */
//	@RequestMapping("/emps")
//	public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
//		//引入PageHelper分页插件
//		//查询之前只需调用即可
//		//查询之前传入页码以及每页的大小
//		PageHelper.startPage(pn, 5);
//		//startPage后面紧跟的一个查询就是分页查询
//		List<Employee> emps = employeeService.getAll();
//		//使用pageInfo包装查询后结果，只需要将pageInfo交给页面就行
//		//封装了详细的信息，包括我们查询出来的数据,传入连续显示的页数
//		PageInfo page = new PageInfo(emps,5);
//		model.addAttribute("pageInfo", page);
//		
//		return "list";
//	}
}
