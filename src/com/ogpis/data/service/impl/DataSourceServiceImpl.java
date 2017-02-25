package com.ogpis.data.service.impl;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.dao.DataSourceDao;
import com.ogpis.data.dao.DataSourceFieldDao;
import com.ogpis.data.dao.DataSourceMetricDao;
import com.ogpis.data.dao.DimensionDao;
import com.ogpis.data.dao.DimensionValueDao;
import com.ogpis.data.dao.InterfaceTableDao;
import com.ogpis.data.dao.MultiDataSourceMetricDao;
import com.ogpis.data.dao.SubjectDao;
import com.ogpis.data.dao.TableColumnsDao;
import com.ogpis.data.entity.DataSource;
import com.ogpis.data.entity.DataSourceField;
import com.ogpis.data.entity.DataSourceMetric;
import com.ogpis.data.entity.Dimension;
import com.ogpis.data.entity.DimensionValue;
import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.data.entity.MultiDataSourceMetric;
import com.ogpis.data.entity.Subject;
import com.ogpis.data.entity.TableColumns;
import com.ogpis.data.service.DataSourceService;

@Service
@Transactional
public class DataSourceServiceImpl implements DataSourceService {

	@Autowired
	private DataSourceDao dataSourceDao;
	@Autowired
	private SubjectDao subjectDao;
	@Autowired
	private InterfaceTableDao interfaceTableDao;
	@Autowired
	private DimensionDao dimensionDao;
	@Autowired
	private DataSourceMetricDao dataSourceMetricDao;
	@Autowired
	private TableColumnsDao tableColumnsDao;
	@Autowired
	private DimensionValueDao dimensionValueDao;
	@Autowired
	private MultiDataSourceMetricDao multiDataSourceMetricDao;
	@Autowired
	private DataSourceFieldDao dataSourceFieldDao;

	@Override
	public Pagination getAllDataSource(int cpn, Integer pageSize) {
		return dataSourceDao.getAllDataSource(cpn, pageSize);
	}

	@Override
	public DataSource findById(String id) {
		return dataSourceDao.findById(id);
	}

	@Override
	public List<DataSource> findAll() {
		return dataSourceDao.findAll();
	}

