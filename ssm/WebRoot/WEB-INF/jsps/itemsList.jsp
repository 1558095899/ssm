<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询商品列表</title>
<script type="text/javascript"src="D:\MyEclipseProfessional2014\JQuery\WebRoot\Demo1\jquery-1.8.3.js"></script>
<script type="text/javascript">
	 function deleteAll(){
	
		var str="";
		var c=document.getElementsByName("c");
		for (var i = 0; i < c.length; i++) {
			if(c[i].checked){
				str+="id="+c[i].value+"&";
			}
		}
		str=str.substring(0, str.length-1);
		if(str!=null){
			location.href="${pageContext.request.contextPath }/item/deleteAllItems?"+str;
		}
	}
</script>
</head>
<body> 
<form action="${pageContext.request.contextPath }/item/queryItem.action" method="post">
查询条件：
<table width="100%" border=1>
<tr>
<td><a href="${pageContext.request.contextPath}/item/toAddItem">添加</a></td>
<td><input type="button" value="批量删除"  id="btn"></td>
</tr>
</table>
商品列表：
<table width="100%" border=1>
<tr>
	<td>商品名称</td>
	<td>商品价格</td>
	<td>生产日期</td>
	<td>商品描述</td>
	<td>操作</td>
</tr>
<c:forEach items="${list }" var="item">
<tr>
	<td><input type="checkbox" id="d" name="c" value="${item.id }"> ${item.name }</td>
	<td>${item.price }</td>
	<td><fmt:formatDate value="${item.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	<td>${item.detail }</td>
	
	<td><a href="${pageContext.request.contextPath}/item/edit?id=${item.id}">修改</a>
		<a href="${pageContext.request.contextPath}/item/deleteItem?id=${item.id}">删除</a>
	</td>

</tr>
</c:forEach>

</table>
</form>
</body>

</html>