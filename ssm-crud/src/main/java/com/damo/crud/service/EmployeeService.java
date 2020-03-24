package com.damo.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damo.crud.bean.Employee;
import com.damo.crud.bean.EmployeeExample;
import com.damo.crud.bean.EmployeeExample.Criteria;
import com.damo.crud.dao.EmployeeMapper;

@Service
public class EmployeeService {

	@Autowired
	EmployeeMapper employeeMapper;
	public List<Employee> getAll() {
		// TODO Auto-generated method stub
		return employeeMapper.selectByExampleWithDept(null);
	}
	public void addDept(Employee employee) {
		// TODO Auto-generated method stub
		int insert = employeeMapper.insert(employee);
	}
	public boolean sreachName(String empName) {
		// TODO Auto-generated method stub
		//添加一个EmployeeExample属性的值
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long countByExample = employeeMapper.countByExample(example);
		return countByExample == 0;
	}
	
	
	//查询单个人数据
	public Employee searchOne(int id) {
		// TODO Auto-generated method stub
		Employee selectByKey = employeeMapper.selectByPrimaryKeyWithDept(id);
		return selectByKey;
	}
	//修改数据
	public void updateEmp(Employee employee) {
		// TODO Auto-generated method stub
		int updateByKey = employeeMapper.updateByPrimaryKeySelective(employee);
	}
	
	//单个员工深处
	public void deleteEmp(Integer id) {
		// TODO Auto-generated method stub
		employeeMapper.deleteByPrimaryKey(id);
		
	}
	public void deleteBatch(List<Integer> ids) {
		// TODO Auto-generated method stub
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		//delete from xxx where emp_id in(1,2,3);
		criteria.andEmpIdIn(ids);
		employeeMapper.deleteByExample(example);
	}

}
