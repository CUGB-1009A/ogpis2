package com.ogpis.data;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.data.entity.Dimension;
import com.ogpis.data.entity.Subject;
import com.ogpis.data.service.DimensionService;

@RunWith(SpringJUnit4ClassRunner.class)
//用于配置spring中测试的环境
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
//用于指定配置文件所在的位置
public class TestData {
	@Autowired
	private DimensionService dimensionService;

	@Test
	public void test(){
		Dimension dimension =  dimensionService.findById("1");
		List<Subject> subjects = dimension.getSubject();
		for(Subject subject : subjects){
			System.out.println(subject.getPriority()+":"+subject.getName());
			
		}
	}
}
