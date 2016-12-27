package com.ogpis.forecast.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileOperate {
	
	public static void copyFile(String file1,String file2)throws IOException{
		FileInputStream fis=new FileInputStream(file1);
		FileOutputStream fos=new FileOutputStream(file2);
		int temp;
		while((temp=fis.read())!=-1){
			fos.write(temp);
		}
		fis.close();
		fos.close();
		System.out.println("从"+file1+"到"+file2);
}
	

	public static void cutRename(String file1,String file2){
		try {
			copyFile(file1, file2);
			File f=new File(file1);
			f.delete();//删除源文件，达到重命名的目的
			System.out.println("成功"+file2);
			System.out.println(file1);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("失败"+file2);
		}	
	}
}
