<%@page import="com.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Views/bootstrap.min.css">
<title>Items Management</title>
</head>
<body>


<%

if (request.getParameter("itemCode") != null)
{
Item itemObj = new Item();
itemObj.connect();//invokes the connect method in item class
}


%>
<%

if (request.getParameter("itemCode") != null)
{
	Item itemObj = new Item();
	
	String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
	request.getParameter("itemName"),
	request.getParameter("itemPrice"),
	request.getParameter("itemDesc"));
	session.setAttribute("statusMsg", stsMsg);
}
%>
<%
if(request.getParameter("itemID") != null)
{
Item itemObj =new Item();
String stsMsg= itemObj.deleteItem(request.getParameter("itemID"));
session.setAttribute("statusMsg",stsMsg);
	
}


%>


​​


	<h1>Items Management</h1>

		<form method="post" action="items.jsp">
		
		Item code: <input name="itemCode" type="text" class="form-control"><br>
		Item name: <input name="itemName" type="text" class="form-control"><br>
		Item price: <input name="itemPrice" type="text" class="form-control"><br> 
		Item description: <input name="itemDesc" type="text" class="form-control"><br> 
		<input name="btnSubmit" type="submit" value="Save" class="btn btn-primary">
		
	</form>


	<div class="alert alert-success">
	<% out.print(session.getAttribute("statusMsg"));%>
	</div>
	<br>
	<%
	
		Item itemObj = new Item();
		out.print(itemObj.readItems());
	%>

</body>
</html>