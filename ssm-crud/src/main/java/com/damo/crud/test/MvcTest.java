package com.damo.crud.test;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.damo.crud.bean.Employee;
import com.github.pagehelper.PageInfo;

/*
 * 使用Spring测试模块提供的请求测试功能，测试crud请求的正确性
 * Spring4测试的时候，需要servlet3.0的支持
 * */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MvcTest {
	//传入springmvc的ioc
	@Autowired
	WebApplicationContext context;
	
	MockMvc mockMvc;
	//虚拟mvc请求，获取到哪处理结果
	@Before
	public void initMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void PageTest() throws Exception {
		//模拟请求拿到返回值
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "5")).andReturn();
		
		//请求成功后，请求域中会有pageInfo,我们可以取出pageInfo进行验证
		MockHttpServletRequest request = result.getRequest();
		PageInfo attribute = (PageInfo)request.getAttribute("pageInfo");
		System.out.println("当前页码"+attribute.getPageNum());
		System.out.println("总页码"+attribute.getPages());
		System.out.println("总记录数"+attribute.getTotal());
		System.out.println("在页面需要连续显示的页码");
		int[] nums= attribute.getNavigatepageNums();
		for(int i:nums) {
			System.out.print(" "+i);
		}
		
		//获取员工数据
		List<Employee> list = attribute.getList();
		for(Employee employee:list) {
			System.out.println("ID:"+employee.getEmpId()+"==>Name:"+employee.getEmpName());
		}
	}
}









