package com.fsproject.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCConnection {
	
	private static String env = System.getProperty("env").toUpperCase();
	static String databaseIP=ReadData.readDataFromPropertyFile("databaseIP"+env, env);
	static String databaseUser=ReadData.readDataFromPropertyFile("databaseUser"+env, env);
	static String databasePassword=ReadData.readDataFromPropertyFile("databasePassword"+env, env);
	static String databaseSID=ReadData.readDataFromPropertyFile("databaseSID"+env, env);
	
	public static int updateTable(String sqlQuery) throws SQLException{
		
			int rs=0;
		   System.out.println("-------- Oracle JDBC Connection Testing ------");

	        try {

	            Class.forName("oracle.jdbc.driver.OracleDriver");

	        } catch (ClassNotFoundException e) {

	            System.out.println("Where is your Oracle JDBC Driver?");
	            e.printStackTrace();
	            return rs;

	        }

	        System.out.println("Oracle JDBC Driver Registered!");

	        Connection connection = null;

	        try {

	            connection = DriverManager.getConnection(
	                    "jdbc:oracle:thin:@"+databaseIP+databaseSID, databaseUser, databasePassword);
	            Statement stmt=connection.createStatement();
	            /*String command="select * from pycx where txn_peyment_key like "+"'%"+"1520916"+"%'"; 
	            ResultSet rsResultSet=stmt.executeQuery(command);
	            rsResultSet.next();
	            String batchID=rsResultSet.getString("BATCH_ID");
	            System.out.println(batchID);*/
	            stmt=connection.createStatement();
	           // command="update pycx set batch_status = '"+"P"+"', txn_jrnl_no = '"+"1234"+"' where batch_id = '"+"000CT152-1955816"+"'";
	            rs=stmt.executeUpdate(sqlQuery);
	            
	            System.out.println(rs);

	        } catch (SQLException e) {

	            System.out.println("Connection Failed! Check output console");
	            e.printStackTrace();
	            return rs;

	        }

	        if (connection != null) {
	        	connection.commit();
	        //	connection.close();
	            System.out.println("You made it, take control your database now!");
	        } else {
	            System.out.println("Failed to make connection!");
	        }
	        return rs;
	    }
	public static ResultSet executeQuery(String sqlQuery) throws SQLException{
		
		    ResultSet rs=null;
		   System.out.println("-------- Oracle JDBC Connection Testing ------");

	        try {

	            Class.forName("oracle.jdbc.driver.OracleDriver");

	        } catch (ClassNotFoundException e) {

	            System.out.println("Where is your Oracle JDBC Driver?");
	            e.printStackTrace();
	            return rs;

	        }

	        System.out.println("Oracle JDBC Driver Registered!");

	        Connection connection = null;

	        try {

	        	   connection = DriverManager.getConnection(
		                    "jdbc:oracle:thin:@"+databaseIP+databaseSID, databaseUser, databasePassword);
	            Statement stmt=connection.createStatement();
	            //String command="select * from pycx where txn_peyment_key like "+"'%"+"1520916"+"%'"; 
	             rs=stmt.executeQuery(sqlQuery);
	          //  rsResultSet.next();
	         //   String batchID=rsResultSet.getString("BATCH_ID");
	           // System.out.println(batchID);*/
	          //  stmt=connection.createStatement();
	           // command="update pycx set batch_status = '"+"P"+"', txn_jrnl_no = '"+"1234"+"' where batch_id = '"+"000CT152-1955816"+"'";
	          

	        } catch (SQLException e) {

	            System.out.println("Connection Failed! Check output console");
	            e.printStackTrace();
	            return rs;

	        }

	        if (connection != null) {
	        //	connection.close();
	            System.out.println("You made it, take control your database now!");
	        } else {
	            System.out.println("Failed to make connection!");
	        }
	        return rs;
	    }

		
	


}
