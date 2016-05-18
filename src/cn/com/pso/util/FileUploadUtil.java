package cn.com.pso.util;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

public class FileUploadUtil {
	private static String path=ServletActionContext.getServletContext().getRealPath("uploadFile");
	public static String[] uploadFiles(File[] files,String[] fileNames){
		if(files!=null&&fileNames!=null){
		String[] nameCopy=new String[fileNames.length];
		for(int i=0;i<fileNames.length;i++){
			String fileName=fileNames[i];
			File file=files[i];
			nameCopy[i]=uploadFiles(file,fileName);
		}
		return nameCopy;
		}else{
			return new String[0];
		}
	}
	
	public static String uploadFiles(File file,String fileName){
			String saveName=new Date().getTime()+"_"+(int)(Math.random()*100)+fileName.substring(fileName.lastIndexOf("."));
			File saveFile=new File(path,saveName);
			try {
				FileUtils.copyFile(file, saveFile);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return saveName;
	}
	
	public static void deleteUploadFile(String fileName){
		File file=new File(path,fileName);
		if(file.exists()){
			file.delete();
		}
	}

}
