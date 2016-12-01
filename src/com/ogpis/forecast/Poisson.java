package com.ogpis.forecast;

import com.ogpis.forecast.parameter.InputParameter;
import com.ogpis.forecast.parameter.OutputParameter;

public class Poisson implements ForecastModel {


	@Override
	public String test() {
		return "test";
	}

	//翁氏回旋模型方法计算预测值
	@Override
	public OutputParameter compute(InputParameter input) {
		if(input.getPEM()==0){//直接用修改后的参数进行预测结果
			
		}
		if(input.getPEM()==1){//参数拟合方法用最小二乘法
			
		}
		if(input.getPEM()==2){//参数拟合方法用三段法
			
		}
		if(input.getPEM()==3){//参数拟合方法用专家经验法
			
		}
		return new OutputParameter();
	}

	@Override
	public String getParam() {
		return "K;a;b";
	}
	
	@Override
	public String getName() {
		return "翁氏旋回模型";
	}


}
