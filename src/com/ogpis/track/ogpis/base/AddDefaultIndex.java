package com.ogpis.track.ogpis.base;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ogpis.track.ogpis.index.entity.IndexManagement2;
import com.ogpis.track.ogpis.index.service.IndexManagementService2;
import com.ogpis.track.ogpis.plan.entity.Plan2;
import com.ogpis.track.ogpis.plan.service.PlanService2;

public class AddDefaultIndex {
	@Resource
	private PlanService2 planService;
	
	@Resource
	private IndexManagementService2 indexManagementService;
	
	private String[] defaultIndexs =  {"新增石油探明地质储量","新增天然气探明地质储量","新增煤层气探明地质储量","新增页岩气探明地质储量","石油产量","天然气产量","煤层气产量","页岩气产量"};
	
	public void addDefaultIndex(String id)
	{
		System.out.println(id);
		Plan2 bean = planService.findById(id);
		IndexManagement2 index ;
		for(int i=0;i<defaultIndexs.length;i++)
		{
			index = new IndexManagement2();
			index.setIndexName(defaultIndexs[i]);
			index.setDeleted(false);
			index.setPlan(bean);
			indexManagementService.save(index);
		}
	}

}
