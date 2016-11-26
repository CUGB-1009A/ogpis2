package com.ogpis.base.action;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.log4j.Logger;

import com.ogpis.base.exception.ActionException;

/**
 * 描述：
 *
 * @author admin
 * @since 2013-8-6
 */
public class BaseAction {
	/**
	 * 分页参数
	 */
	private int totalCount; // 总行数
	private int page; // 当前页码
	private int rows; // 每页行数
	private int startRow; // 从第几行开始，计算得出

	private String message; // 结果信息
	private String backUrl; // 返回地址

	/**
	 * UPDATE 修改页码地址
	 */
	public static final java.lang.String UPDATE = "update";

	protected Logger logger = Logger.getLogger(BaseAction.class);

	/**
	 * 将数据转换成json格式
	 * @param resultList 查询结果
	 * @param excludesfield 不需输出的属性
	 * @param isPagination 是否分页
	 * @return
	 */
	public String toJsonTableData(List resultList, String[] excludesfield,
			boolean isPagination) {
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.setExcludes(excludesfield); // 过滤不需输出的属性
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		jsonArray.addAll(resultList, jsonConfig);

		// 封装为Json表格形式
		jsonObject.put("total", this.getTotalCount());
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

	public int getTotalCount() {
		// 异常处理示例
		// 不需捕获底层异常（ServiceException，统一交由ExceptionHandlerAction处理）,只需捕获本层异常，包装成新的ActionException后抛出即可
		// 如果本层没有异常，即可什么都不处理
		if (totalCount == -100) {
			logger.error("获取总行数失败！");
			throw new ActionException("获取总行数失败！");
		}
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public int getStartRow() {
		this.startRow = (this.page - 1) * this.rows;
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getBackUrl() {
		return backUrl;
	}

	public void setBackUrl(String backUrl) {
		this.backUrl = backUrl;
	}

}
