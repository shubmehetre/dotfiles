package com.fsproject.util;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.KeyEvent;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.ChannelSftp;

public class BatchRunClass {
	
	public static String getBatchRunCommandData(String host,String user,String password,String command) {
		  
		String commandResponse="";
		try{
		      JSch jsch=new JSch();  

		        
		     //String user="fortify";
		    // String host="172.19.97.203";

		      com.jcraft.jsch.Session session=jsch.getSession(user, host, 22);
		      session.setPassword(password);
		      java.util.Properties config = new java.util.Properties(); 
		      config.put("StrictHostKeyChecking", "no");
		      session.setConfig(config);

		      session.connect();
		      
		     // String command=JOptionPane.showInputDialog("Enter command", 
		    //                                             "ls");
		     
		      Channel channel=session.openChannel("exec");
		  
		      ((ChannelExec)channel).setCommand(command);

		      // X Forwarding
		       channel.setXForwarding(true);

		      //channel.setInputStream(System.in);
		      channel.setInputStream(null);

		      //channel.setOutputStream(System.out);

		      //FileOutputStream fos=new FileOutputStream("/tmp/stderr");
		      //((ChannelExec)channel).setErrStream(fos);
		     ((ChannelExec)channel).setErrStream(System.err);

		      InputStream in=channel.getInputStream();

		      channel.connect();
		     
		      byte[] tmp=new byte[1024];
		      while(true){
		        while(in.available()>0){
		          int i=in.read(tmp, 0, 1024);
		          if(i<0)break;
		          System.out.print(new String(tmp, 0, i));
		          commandResponse=commandResponse+new String(tmp, 0, i);
		        }
		        if(channel.isClosed()){
		          if(in.available()>0) continue;
		          System.out.println("exit-status: "+channel.getExitStatus());
		          break;
		        }
		        try{Thread.sleep(1000);}catch(Exception ee){}
		      }
		     // channel.disconnect();
		    //  session.disconnect();
		    }
		    catch(Exception e){
		      System.out.println(e);
		    }
		  
	
		 return commandResponse;
	}
	public static String getBatchRunCommandDataWithSession(String host,String user,String password,String command) {
		  
		String commandResponse="";
		Channel channel=null;
		InputStream in=null;
		com.jcraft.jsch.Session session=null;
		try{
		      JSch jsch=new JSch();  

		        
		     //String user="fortify";
		    // String host="172.19.97.203";

		      session=jsch.getSession(user, host, 22);
		      session.setPassword(password);
		      java.util.Properties config = new java.util.Properties(); 
		      config.put("StrictHostKeyChecking", "no");
		      session.setConfig(config);

		      session.connect();
		      
		     // String command=JOptionPane.showInputDialog("Enter command", 
		    //                                             "ls");
		      String command1="cd /pymtusr6/pymtusr6/BANCS/SI_HOME/bin"+"&&ps -ef|grep mswitch_|grep pymtusr6|awk '{print $2}'|xargs kill -9";
		      channel=session.openChannel("exec");
		  
		      ((ChannelExec)channel).setCommand(command1);

		      // X Forwarding
		       channel.setXForwarding(true);

		      //channel.setInputStream(System.in);
		      channel.setInputStream(null);

		      //channel.setOutputStream(System.out);

		      //FileOutputStream fos=new FileOutputStream("/tmp/stderr");
		      //((ChannelExec)channel).setErrStream(fos);
		     ((ChannelExec)channel).setErrStream(System.err);

		       in=channel.getInputStream();

		      channel.connect();
		     
		   
		      command1="cd /pymtusr6/pymtusr6/BANCS/SI_HOME/bin"+"sh startSI_Backup";
		     // Channel channel=session.openChannel("exec");
		  
		      ((ChannelExec)channel).setCommand(command1);

		      // X Forwarding
		       channel.setXForwarding(true);

		      //channel.setInputStream(System.in);
		      channel.setInputStream(null);

		      //channel.setOutputStream(System.out);

		      //FileOutputStream fos=new FileOutputStream("/tmp/stderr");
		      //((ChannelExec)channel).setErrStream(fos);
		     ((ChannelExec)channel).setErrStream(System.err);

		      in=channel.getInputStream();

		      channel.connect();
		     
		    
		  
		    command1="cd /pymtusr6/pymtusr6/BANCS/SI_HOME/bin"+"&&sh /pymtusr6/pymtusr6/BANCS/SI_HOME/bin/siapp SARIE start";
		    channel=session.openChannel("exec");
		  
		      ((ChannelExec)channel).setCommand(command1);

		      // X Forwarding
		       channel.setXForwarding(true);

		      //channel.setInputStream(System.in);
		      channel.setInputStream(null);

		      //channel.setOutputStream(System.out);

		      //FileOutputStream fos=new FileOutputStream("/tmp/stderr");
		      //((ChannelExec)channel).setErrStream(fos);
		     ((ChannelExec)channel).setErrStream(System.err);

		      in=channel.getInputStream();

		      channel.connect();
		     
		      byte[] tmp=new byte[1024];
		      while(true){
		        while(in.available()>0){
		          int i=in.read(tmp, 0, 1024);
		          if(i<0)break;
		          System.out.print(new String(tmp, 0, i));
		          commandResponse=commandResponse+new String(tmp, 0, i);
		        }
		        if(channel.isClosed()){
		          if(in.available()>0) continue;
		          System.out.println("exit-status: "+channel.getExitStatus());
		          break;
		        }
		        try{Thread.sleep(1000);}catch(Exception ee){}
		      }
		      channel.disconnect();
		      session.disconnect();
		    }
		    catch(Exception e){
		      System.out.println(e);
		    }
		  
	
		 return commandResponse;
	}
	
	
	public static String getBatchRunCommandDataShell(String host,String user,String password,String command) {
		String commandResponse="";
	   try {
            JSch jsch = new JSch();

            com.jcraft.jsch.Session session=jsch.getSession(user, host, 22);
		      session.setPassword(password);
		      java.util.Properties config = new java.util.Properties(); 
		      config.put("StrictHostKeyChecking", "no");
		      session.setConfig(config);

		      session.connect();

            Channel channel = session.openChannel("shell");

            java.io.OutputStream inputstream_for_the_channel = channel.getOutputStream();
            PrintStream commander = new PrintStream(inputstream_for_the_channel, true);

            channel.setOutputStream(null);
            channel.connect(100);
            //shell script
            commander.println(command);
            commander.flush();

            System.out.println(channel.getExitStatus());

            InputStream outputstream_from_the_channel = channel.getInputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(outputstream_from_the_channel));
            String line = null;
            StringBuilder sb = new StringBuilder();
            boolean isloginStringPassed = false ;

            while ((line = br.readLine()) != null) {
                    sb.append(line.trim());
            }
            System.out.println("Result ="+sb.toString());
            commandResponse=sb.toString();

            channel.disconnect();
            session.disconnect();
            System.out.println("completed .. ");
        } catch (JSchException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
	   
	   return commandResponse;
    }
	public static void puttyExecution(String host,String user,String password,String command) throws InterruptedException, AWTException
	{
		Runtime r = Runtime.getRuntime();
		Process p;
 
		
		String serverString = " your server name";
		String s = "C:\\Users\\1462723\\Downloads\\putty.exe -ssh -l "+user+" -pw "+password+" "+host+"";
		try
		{
			//open the putty session with the above given username, password and server
			p = r.exec(s);
			Thread.sleep(3000);
			Robot robot = new Robot();
			//String s="sudo su - sqaatt";
			 
			char c;
			int a=command.length(),b=0,m=0;
			while(b<a)
			{
			    c=s.charAt(b);
			    m=(int) c; //converts character to Unicode.
			    robot.keyPress(KeyEvent.getExtendedKeyCodeForChar(m));//Types the string on the screen
			    b++;
			    Thread.sleep(150);
			}
 
		} catch (Exception e)
		{
			System.out.println(e);
			e.printStackTrace();
 
		}
	}
		
		
	

}
