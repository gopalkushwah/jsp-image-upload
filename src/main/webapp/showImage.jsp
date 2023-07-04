
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<section class="show_image_section">
	
        <%
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/imageupload","root","1234");
			PreparedStatement pst = con.prepareStatement("select * from image");
			ResultSet rst = pst.executeQuery();
			while(rst.next()){
				/* out.print(rst.getString("imagename")); */
				%>
				<div class="image_card">
            		<img src="./images/<%=rst.getString("imagename")%>" alt="">
        		</div>
				<%
			}
			
		} catch (Exception e) {
			out.print("Image already present...");
		}
        %>
</section>
