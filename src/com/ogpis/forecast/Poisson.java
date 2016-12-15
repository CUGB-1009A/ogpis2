package com.ogpis.forecast;

import java.util.LinkedHashMap;
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
		map.put("翁氏特有拟合方法",3);
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
		double[] Y = null ;
		
		if(input.getPEM()==0){//直接用修改后的参数进行预测结果
			
		}
		if(input.getPEM()==1){//参数拟合方法用最小二乘法 
		
			

			for(int i=input.getFutureBeginYear();i<input.getFutureEndYear()+1;i++){
				predictDataMap.put(i,Math.floor(Math.random()*1000));
			}
		}
			
		if(input.getPEM()==2){//参数拟合方法用三段法
			for(int i=input.getFutureBeginYear();i<input.getFutureEndYear()+1;i++){
				predictDataMap.put(i,Math.floor(Math.random()*1000));
			}
		}
		if(input.getPEM()==3){//冈珀茨特有拟合方法

			for(int i=input.getFutureBeginYear();i<input.getFutureEndYear()+1;i++){
				predictDataMap.put(i,Math.floor(Math.random()*1000));
			}
		}
		pemValueMap.put("K", K);
		pemValueMap.put("a", a);
		pemValueMap.put("b", b);
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
}
