<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.onlinexam.po.Question"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 查看试卷时候使用 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=path%>/css/semantic.css" rel="stylesheet" type="text/css" />
<script src="<%=path%>/js/jquery.js"></script>
<script src="<%=path%>/js/semantic.js"></script>
<link href="<%=path%>/layui/css/layui.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/dog.css" rel="stylesheet"/>

<style>
p {
	text-indent: 2em;
}
</style>
</head>

<body>
	<div id="main_content" style="margin:30px">
		<form id="form1" name="form1" method="post"
			action="<%=path%>/recentTestServlet">
			<h2 class="ui dividing header">
  				<img class="ui image" src="<%=path %>/img/school.png">
 			 	<div class="content">
   					试卷名称：${test.name}
  				</div>
			</h2>
			
			<blockquote class="layui-elem-quote layui-quote-nm">
			
					<b>考试科目：</b>${test.courseName}<br />
					<b>考试班级</b>：${test.classNames}<br /> 
					<b>考试截止时间</b>：${test.end_time}<br />
					<b>考试时长：</b>${test.test_time}分<br />
			
			</blockquote>

			<p>
				<b></b>
			</p>
			<fieldset class="layui-elem-field">
  <legend>单项选择题</legend>
  <div class="layui-field-box">
    			<table class="ui  sortable celled table">
				<thead class="full-width">
					<tr>
						
						<th>题号</th>
						<th>题干</th>
						<th>选项</th>
						<th>答案</th>
						<th>我的答案</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="que" items="${quesList}" varStatus="status">
						<tr>
							
							<td>${que.id}</td>
							<td>${que.title}</td>
							<td>
								<span>A.${que.chA }</span><span>&nbsp;&nbsp;&nbsp;&nbsp; B.${que.chB }</span>&nbsp;&nbsp; &nbsp;&nbsp;
								<span>C.${que.chC }</span>&nbsp;&nbsp; &nbsp;&nbsp;<span>D.${que.chD }</span>
							</td>
							<td><font color="blue"> ${que.ans}</font></td>
							<td><font color="${que.color }">${que.myans}</font></td>
						</tr>
		
					</c:forEach>
				</tbody>
			</table>




			<p class="text"></p>
			<p>&nbsp;</p>
			<label>
				<center>
					<button class="ui blue button" type="submit" name="button" id="button" class="btn_grey"
						value="" >返回</button>
				</center>
			</label>
			  </div>
			</fieldset>
		</form>
	</div>
</body>
<script src="<%=path%>/layer/layer.js"> </script>
<script>
function showMsg(){
	console.log("shw");
	layer.confirm('确定要退出用户吗？', {
		  btn: ['确定','取消'] //按钮
		}, function(){			
		window.open('<%=path%>/logoutServlet','_parent');
		}, function(){
		});
	
}
</script>
</html>