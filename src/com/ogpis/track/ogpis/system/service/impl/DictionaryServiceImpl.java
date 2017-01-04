package com.ogpis.track.ogpis.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.track.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.track.ogpis.system.dao.DictionaryDao;
import com.ogpis.track.ogpis.system.entity.Dictionary;
import com.ogpis.track.ogpis.system.service.DictionaryService;

@Service
public class DictionaryServiceImpl extends BaseServiceImpl<Dictionary, String>
		implements DictionaryService {
	@Autowired
	protected void setDictionaryDao(DictionaryDao dictionaryDao) {
		setBaseDao(dictionaryDao);
	}
}
