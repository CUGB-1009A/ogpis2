package com.ogpis.forecast;

import java.util.LinkedHashMap;
import com.ogpis.forecast.parameter.InputParameter;
import com.ogpis.forecast.parameter.OutputParameter;

public class Poisson implements ForecastModel {


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
		map.put("哈哈，再加一种拟合方法",3);
		return map;
	}

	//翁氏回旋模型方法计算预测值
	@Override
	public OutputParameter compute(InputParameter input) {
		OutputParameter output = new OutputParameter();
		StringBuilder result = new StringBuilder();
		result.append("{\"year\":[");
		if(input.getPEM()==0){//直接用修改后的参数进行预测结果
			
		}
		if(input.getPEM()==1){//参数拟合方法用最小二乘法
			for(int i=input.getFutureBeginYear();i<input.getFutureEndYear()+1;i++){
				result.append(i+",");
			}
			result.deleteCharAt(result.length()-1);
			result.append("],\"futureData\":[");
			for(int i=input.getFutureBeginYear();i<input.getFutureEndYear()+1;i++){
				result.append(Math.random()*2000+",");
			}
			result.deleteCharAt(result.length()-1);
			result.append("],\"param\":[\"K\",\"a\",\"b\"],\"value\":[");
			for(int i=0;i<3;i++){
				result.append(i*10+",");
			}
			result.deleteCharAt(result.length()-1);
			result.append("]}");
			output.setOutput(result.toString());
		}
		if(input.getPEM()==2){//参数拟合方法用三段法
			for(int i=input.getFutureBeginYear();i<input.getFutureEndYear()+1;i++){
				result.append(i+",");
			}
			result.deleteCharAt(result.length()-1);
			result.append("],\"futureData\":[");
			for(int i=input.getFutureBeginYear();i<input.getFutureEndYear()+1;i++){
				result.append(Math.random()*2000+",");
			}
			result.deleteCharAt(result.length()-1);
			result.append("],\"param\":[\"K\",\"a\",\"b\"],\"value\":[");
			for(int i=0;i<3;i++){
				result.append(i*20+",");
			}
			result.deleteCharAt(result.length()-1);
			result.append("]}");
			output.setOutput(result.toString());
		}
		if(input.getPEM()==3){//再加的一种拟合方法
			
		}
		return output;
	}

}
