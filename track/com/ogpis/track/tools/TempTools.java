package com.ogpis.track.tools;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import net.sf.json.JSON;
import net.sf.json.xml.XMLSerializer;

public class TempTools {
	
	public static String loadFile(){
		InputStream in=TempTools.class.getClassLoader().getResourceAsStream("./resources/data.xml");
		InputStreamReader reder=new InputStreamReader(in);
		BufferedReader readerBuffer = new BufferedReader(reder);
		StringBuilder builder=new StringBuilder();
		try{
			String line=null;
			while ((line = readerBuffer.readLine()) != null) {
				builder.append(line + "\n");
			}
		}catch(IOException e){
			e.printStackTrace();
		}finally{
			try {
				in.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return builder.toString();
	}
	
	public static JSON parseXml(String xml){
		XMLSerializer parse=new XMLSerializer();
		return parse.read(xml);
	}
}
