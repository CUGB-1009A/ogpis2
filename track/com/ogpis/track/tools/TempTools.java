package com.ogpis.track.tools;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.json.JSONObject;
import org.json.XML;

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
	
	public static JSONObject parseXml(String xml){
		return XML.toJSONObject(xml);
	}
}
