<%@ page import = "java.sql.*"%>
<%
    String UserName = request.getParameter("username");
    String Password = request.getParameter("password");

    try{
        Class.forName("com.mysql.jdbc.Driver");
        try{
            String url = "jdbc:mysql://localhost:3306/accounts?serverTimezone=UTC";
            Connection con = DriverManager.getConnection(url,"root","1234");
            if(con.isClosed()){
                out.print("connection error");
            }else{
                String sql = "SELECT * FROM accounts WHERE username = '" + UserName + "' AND password = '" + Password + "'";
                ResultSet rs = con.createStatement().executeQuery(sql);
                if(rs.next()){
                        response.sendRedirect("profile.html");
                }else{
                    response.sendRedirect("login.html?error=username_or_password_is_wrong");
    
                }
            }
        }catch(SQLException sExec){
            out.print("SQL ERROR"+sExec.toString());
        }
    }
    catch(ClassNotFoundException err){
        out.print("CLASS ERROR"+err.toString());
    }
%>
