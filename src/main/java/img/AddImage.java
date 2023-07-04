package img;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.mysql.cj.xdevapi.PreparableStatement;

@MultipartConfig
@WebServlet("/AddImage")
public class AddImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddImage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside do get method");
		PrintWriter out = response.getWriter();
		
		Part file = request.getPart("image");
		String imageFileName = file.getSubmittedFileName();
		System.out.println(imageFileName);
		String urlPath = "C:/Users/gopal/eclipse-workspace/ImageUpload/src/main/webapp/images/"+imageFileName;
		System.out.println(urlPath);
		
		try {
			FileOutputStream fs = new FileOutputStream(urlPath);
			InputStream is = file.getInputStream();
			
			byte[] data = new byte[is.available()];
			is.read(data);
			fs.write(data);
			fs.close();
		} catch (Exception e) {
			System.out.println("error");
//			e.printStackTrace();
		}
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/imageupload","root","1234");
			PreparedStatement pst = con.prepareStatement("insert into image(imagename) values(?)");
			pst.setString(1, imageFileName);
			int row = pst.executeUpdate();
			if(row>0) {
				response.sendRedirect("index.jsp");
			}else{
				System.out.println("failed!");
			}
			
		} catch (Exception e) {
			out.print("Image already present...");
		}
	}

}
