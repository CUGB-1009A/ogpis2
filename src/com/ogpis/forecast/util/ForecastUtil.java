package com.ogpis.forecast.util;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLClassLoader;
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
	 * 根据属性key获得对应的属性值
	 * 
	 * @param key
	 * @return
	 */
	public static String getForecastModelInfo(String key) {
		return forecastModelInfos.getProperty(key).trim();
	}

	public static OutputParameter compute(String jarName, String className,
			InputParameter input) {
		try {
			URL url1 = new URL(jarName);
			URLClassLoader classLoader = new URLClassLoader(new URL[] { url1 },
					Thread.currentThread().getContextClassLoader());
			Class<?> clazz = classLoader.loadClass(className);
			ForecastModel forecastModel = (ForecastModel) clazz.newInstance();
			OutputParameter output = forecastModel.compute(input);
			System.out.println(output);
			return output;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
