package com.ogpis.demo.dao;

import com.ogpis.base.common.hibernate3.Updater;
import com.ogpis.demo.entity.Demo;

public interface DemoDao {

	public Demo save(Demo demo);
	
	public Demo deleteById(String id);
	
	public Demo updateByUpdater(Updater<Demo> updater);

	public Demo findById(String id);

}
