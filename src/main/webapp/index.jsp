<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%-- <%
	response.sendRedirect("addImage.jsp");
	%> --%>
	<style type="text/css">
	*{
		margin:0px;
		padding:0px;
	}
	h1{
		font-size: 2.5rem;
		color: white;
		background: red;
		padding:1rem;
		text-align:center;
		font-family: sans-serif;
		box-shadow: 1px 1px 5px 1px rgba(0,0,0,0.5);
	}
	.container{
		height: 15vh;
		box-shadow: 1px 1px 5px 1px rgba(0,0,0,0.5);
		display: flex;
		align-items: center;
		justify-content: center;
	}
	form label{
		font-size: 2rem;
		font-family: sans-serif;
	}
      input[type="file"] {
        display: none;
      }
      .button {
        padding: 12px 18px;
        cursor: pointer;
        border-radius: 5px;
        background-color: #8ebf42;
        font-weight: bold;
        color: #fff;
      }
      #submit{
      	font-size: 2rem;
      	padding: 12px 18px;
        cursor: pointer;
        border-radius: 5px;
        background-color: red;
        font-weight: bold;
        border:none;
        outline:none;
        color: #fff;
      }
      .show_image_section{
   		 height: 75vh;
   		 width : 100%; 
         overflow-y: auto;
         overflow-x: hidden;
         display: grid;
         grid-template-columns: 1fr 1fr 1fr;

         >.image_card {
             padding: 10px;
			margin: 5px;
			box-shadow: 0px 0px 10px 1px rgba(0,0,0,0.5);
			border-radius:10px;
             >img {
             border:2px solid black;
            
                 width: 100%;
             }
         }
      	
      }
	</style>
</head>
<body>
	<h1>Add Image</h1>
	<div class="container">
		<form action="AddImage" method="post" enctype="multipart/form-data">
			<label for="upload">Select Image : </label>
			<label class="button" for="upload">Select File</label>
			<input id="upload" type="file" name="image"/>
			<input id="submit" type="submit" value="Submit"/>
		</form>
	</div>	
	<%@ include file="showImage.jsp" %> 
</body>
</html>