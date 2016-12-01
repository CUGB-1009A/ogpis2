package com.ogpis.forecast;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.net.URL;
import java.net.URLClassLoader;

import javax.swing.AbstractAction;

import org.junit.Test;

import com.ogpis.forecast.parameter.InputParameter;
import com.ogpis.forecast.util.ForecastUtil;

public class ForecastAlgorithmTest {

	@Test
	public void test() {
		try {
			// 第一种 配置成文件格式
			File file = new File("C:\\Users\\Danny\\Desktop\\test.jar");
			BufferedReader in = new BufferedReader(new FileReader(file));
			String s = new String();
			while ((s = in.readLine()) != null) {

				URL url = new URL(s);
				s = null;

				URLClassLoader myClassLoader = new URLClassLoader(
						new URL[] { url }, Thread.currentThread()
								.getContextClassLoader());
				Class<? extends ForecastModel> myClass = (Class<? extends ForecastModel>) myClassLoader
						.loadClass("com.ogpis.forecast.ForecastAlgorithm");
				ForecastModel action = (ForecastModel) myClass.newInstance();
				String str = action.test();
				System.out.println(str);

				// 第二种
				URL url1 = new URL("file:C:/Users/Danny/Desktop/test.jar");
				URLClassLoader myClassLoader1 = new URLClassLoader(
						new URL[] { url1 }, Thread.currentThread()
								.getContextClassLoader());
				Class<?> myClass1 = myClassLoader1
						.loadClass("com.ogpis.forecast.ForecastAlgorithm");
				ForecastModel action1 = (ForecastModel) myClass1.newInstance();
				String str1 = action1.test();
				System.out.println(str1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

/*	@Test
	public void test1() {
		InputParameter input = new InputParameter();
		input.setYearNumber(10);
		input.setVarNumber(2);
		float[][] temp = new float[10][2];
		input.setInput(temp);
		ForecastUtil.compute("file:D:/工作/油气资源规划信息系统二期/jar/test.jar",
				"com.ogpis.forecast.TestFA", input);
	}*/

}
