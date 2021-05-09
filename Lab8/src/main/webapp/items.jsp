<%@page import="Lab8.items"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%
  if (request.getParameter("itemCode") != null)
{
 items itemObj = new items();
 String stsMsg = "";
//Insert--------------------------

if (request.getParameter("hidItemIDSave") == "")
 {
 stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
 request.getParameter("itemName"),
 request.getParameter("itemPrice"),
 request.getParameter("itemDesc"));
 }

else//Update----------------------
 {
 stsMsg = itemObj.updateItem(request.getParameter("hidItemIDSave"),
 request.getParameter("itemCode"),
 request.getParameter("itemName"),
 request.getParameter("itemPrice"),
 request.getParameter("itemDesc"));
 }
 session.setAttribute("statusMsg", stsMsg);
}
//Delete-----------------------------

if (request.getParameter("hidItemIDDelete") != null)
{
	items itemObj = new items();
 String stsMsg =
 itemObj.deleteItem(request.getParameter("hidItemIDDelete"));
 session.setAttribute("statusMsg", stsMsg);
}

%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>
Items management
</title>


<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/items.js"></script>

</head>
<body>
<div class="container">
 <div class="row">
 <div class="col">

 </div>
 </div>
</div>
<h1>Items Management</h1>

 <form id="formItem" name="formItem" method="post" action="items.jsp">
 Item code:
<input id="itemCode" name="itemCode" type="text"
 class="form-control form-control-sm">
<br> Item name:
<input id="itemName" name="itemName" type="text"
 class="form-control form-control-sm">
<br> Item price:
<input id="itemPrice" name="itemPrice" type="text"
 class="form-control form-control-sm">
<br> Item description:
<input id="itemDesc" name="itemDesc" type="text"
 class="form-control form-control-sm">
<br>
<input id="btnSave" name="btnSave" type="button" value="Save"
 class="btn btn-primary">
<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
</form>



 <%
 out.print(session.getAttribute("statusMsg"));
%> 
<br>

<br>
<%
 items itemObj = new items();
 out.print(itemObj.readItems());
%>
<%-- <table border="1">

<tr>
<th>Item Code</th>
<th>Item Name</th>
<th>Item Price</th>
<th>Item Description</th>
<th>Update</th>
<th>Remove</th>
</tr>

<tr>

<td><%out.print(session.getAttribute("itemCode")); %></td>
 <td><%out.print(session.getAttribute("itemName")); %></td>
 <td><%out.print(session.getAttribute("itemPrice")); %></td>
 <td><%out.print(session.getAttribute("itemDesc")); %></td>
<td><input name="btnUpdate" type="button" value="Update"></td>
<td><input name="btnRemove" type="button" value="Remove"></td>
</tr>
</table> --%>

</body>
</html>