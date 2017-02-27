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

	public String parseDataSourceToJson(DataSource ds) {
		StringBuilder sb = new StringBuilder();
		sb.append("{");

		sb.append("'DataSource':{");
		if (isNotNull(ds.getName()))
			sb.append("'name':'" + ds.getName() + "',");
		if (isNotNull(ds.getSubject())) {
			sb.append("'subject':{");
			Subject subject = ds.getSubject();
			sb.append("'id':'" + subject.getId() + "',");
			sb.append("'name':'" + subject.getName() + "'");
			sb.append("},");
		}

		if (isNotNull(ds.getChildren()) && ds.getChildren().size() > 0) {
			sb.append("'dataType':'datasource',");
			sb.append("'dimensionName':'" + ds.getDimensionName() + "',");
			sb.append("'children':[");
			List<DataSource> children = ds.getChildren();
			Integer length = children.size();
			for (int i = 0; i < length; ++i) {
				DataSource temp = children.get(i);
				sb.append("{");
				sb.append("'id':'" + temp.getId() + "',");
				sb.append("'dimensionValue':'" + temp.getName() + "'");
				sb.append("}");
				if (i < length - 1)
					sb.append(",");
			}
			sb.append("],");
		} else {
			sb.append("'dataType':'table',");
			if (isNotNull(ds.getTable())) {
				sb.append("'table':{");
				InterfaceTable table = ds.getTable();
				sb.append("'id':'" + table.getId() + "',");
				sb.append("'name_CN':'" + table.getName_CN() + "'");
				sb.append("},");
			}
		}
		if (isNotNull(ds.getDescription()))
			sb.append("'description':'" + ds.getDescription() + "',");
		sb.append("},");

		sb.append("'DataSourceMetric':{");
		if (isNotNull(ds.getDataSourceMetric())) {
			DataSourceMetric dataSourceMetric = ds.getDataSourceMetric();
			if (isNotNull(dataSourceMetric.isMulti()))
				sb.append("'isMulti':" + dataSourceMetric.isMulti());
			if (isNotNull(dataSourceMetric.getTableColumns())) {
				sb.append("'tableColumns':{");
				TableColumns tableColumns = dataSourceMetric.getTableColumns();
				sb.append("'id':'" + tableColumns.getId() + "',");
				sb.append("'name':'" + tableColumns.getName() + "'");
				sb.append("},");
			}
			if (isNotNull(dataSourceMetric.getDimension())) {
				sb.append("'dimension':{");
				Dimension dimension = dataSourceMetric.getDimension();
				sb.append("'id':'" + dimension.getId() + "',");
				sb.append("'name':'" + dimension.getName() + "'");
				sb.append("},");
			}
			if (isNotNull(dataSourceMetric.getMultiDataSourceMetrics())
					&& dataSourceMetric.getMultiDataSourceMetrics().size() > 0) {
				sb.append("'multiDataSourceMetrics':[");
				List<MultiDataSourceMetric> children = dataSourceMetric.getMultiDataSourceMetrics();
				Integer length = children.size();
				for (int i = 0; i < length; ++i) {
					MultiDataSourceMetric temp = children.get(i);
					sb.append("{");
					if(isNotNull(temp.getDimensionValue())){
						sb.append("'dimensionValue':{");
						DimensionValue dv=temp.getDimensionValue();
						sb.append("'id':'"+dv.getId()+"'");
						sb.append("},");
					}
					if(isNotNull(temp.getTableColumns())){
						sb.append("'tableColumns':{");
						TableColumns dv=temp.getTableColumns();
						sb.append("'id':'"+dv.getId()+"'");
						sb.append("}");
					}
					sb.append("}");
					if (i < length - 1)
						sb.append(",");
				}
				sb.append("],");
			}
		}
		sb.append("},");

		sb.append("'DataSourceField':[");
		if (isNotNull(ds.getDataSourceFields())
				&& ds.getDataSourceFields().size() > 0) {
			List<DataSourceField> list=ds.getDataSourceFields();
			Integer length=list.size();
			for(int i=0;i<length;++i){
				DataSourceField dsf=list.get(i);
				sb.append("{");
				if (isNotNull(dsf.getDimension())) {
					sb.append("'dimension':{");
					Dimension dimension = dsf.getDimension();
					sb.append("'id':'" + dimension.getId() + "',");
					sb.append("'name':'" + dimension.getName() + "'");
					sb.append("},");
				}
				if(isNotNull(dsf.getTableColumns())){
					sb.append("'tableColumns':{");
					TableColumns dv=dsf.getTableColumns();
					sb.append("'id':'"+dv.getId()+"'");
					sb.append("}");
				}
				sb.append("'isX':"+dsf.isX());
				sb.append("}");
				if(i<length-1)
					sb.append(",");
			}
		}
		sb.append("]");

		sb.append("}");
		return sb.toString();
	}

	public Boolean isNotNull(Object obj) {
		if (obj == null || obj.equals(null))
			return false;
		return true;
	}
}
