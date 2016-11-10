package com.ogpis.demo.service;

import com.ogpis.demo.entity.Demo;

public interface DemoService {
	public Demo save(Demo demo);

	public Demo deleteById(String id);

	public Demo update(Demo demo);

	public Demo findById(String id);

}
