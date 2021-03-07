
<%@ page import="com.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
  String ss=request.getParameter("itemCode"); 
  String name =  request.getParameter("itemName");
  String pp =  request.getParameter("itemPrice");
String desc =  request.getParameter("itemDesc");
String id=request.getParameter("itemID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Views/bootstrap.min.css">
<title>Item Update</title>
</head>
<body>
<div class = "container">
	<div class = "row">
		<div class = "col">
			<h1>Item Update</h1>
			<form method="post" action="update.jsp">
			 Item code: <input name="itemCode" type="text" class = "form-control" value = "<%=ss %>"><br> Item
			 name: <input name="itemName" type="text" class = "form-control" value = "<%=name %>"><br> Item price:
			 <input name="itemPrice" type="text" class = "form-control" value = "<%=pp %>"><br> Item
			 description: <input name="itemDesc" type="text" class = "form-control" value = "<%=desc %>"><br> <input
			 name="btnSubmit" type="submit" value="Update" class = "btn btn-primary">
			 <input name='itemID' type='hidden' value="<%=id %>">
			</form>
			<div class = "alert alert-success">
				<%
				 out.print(session.getAttribute("statusMsg"));
				%>
			</div>
			<br>
			
			<br>
			 <%
			 Item itemObj2 = new Item();
			 out.print(itemObj2.readItems());
			%>
		</div>
	</div>
</div>

			<% if(request.getParameter("itemCode") != null){
	 
	 Item itemObj =new Item();
	 String stsMsg = itemObj.updateItem(request.getParameter("itemID"),request.getParameter("itemCode"),
	 request.getParameter("itemName"),
	 request.getParameter("itemPrice"),
	 request.getParameter("itemDesc")); 
	 session.setAttribute("statusMsg", stsMsg);
	 
 }
 %>

</body>

</html>