<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工列表</title>

<%
//拿到本项目路径
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<!-- 不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出事故
	以/开始的相对路径，找资源，以服务器的路径为标准
 -->
<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<!-- 引入bootStrap-->
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- 修改的模态框 -->
	<!-- 加入模态框 -->
		<div class="modal fade" id="buttonModal_edit" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">新增成员</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <p class="form-control-static" id="buttonModal_edit_p"></p>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3"  class="col-sm-2 control-label">邮箱:</label>
			    <div class="col-sm-10">
			      <input type="text" name="email" class="form-control" id="email_edit_add" placeholder="234ds@qq.com">
			      <span class="help-block"></span>	
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3"  class="col-sm-2 control-label">性别:</label>
			    <div class="col-sm-10">
			    <label class="radio-inline">
				  <input type="radio" name="gender" id="gender1_edit" value="M" checked>男
				</label>
				<label class="radio-inline">
				  <input type="radio" name="gender" id="gender2_edit" value="G">女
				</label>
				 </div>
			  </div>
			   <div class="form-group">
			    <label for="inputEmail3"  class="col-sm-2 control-label">部门:</label>
			    <div class="col-sm-3">
			    <!-- 部门下拉列表 -->			    
					<select class="form-control" name="dId" id="dept_edit_select">
					</select>
				 </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="edit_dept">修改</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<!-- 增加的模态框 -->
	<!-- 加入模态框 -->
		<div class="modal fade" id="buttonModal_add" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">新增成员</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label for="inputEmail3"  class="col-sm-2 control-label">姓名:</label>
			    <div class="col-sm-10">
			      <input type="text" name="empName" class="form-control" id="empName_add" placeholder="empName">
			    	<span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3"  class="col-sm-2 control-label">邮箱:</label>
			    <div class="col-sm-10">
			      <input type="text" name="email" class="form-control" id="email_add" placeholder="234ds@qq.com">
			      <span class="help-block"></span>	
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3"  class="col-sm-2 control-label">性别:</label>
			    <div class="col-sm-10">
			    <label class="radio-inline">
				  <input type="radio" name="gender" id="gender1_add" value="M" checked>男
				</label>
				<label class="radio-inline">
				  <input type="radio" name="gender" id="gender2_add" value="G">女
				</label>
				 </div>
			  </div>
			   <div class="form-group">
			    <label for="inputEmail3"  class="col-sm-2 control-label">部门:</label>
			    <div class="col-sm-3">
			    <!-- 部门下拉列表 -->			    
					<select class="form-control" name="dId" id="dept_add_select">
					</select>
				 </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="add_dept">新增</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!-- 使用bootstrap搭建项目 -->	
	<div class="container" id>
	<!-- 标题  -->	
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 按钮  -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="div_but_clas_add">新增</button>
				<button class="btn btn-danger" id="div_but_clas_delete">删除</button>
			</div>
		</div>
		<!--  显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
			<table class="table table-hover" id="emps_table">
				<thead>
					<tr>
						<th>
							<input type="checkbox" id="check_all"/>
						</th>
						<th>#</th>
						<th>empname</th>
						<th>hender</th>
						<th>email</th>
						<th>deptName</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
				</table>
			</div>
			
		</div>
		<!-- 显示分页信息  -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6" id="page_info_area">
			</div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area">
			</div>
	
		</div>
	</div>
	<script type="text/javascript">
	var max,currentNum;
	$(function(){
		to_page(1);
	});
	//数据发送以后要清空原有数据
	function to_page(pn){
		$.ajax({
			url:"${APP_PATH}/emps",
			data:"pn="+pn,
			type:"GET",
			//回调函数
			success:function(result){
				//console.log(result)
				//1,解析并显示员工数据
				build_emps_tables(result);
				//2,解析并显示分页信息
				build_page_info(result);
				//3，显示分页条
				build_page_nav(result);
				$("#check_all").prop("checked",false);
			}
		});
	}
	
	function build_emps_tables(result){
		//清空原有数据
		$("#emps_table tbody").empty();
		//所有的员工数据
		var emps = result.extend.pageInfo.list;
		$.each(emps,function(index,item){
			//在<td></td>中装载数据
			var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
			var empIdTd = $("<td></td>").append(item.empId);
			var empNameTd = $("<td></td>").append(item.empName);
			var genderTd = $("<td></td>").append(item.gender=='M'?"男":"女");
			var emailTd = $("<td></td>").append(item.email);
			var deptTd = $("<td></td>").append(item.department.dept);
			//append方法执行完成之后返回的还是原来的元素
			var edittBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_but")
			.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
			//给edittBtn按钮新增一个属性以表示唯一性
			edittBtn.attr("edit-id",item.empId);
			var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_but")
			.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
			//给delBtn按钮新增一个属性以表示唯一性
			delBtn.attr("del-id",item.empId);
			var butBtn = $("<td></td>").append(delBtn).append(" ").append(edittBtn);
			$("<tr></tr>").append(checkBoxTd)
			.append(empIdTd)
			.append(empNameTd)
			.append(genderTd)
			.append(emailTd)
			.append(deptTd)
			.append(butBtn)
			.appendTo("#emps_table tbody");
		});
	}
	//显示分页信息
	function build_page_info(result){
		//清空原有数据
		$("#page_info_area").empty();
		//empName = result.extend.list.empName;
	    var pageNum = result.extend.pageInfo.pageNum;
		var pages  = result.extend.pageInfo.pages;
		var total  = result.extend.pageInfo.total;
		max=pages;
		currentNum=pageNum;
		$("#page_info_area").append("当前第"+pageNum+"页,总:"+pages+"页，总条数:"+total+"");
	}
	//显示分页条
	function build_page_nav(result){
		//清空原有数据
		$("#page_nav_area").empty();
		var ul = $("<ul></ul>").addClass("pagination");
		//首页
		var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
		//上一页
		var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
		if(result.extend.pageInfo.hasPreviousPage==false){
			prePageLi.addClass("disabled");
			firstPageLi.addClass("disabled");
		}
		//首页点击事件
		firstPageLi.click(function(){
			to_page(1);
		});
		//上一页点击事件
		prePageLi.click(function(){
				to_page(result.extend.pageInfo.pageNum-1);
		});
				
		//下一页
		var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));	
		//尾页
		var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
		if(result.extend.pageInfo.hasNextPage==false){
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		}
		
		ul.append(firstPageLi).append(prePageLi);
		//第item页
		$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
			var numLi = $("<li></li>").append($("<a></a>").append(item));
			if(result.extend.pageInfo.pageNum==item){
				numLi.addClass("active");
			}
			numLi.click(function(){
				to_page(item);
			});
			ul.append(numLi);
		});
		//末页点击事件
		lastPageLi.click(function(){
			to_page(result.extend.pageInfo.pages);
		});
		//下一页点击事件
		nextPageLi.click(function(){
			to_page(result.extend.pageInfo.pageNum+1);
		});
		
		ul.append(nextPageLi).append(lastPageLi);
		//吧ul加入到nav中
		var navEle = $("<nav></nav>").append(ul);
		
		navEle.appendTo("#page_nav_area");
	}
	//点击增加按钮
	$("#div_but_clas_add").click(function(){
		//发送ajax请求显示下拉列表
		getDepts("#dept_add_select");
		//弹出模态框
		$("#buttonModal_add").modal({
			backdrop:"static"
		});
	});
	
	//查出所有部门信息并显示在下拉列表中
	function getDepts(ele){
		//清空下拉列表
		$(ele).empty();
		$.ajax({
			url:"${APP_PATH}/depts",
			type:"POST",
			success:function(result){
				//$("dept_add_select").append("")
				$.each(result.extend.depts,function(){
					var optionEle = $("<option></option>").append(this.dept).attr("value",this.deptId);
					optionEle.appendTo(ele);
				});
			}
		});
	}
	
	function validate_add_form(){
		//先拿到要校验的数据
		var empName = $("#empName_add").val();
		var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
		if(!regName.test(empName)){
			show_validate_msg("#empName_add","error","用户名需要2-5位汉字或者6-16位的英文字母和数字的结合！");
			//$("#empName_add").parent().addClass("has-error");
			//$("#empName_add").next("span").text("用户名需要2-5位汉字或者6-16位的英文字母和数字的结合！")
			return false;
		}else{
			show_validate_msg("#empName_add","success","");
			//$("#empName_add").parent().addClass("has-success");
			//$("#empName_add").next("span").text("");
		}
		var empEmail = $("#email_add").val();
		var regEmail =/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4});$/;
		//alert(regEmail.test(empEmail));				
		if(!regEmail.test(empEmail)){
			show_validate_msg("#email_add","error","邮箱格式不正确！");
			//$("#email_add").parent().addClass("has-error");
			//$("#email_add").next("span").text("邮箱格式不正确！")
			return false;
		}else{
			show_validate_msg("#email_add","success","");
			//$("#email_add").parent().addClass("has-success");
			//$("#email_add").next("span").text("");
		}
		return true;
	}
	function show_validate_msg(ele,status,msg){
		//清除当前元素校验状态
		$(ele).parent().removeClass("has-success has-error");
		$(ele).next("span").text("");
		if("success"==status){
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text(msg);
		}else if("error"==status){
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg)

		}
	}
	
	//查看名字是否重复
	$("#empName_add").blur(function(){
		var empName = $("#empName_add").val(); 
		//alert(empName);
		$.ajax({
			url:"${APP_PATH}/empName",
			data:"empName="+empName,
			type:"GET",
			success:function(result){
				emp_name_serach("#empName_add",result.code);
				//if(result.code==200){
				//	$("#empName_add").parent().addClass("has-error");
			}
		});
	});
	//名字查重函数
	//ele:buttonId；status:状态码；msg：输出信息；
	function emp_name_serach(ele,status){
		//清除当前元素校验状态
		$(ele).parent().removeClass("has-success has-error");
		$(ele).next("span").text("");
		if(200==status){
			$(ele).parent().addClass("has-error");
			$(ele).next("span").append("姓名重复，请重新填写！");
		}else if(100==status){
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text("");

		}
	}
	
	
	
	$("#add_dept").click(function(){
		//alert($("#buttonModal_add form").serialize());
		//进行校验
		if(!validate_add_form()){
			return false;
		}
		$.ajax({
			url:"${APP_PATH}/emp",
			//将数据序列化
			data:$("#buttonModal_add form").serialize(),
			type:"POST",
			success:function(result){
				//alert(result.msg);
				//1关闭模态框
				$("#buttonModal_add").modal('hide');

				//2来到最后一页，显示保存的数据
				to_page(max);
			}
		});
	});
	
	
	
	//给button按钮绑定事件(编辑)
	
	$(document).on("click",".edit_but",function(){
		
		$("#buttonModal_edit_p").text();
		edit_search_emp($(this).attr("edit-id"));
		//把员工id传送给模态框的更新按钮
		$("#edit_dept").attr("edit-id",$(this).attr("edit-id"));
		//显示部门信息
		getDepts("#dept_edit_select");
		//显示模态框
		$("#buttonModal_edit").modal({
			backdrop:"static"
		});
	
	});
	
	function edit_search_emp(edit_id){
		
		$("#buttonModal_edit_p").text("");
		$.ajax({
			url:"${APP_PATH}/searchOne?id="+edit_id,
			type:"GET",
			success:function(result){
				edit_show(result);
			}
		});
	}
	
	function edit_show(result){
	
		$("#buttonModal_edit_p").append(result.extend.preson.empName);
		$("#email_edit").attr("value",result.extend.preson.email);
		$("#buttonModal_edit input[name=gender]").val([result.extend.preson.gender]);
		$("#buttonModal_edit select").val([result.extend.preson.dId]);
		
	}
	
	//验证修改邮箱
	$("#email_edit_add").blur(function(){
		
		var email = $("#email_edit_add").val();
	
		var regEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4});$/;
		if(!regEmail.test(email)){
			show_validate_msg("#email_edit_add","error","请输入正确邮箱！");
			return false;
		}else{
			show_validate_msg("#email_edit_add","success","");
		}
	});
	
	
	//点击修改按钮,发送put（post转put）请求
	$("#edit_dept").click(function(){
		
		
		$.ajax({
			url:"${APP_PATH}/Update/"+$(this).attr("edit-id"),
			type:"PUT",
			data:$("#buttonModal_edit form").serialize(),
			success:function(result){
				//关闭对话框
				$("#buttonModal_edit").modal("hide");
				alert(result.msg);
				
				to_page(currentNum);
			}
		});
		//$.ajax({
			//url:"${APP_PATH}/Update/"+$(this).attr("edit-id"),
			//type:"POST",
			//data:$("#buttonModal_edit form").serialize()+"&_method=PUT",
			//success:function(result){
				//alert(result.msg);
			//}
		//});
	});
	
	//给button按钮绑定事件(删除)
	
	$(document).on("click",".delete_but",function(){
		//弹出确认删除单元框
		//$(this).parents("tr").find("td:eq(1)").text()
		//alert($(this).parents("tr").find("td:eq(1)").text());
		var empName = $(this).parents("tr").find("td:eq(2)").text();
		var empId = $(this).attr("del-id");
		if(confirm("确认删除【"+empName+"】吗？")){
			//确认，发送ajax请求删除即可
			$.ajax({
				url:"${APP_PATH}/emp/"+empId,
				type:"DELETE",
				success:function(result){
					alert(result.msg);
					//回到本页
					to_page(currentNum);
				}
				
			});
		}
		
	
	});

	//全选和全不选
	$("#check_all").click(function(){
		//attr获取的check是undefined
		//用prop获取原生的属性值，attr获取自定义的属性值
		//alert($(this).prop("checked"));
		
		$(".check_item").prop("checked",$(this).prop("checked"));
	});
	
	$(document).on("click",".check_item",function(){
		//
		//$("#check_all").prop("checked");
		var flag = $(".check_item:checked").length==$(".check_item").length;
		$("#check_all").prop("checked",flag);
	});
	//点击全部删除就批量删除
	$("#div_but_clas_delete").click(function(){
		//$(".check_item:checked")
		var empNames = "";
		var del_idstr = "";
		$.each($(".check_item:checked"),function(){
			//组装员工名字的字符串
			empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
			//组装员工id的字符串
			del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
		});
		//去除empNames多余的逗号
		empNames = empNames.substring(0,empNames.length-1);
		//去除del_idstr多余的短横线
		del_idstr = del_idstr.substring(0,del_idstr.length-1);
		if(confirm("确认删除【"+empNames+"】吗？")){
			//发送ajax请求删除
			$.ajax({
				url:"${APP_PATH}/emp/"+del_idstr,
				type:"DELETE",
				success:function(result){
					alert(result.msg);
					to_page(currentNum);
				}
			})
		}
	});
	
	
</script>
</body>
</html>