	@Override
	public String addDataSource(String json) {
		// TODO Auto-generated method stub
		JSONObject param = JSONObject.fromObject(json);

		JSONObject dataSourceJson = param.getJSONObject("DataSource");
		DataSource dataSource = new DataSource();
		String name = dataSourceJson.getString("name");
		dataSource.setName(name);
		String subjectId = dataSourceJson.getJSONObject("subject").getString(
				"id");
		Subject subject = subjectDao.findById(subjectId);
		dataSource.setSubject(subject);
		String description = dataSourceJson.getString("description");
		dataSource.setDescription(description);
		String dataSourceType = dataSourceJson.getString("dataType");
		if (dataSourceType.equals("table")) {
			String tableId = dataSourceJson.getJSONObject("table").getString(
					"id");
			InterfaceTable table = interfaceTableDao.findById(tableId);
			dataSource.setTable(table);
			dataSourceDao.addDataSource(dataSource);
		} else if (dataSourceType.equals("datasource")) {
			String dimensionName = dataSourceJson.getString("dimensionName");
			dataSource.setDimensionName(dimensionName);
			dataSourceDao.addDataSource(dataSource);

			JSONArray children = dataSourceJson.getJSONArray("children");
			StringBuilder childrenIds = new StringBuilder();
			childrenIds.append("(");
			for (int i = 0; i < children.size(); ++i) {
				childrenIds.append("'"
						+ children.getJSONObject(i).getString("id") + "'");
				if (i < children.size() - 1)
					childrenIds.append(",");
			}
			childrenIds.append(")");
			List<DataSource> dataSourceList = dataSourceDao
					.findByIds(childrenIds.toString());
			for (int i = 0; i < dataSourceList.size(); ++i) {
				DataSource tempDataDource = dataSourceList.get(i);
				tempDataDource.setParentDataSource(dataSource);
				String tempId = tempDataDource.getId();
				for (int j = 0; j < children.size(); ++j) {
					if (children.getJSONObject(j).getString("id")
							.equals(tempId)) {
						String dimensionValue = children.getJSONObject(j)
								.getString("dimensionValue");
						tempDataDource.setDimensionValue(dimensionValue);
						break;
					}
				}
				dataSourceDao.updateDataSource(tempDataDource);
			}
		}

		JSONObject dataSourceMetricJson = param
				.getJSONObject("DataSourceMetric");
		DataSourceMetric dataSourceMetric = new DataSourceMetric();
		dataSourceMetric.setDataSource(dataSource);
		Boolean isMulti = dataSourceMetricJson.getBoolean("isMulti");
		dataSourceMetric.setMulti(isMulti);
		if (isMulti) {
			String dimensionId = dataSourceMetricJson
					.getJSONObject("dimension").getString("id");
			Dimension dimension = dimensionDao.findById(dimensionId);
			dataSourceMetric.setDimension(dimension);
			dataSourceMetricDao.add(dataSourceMetric);

			JSONArray multiDataSourceMetricsJsonArray = dataSourceMetricJson
					.getJSONArray("multiDataSourceMetrics");
			Integer length = multiDataSourceMetricsJsonArray.size();
			for (int i = 0; i < length; ++i) {
				MultiDataSourceMetric temp = new MultiDataSourceMetric();
				temp.setDataSourceMetric(dataSourceMetric);
				JSONObject tempObj = multiDataSourceMetricsJsonArray
						.getJSONObject(i);
				String tabelColumnsId = tempObj.getJSONObject("tableColumns")
						.getString("id");
				TableColumns tabelColumns = tableColumnsDao
						.getColumnsById(tabelColumnsId);
				temp.setTableColumns(tabelColumns);
				String dimensionValueId = tempObj.getJSONObject(
						"dimensionValue").getString("id");
				DimensionValue dimensionValue = dimensionValueDao
						.getById(dimensionValueId);
				temp.setDimensionValue(dimensionValue);
				multiDataSourceMetricDao.add(temp);
			}
		} else {
			String tableColumnsId = dataSourceMetricJson.getJSONObject(
					"tableColumns").getString("id");
			TableColumns tableColumns = tableColumnsDao
					.getColumnsById(tableColumnsId);
			dataSourceMetric.setTableColumns(tableColumns);
			dataSourceMetricDao.add(dataSourceMetric);
		}
		JSONArray dataSourceFieldJsonArray = param
				.getJSONArray("DataSourceField");
		Integer length = dataSourceFieldJsonArray.size();

		for (int i = 0; i < length; ++i) {
			DataSourceField dataSourceField = new DataSourceField();
			dataSourceField.setDataSource(dataSource);
			JSONObject obj = dataSourceFieldJsonArray.getJSONObject(i);
			String dimensionId = obj.getJSONObject("dimension").getString("id");
			Dimension dimension = dimensionDao.findById(dimensionId);
			dataSourceField.setDimension(dimension);
			String tableColumnsId = obj.getJSONObject("tableColumns")
					.getString("id");
			TableColumns tableColumns = tableColumnsDao
					.getColumnsById(tableColumnsId);
			dataSourceField.setTableColumn(tableColumns);
			if (obj.get("isX") != null)
				dataSourceField.setX(true);
			dataSourceFieldDao.add(dataSourceField);
		}
		return "success";
	}

	@Override
	public List<DataSource> findRealDSBySujectId(String subjectId) {
		// TODO Auto-generated method stub
		return dataSourceDao.findRealDSBySujectId(subjectId);
	}

	@Override
	public String updateDataSource(DataSource dataSource) {
		// TODO Auto-generated method stub
		return dataSourceDao.updateDataSource(dataSource);
	}

	@Override
	public List<DataSource> findByIds(String dataSourceIds) {
		// TODO Auto-generated method stub
		return dataSourceDao.findByIds(dataSourceIds);
	}
}
