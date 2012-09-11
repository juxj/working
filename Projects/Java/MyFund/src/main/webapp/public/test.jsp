<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@ page import="javax.sql.*" %>  
<%@ page import="javax.naming.*" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<%  
Connection con=null;  
try  
    {       
        Context initContext = new InitialContext();  
        DataSource ds = (DataSource)initContext.lookup("java:comp/env/jdbc/devDB");  
        con = ds.getConnection();  
        
        
        //Class.forName("org.gjt.mm.mysql.Driver").newInstance();
        //con = DriverManager.getConnection("jdbc:mysql://192.168.1.7:3306/test?user=test&password=test");  
        String sql = "select * from DIC_COMMON";
      	Statement st = con.createStatement();
      	ResultSet set = st.executeQuery(sql);
      	set.next();
      	out.println(set.getString("name"));
      	set.close();
      	st.close();
    }    
    catch(SQLException sqle)  
    {  
        out.println("sqle="+sqle);    
    }  
    finally  
    {  
        if(con != null){
        	con.close();  
        }
    }  
%>  
  </body>
</html>
