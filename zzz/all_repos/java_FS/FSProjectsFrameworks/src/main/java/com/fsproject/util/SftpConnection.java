package com.fsproject.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;

public class SftpConnection{

public static void sftpConnection(String host,String user,String password,String path,String filePath) throws JSchException, SftpException {

    // Object Declaration.
    JSch jsch = new JSch();
    Session session = null;
    Channel channel = null;

    // Variable Declaration.
 
   int  port=22;

   ChannelSftp sftpChannel = null;
   try {
        session = jsch.getSession(user, host, port);

        /*
         * StrictHostKeyChecking Indicates what to do if the server's host 
         * key changed or the server is unknown. One of yes (refuse connection), 
         * ask (ask the user whether to add/change the key) and no 
         * (always insert the new key).
         */
        java.util.Properties config = new java.util.Properties(); 
	      config.put("StrictHostKeyChecking", "no");
	    
	    session.setConfig(config);
        session.setPassword(password);

        session.connect();

        channel = session.openChannel("sftp");
        channel.connect();
         sftpChannel = (ChannelSftp)channel;

        // Go through watch folder looking for files.
         File localFile = new File(filePath);
         sftpChannel.cd(path);
         try{
        sftpChannel.put(localFile.getAbsolutePath(),localFile.getName());
         }catch(Exception e){
        	 System.out.println(e.getStackTrace());
         }
        System.out.println(sftpChannel.getExitStatus());
			/*
			 * File[] files = findFile(watchFolder, filemask); for(File file : files) { //
			 * Upload file. putFile(file, sftpChannel, outputDir); }
			 */    
    } finally {
  //  	System.out.println(sftpChannel.getExitStatus());
        sftpChannel.exit();
        session.disconnect();
    }
}
public static void sftpConnectionGetFile(String host,String user,String password,String linuxFilepath,String windowPath) throws JSchException, SftpException {

    // Object Declaration.
    JSch jsch = new JSch();
    Session session = null;
    Channel channel = null;

    // Variable Declaration.
 
   int  port=22;

   ChannelSftp sftpChannel = null;
   try {
        session = jsch.getSession(user, host, port);

        /*
         * StrictHostKeyChecking Indicates what to do if the server's host 
         * key changed or the server is unknown. One of yes (refuse connection), 
         * ask (ask the user whether to add/change the key) and no 
         * (always insert the new key).
         */
        java.util.Properties config = new java.util.Properties(); 
	      config.put("StrictHostKeyChecking", "no");
	    
	    session.setConfig(config);
        session.setPassword(password);

        session.connect();

        channel = session.openChannel("sftp");
        channel.connect();
         sftpChannel = (ChannelSftp)channel;

        // Go through watch folder looking for files.
        
        sftpChannel.get(linuxFilepath, windowPath);
			/*
			 * File[] files = findFile(watchFolder, filemask); for(File file : files) { //
			 * Upload file. putFile(file, sftpChannel, outputDir); }
			 */    
    } finally {
        sftpChannel.exit();
        session.disconnect();
    }
}
public static void putFile(File file, ChannelSftp sftpChannel, String outputDir) {

    FileInputStream fis = null;

    try {
        // Change to output directory.
        sftpChannel.cd(outputDir);

        // Upload file.

        fis = new FileInputStream(file);
        sftpChannel.put(fis, file.getName());
        fis.close();

    } catch(Exception e){
    	
    }
}

public static File[] findFile(String dirName, final String mask) {
    File dir = new File(dirName);

    return dir.listFiles(new FilenameFilter() {
        public boolean accept(File dir, String filename)
            { return filename.endsWith(mask); }
    } );
}
}