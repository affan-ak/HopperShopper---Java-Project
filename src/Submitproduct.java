
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Submitproduct
 */
@WebServlet("/Submitproduct")
public class Submitproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static final String URL = "jdbc:mysql://localhost:3306/rentmenow";
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private static final String USER = "affan";
    private static final String PASS = "affan";
    java.sql.Connection conn;
    public Submitproduct() {
        super();
        try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(URL,USER,PASS);
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String pname = request.getParameter("pname");
		String desc = request.getParameter("desc");
		int cost1 = Integer.parseInt(request.getParameter("cost"));
		int category = Integer.parseInt(request.getParameter("category"));
		//System.out.println(pname+desc+cost+category);
		System.out.println(pname+","+desc+","+cost1+","+category);
		String sql = "INSERT INTO product (ProductName ,ProductDescription ,Price ,CategoryId) VALUES (?, ?, ?, ?)";
		
		try {
			//PreparedStatement-can have an sql query and can be executed any number of times(one instance created and reused)
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			pstmt.setString(2, desc);
			pstmt.setInt(3, cost1);
			pstmt.setInt(4, category);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//response.sendRedirect("home.jsp?select=1");
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
