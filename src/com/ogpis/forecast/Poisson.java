package com.ogpis.forecast;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import com.ogpis.forecast.parameter.InputParameter;
import com.ogpis.forecast.parameter.OutputParameter;


public class Poisson implements ForecastModel {
	
	private double K;
	private double a;
	private double b;


	@Override
	public String test() {
		return "test";
	}
	

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public LinkedHashMap getPEM() {
		LinkedHashMap map = new LinkedHashMap();
		map.put("最小二乘法",1);
		map.put("三段估计法",2);
		map.put("程序自带jar",3);
		return map;
	}

	//翁氏回旋模型方法计算预测值
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public OutputParameter compute(InputParameter input) {
		OutputParameter output = new OutputParameter();
		LinkedHashMap pemValueMap = new LinkedHashMap();
		LinkedHashMap predictDataMap = new LinkedHashMap();
		LinkedHashMap historyDataMap = input.getHistoryDataMap();
		
		if(input.getPEM()==0){//直接用修改后的参数进行预测结果
			
		}
		if(input.getPEM()==1){//参数拟合方法用最小二乘法 
			double X1k[] = new double[historyDataMap.size()];
			double X2k[] = new double[historyDataMap.size()];
			double Yk[] = new double[historyDataMap.size()];
			double X[][] = new double[4][4];
			double Y[] = new double[4];
			double beita[] = new double[4];
			int n = historyDataMap.size()-1;
			Iterator<Map.Entry> it= historyDataMap.entrySet().iterator();
			int i=0;
			while(it.hasNext())
			{
				Map.Entry entry = it.next(); 
				System.out.println(entry.getKey()+""+entry.getValue());
				Yk[i] = Math.log(Double.parseDouble(entry.getValue().toString()));
				X1k[i] = Math.log(Double.parseDouble(entry.getKey().toString())-1949);
				X2k[i] = Double.parseDouble(entry.getKey().toString())-1949;
				i++;	
			}
			for(int temp11=0;temp11<4;temp11++)
				for(int temp22=0;temp22<4;temp22++){
					X[temp11][temp22] = 0;
			}
		X[1][1] = n;
		for(int ii=1;ii<=n;ii++){
			X[1][2] += X1k[ii];
			X[1][3] += X2k[ii];
			X[2][1] += X1k[ii];
			X[2][2] += X1k[ii]*X1k[ii];
			X[2][3] += X1k[ii]*X2k[ii];
			X[3][1] += X2k[ii];
			X[3][2] += X1k[ii]*X2k[ii];
			X[3][3] += X2k[ii]*X2k[ii];
			Y[1] += Yk[ii];
			Y[2] += X1k[ii]*Yk[ii];
			Y[3] += X2k[ii]*Yk[ii];
		}

		LES.svd(X, 3, 3, Y, beita);
		double temp0 = beita[1];
		double temp1 = beita[2];
		double temp2 = beita[3];
		System.out.println(temp0+"====="+temp1+"====="+temp2);
		a = temp1;
		b = -temp2;
		K = Math.pow(Math.E, temp0-a*Math.log(b));	
		int beginYear = input.getFutureBeginYear();
		int endYear = input.getFutureEndYear();
		double[] result = new double[endYear-beginYear+1];
		for(int kk=0;kk<result.length;kk++){
			/*result[kk]=K*Math.pow(b*(kk+beginYear-1949), a)*Math.pow(Math.E, -(b*(kk+beginYear-1949)));*/
			predictDataMap.put(beginYear+kk,haha(K*Math.pow(b*(kk+beginYear-1949), a)*Math.pow(Math.E, -(b*(kk+beginYear-1949)))));
		}
		}
			
		if(input.getPEM()==2){//参数拟合方法用三段法
			
		}
		if(input.getPEM()==3){//冈珀茨特有拟合方法

		}
		pemValueMap.put("K", haha(K));
		pemValueMap.put("a", haha(a));
		pemValueMap.put("b", haha(b));
		output.setParamVauleMap(pemValueMap);
		output.setPredictData(predictDataMap);
		return output;
	}


	@Override
	public boolean isSelfCorrelation() {
		// TODO Auto-generated method stub
		return true;
	}


	@Override
	public boolean isMultiSource() {
		// TODO Auto-generated method stub
		return false;
	}
	
	//将float保留三位小数
	double haha(double x){
		return (double)(Math.round(x*1000))/1000;
	}
}
