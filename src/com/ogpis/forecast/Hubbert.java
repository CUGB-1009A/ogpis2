package com.ogpis.forecast;

import java.util.LinkedHashMap;

import com.ogpis.forecast.parameter.InputParameter;
import com.ogpis.forecast.parameter.OutputParameter;

public class Hubbert implements ForecastModel{
	
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
		map.put("哈伯特特有拟合方法",3);
		return map;
	}

	//翁氏回旋模型方法计算预测值
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public OutputParameter compute(InputParameter input) {
		OutputParameter output = new OutputParameter();
		LinkedHashMap pemValueMap = new LinkedHashMap();
		LinkedHashMap predictDataMap = new LinkedHashMap();
		if(input.getPEM()==0){//直接用修改后的参数进行预测结果
			
		}
		if(input.getPEM()==1){//参数拟合方法用最小二乘法			
			pemValueMap.put("K", input.getPEM());
			pemValueMap.put("a", input.getPEM());
			pemValueMap.put("b", input.getPEM());
			for(int i=input.getFutureBeginYear();i<input.getFutureEndYear()+1;i++){
				predictDataMap.put(i,Math.floor(Math.random()*1000));
			}
		}
			
		if(input.getPEM()==2){//参数拟合方法用三段法
			pemValueMap.put("K", input.getPEM());
			pemValueMap.put("a", input.getPEM());
			pemValueMap.put("b", input.getPEM());
			for(int i=input.getFutureBeginYear();i<input.getFutureEndYear()+1;i++){
				predictDataMap.put(i,Math.floor(Math.random()*1000));
			}
		}
		if(input.getPEM()==3){//冈珀茨特有拟合方法
			pemValueMap.put("K", input.getPEM());
			pemValueMap.put("a", input.getPEM());
			pemValueMap.put("b", input.getPEM());
			for(int i=input.getFutureBeginYear();i<input.getFutureEndYear()+1;i++){
				predictDataMap.put(i,Math.floor(Math.random()*1000));
			}
		}
		output.setParamVauleMap(pemValueMap);
		output.setPredictData(predictDataMap);
		return output;
	}


	@Override
	public boolean isSelfCorrelation() {
		return true;
	}


	@Override
	public boolean isMultiSource() {
		return false;
	}
}
