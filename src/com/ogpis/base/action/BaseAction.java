package com.ogpis.base.action;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.log4j.Logger;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.base.exception.ActionException;

/**
 * 描述：
 *
 * @author admin
 * @since 2013-8-6
 */
public class BaseAction {
	
	protected Logger logger = Logger.getLogger(BaseAction.class);

	/**
	 * 将数据转换成json格式
	 * @param pagination 分页对象
	 * @param excludesfield 不需输出的属性
	 * @param isPagination是否分页
	 * @return
	 */
	public String toJsonTableData(Pagination pagination, String[] excludesfield,
			boolean isPagination) {
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.setExcludes(excludesfield); // 过滤不需输出的属性
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		jsonArray.addAll(pagination.getList(), jsonConfig);

		// 封装为Json表格形式
		jsonObject.put("total", pagination.getTotalCount());
		jsonObject.put("rows", jsonArray);

		if (isPagination) { // 支持分页形式
			return jsonObject.toString();
		} else { // 非分页形式
			return jsonArray.toString();
		}
	}
	/**
	 * 判断参数是否不为空
	 * 
	 * @param param
	 *            参数
	 * @return
	 */
	protected boolean isNotNull(String param) {
		return (param != null) && (param.length() > 0);
	}
}
