<%@ page import = "java.sql.*"%>
<%  
    String UserName = request.getParameter("username");
    String Phone = request.getParameter("phone");
    String Email = request.getParameter("email");
    String Password = request.getParameter("password");
    String Address = request.getParameter("address");
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        try{
            String url = "jdbc:mysql://localhost:3306/accounts?serverTimezone=UTC";
            Connection con = DriverManager.getConnection(url,"root","1234");
            if(con.isClosed()){
                out.print("connection error.");
            }else{
                try{
                     String sql = "INSERT INTO `accounts`(username,email,password,phonenumber,address) "+
                    "VALUES('"+UserName+"','"+Email+"','"+Password+"','"+Phone+"','"+Address+"')";
                    con.createStatement().executeUpdate(sql);
                
                    con.close();
                    response.sendRedirect("profile.html");
                }
                catch(SQLException sExec){
                    response.sendRedirect("register.html?error=email_exists");
                }
               
            }
        }
        catch(SQLException sExec){
            out.print("SQL ERROR"+sExec.toString());
        }
    }
    catch(ClassNotFoundException err){
        out.print("CLASS ERROR"+err.toString());
    }
%>