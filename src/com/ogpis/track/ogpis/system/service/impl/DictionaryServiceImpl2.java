package com.ogpis.track.ogpis.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.track.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.track.ogpis.system.dao.DictionaryDao2;
import com.ogpis.track.ogpis.system.entity.Dictionary2;
import com.ogpis.track.ogpis.system.service.DictionaryService2;

@Service
public class DictionaryServiceImpl2 extends BaseServiceImpl<Dictionary2, String>
		implements DictionaryService2 {
	@Autowired
	protected void setDictionaryDao(DictionaryDao2 dictionaryDao) {
		setBaseDao(dictionaryDao);
	}
}
