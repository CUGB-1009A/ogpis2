package com.ogpis.demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.common.hibernate3.Updater;
import com.ogpis.demo.dao.DemoDao;
import com.ogpis.demo.entity.Demo;
import com.ogpis.demo.service.DemoService;

@Service
@Transactional
public class DemoServiceImpl implements DemoService {

	@Override
	public Demo save(Demo demo) {
		return demoDao.save(demo);
	}

	@Override
	public Demo deleteById(String id) {
		return demoDao.deleteById(id);
	}

	@Override
	public Demo update(Demo demo) {
		Updater<Demo> updater = new Updater<Demo>(demo);
		demo = demoDao.updateByUpdater(updater);
		return demo;
	}

	@Override
	public Demo findById(String id) {
		return demoDao.findById(id);
	}

	@Autowired
	private DemoDao demoDao;

}
