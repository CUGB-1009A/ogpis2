package com.ogpis.forecast.util;

import java.awt.List;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.ogpis.forecast.ForecastModel;
import com.ogpis.forecast.parameter.InputParameter;
import com.ogpis.forecast.parameter.OutputParameter;

public class ForecastUtil {

	private static Properties forecastModelInfos;

	static {
		forecastModelInfos = new Properties();
		InputStream in = new ForecastUtil().getClass().getResourceAsStream(
				"/config/forecastModel.properties");
		try {
			forecastModelInfos.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据属性key获得对应的属性值（取配置文件中的两个key-value值）
	 * 
	 * @param key
	 * @return
	 */
	public static String getForecastModelInfo(String key) {
		return forecastModelInfos.getProperty(key).trim();
	}
	
	public static Map getModelInfo(String jarName, String className) {
			Map modelInfo = new HashMap();
		try {
			URL url1 = new URL(getForecastModelInfo("Poisson.JarName"));
			URLClassLoader myClassLoader1 = new URLClassLoader(
					new URL[] { url1 }, Thread.currentThread()
							.getContextClassLoader());
			Class<?> myClass1 = myClassLoader1
					.loadClass(getForecastModelInfo("Poisson.ClassName"));
			ForecastModel forecastModel = (ForecastModel) myClass1.newInstance();
			 
			 modelInfo.put("modelParam", forecastModel.getParam());
			 modelInfo.put("modelName", forecastModel.getName());
			return modelInfo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static OutputParameter compute(String jarName, String className,
			InputParameter input) {
		try {			
			URL url1 = new URL(getForecastModelInfo(jarName));
			URLClassLoader myClassLoader1 = new URLClassLoader(
					new URL[] { url1 }, Thread.currentThread()
							.getContextClassLoader());
			Class<?> myClass1 = myClassLoader1
					.loadClass(getForecastModelInfo(className));
			ForecastModel forecastModel = (ForecastModel) myClass1.newInstance();
			OutputParameter output = forecastModel.compute(input);
			System.out.println(output);
			return output;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
