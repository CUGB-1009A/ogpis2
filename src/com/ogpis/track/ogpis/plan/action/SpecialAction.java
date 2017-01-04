package com.ogpis.track.ogpis.plan.action;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogpis.track.ogpis.base.action.BaseAction;
import com.ogpis.track.ogpis.index.entity.IndexDataManagement;
import com.ogpis.track.ogpis.index.entity.IndexManagement;
import com.ogpis.track.ogpis.index.service.IndexManagementService;
import com.ogpis.track.ogpis.plan.entity.Plan;
import com.ogpis.track.ogpis.plan.entity.Plan_Index;
import com.ogpis.track.ogpis.plan.service.PlanService;
import com.ogpis.track.ogpis.plan.service.Plan_IndexService;



@Controller
public class SpecialAction extends BaseAction {
	@Autowired Plan_IndexService plan_IndexService;
	@Autowired PlanService planService;
	@Autowired IndexManagementService indexManagementService;
	

	@RequestMapping(value = "/special/list")
	public String list(HttpServletRequest request, ModelMap model,String mineType) {
		super.addMenuParams(request, model);
		StringBuilder result = new StringBuilder();
		//第一步找出所有的全国规划
		List<Plan> planList = planService.findAll(false, "QG", "");
		//包含该专题指标项的规划
		List<Plan> plan = new ArrayList<Plan>();
		//第二部找出符合条件的指标项 mineType = mineType(全国的指标项)
		List<IndexManagement> indexList = indexManagementService.findByMineType(mineType);
		List<Plan_Index> plan_Index = new ArrayList<Plan_Index>();
		result.append("[");
		model.addAttribute("indexList",indexList);
		for(IndexManagement index : indexList)//对专题指标项进行循环
		{
			String indexId = index.getId();
			result.append("{\"indexUnit\":\""+index.getIndexUnit()+"\",\"indexName\":\""+index.getIndexName()+"\",\"plans\":[");
			plan.clear();
			for(Plan plan1 : planList)
			{
				
				//System.out.println(plan1.getIndexIds().contains(index.getId()));
				if(plan1.getIndexIds().contains(index.getId()))
					{
					plan.add(plan1); //plan中存储的是包含该（index)专题指标项的规划
					}
			}
			for(Plan plan2 : plan)
			{
				result.append("{\"planName\":\""+plan2.getPlanName()+"\",");
				plan_Index = plan2.getPlan_indexs();
				for(Plan_Index temp : plan_Index)
				{
					if(temp.getIndex().getId().equals(indexId))
						result.append("\"indexValue\":"+temp.getTargetValue()+",");
				}
				result.append(getPlan_IndexFinishedCondition(plan2,index));
				result.append("},");
			}
			result.deleteCharAt(result.length() - 1);
			result.append("]},");
		}
		result.deleteCharAt(result.length() - 1);
		result.append("]");
		model.addAttribute("result",result.toString());
		model.addAttribute("mineType",mineType);
		return "special/list";
	}
	
	public String getPlan_IndexFinishedCondition(Plan plan,IndexManagement index)
	{
		StringBuilder result = new StringBuilder();
		ArrayList<Float> value = new ArrayList<Float>();
		ArrayList<Integer> year = new ArrayList<Integer>();
		List<IndexDataManagement> indexDataAll = new ArrayList<IndexDataManagement>();
		List<IndexDataManagement> indexDataInPlanYear = new ArrayList<IndexDataManagement>();
		Float hasFinished = (float) 0;
		boolean hasRecord = false;
		int beginYear = Integer.parseInt(plan.getStartTime().toString().substring(0, 4));
		int endYear = Integer.parseInt(plan.getEndTime().toString().substring(0, 4));
		indexDataAll.addAll(index.getIndexData());
		//System.out.println(beginYear+"----"+endYear+"-------"+indexDataAll.size());
		for(IndexDataManagement temp:indexDataAll) //记录处在规划期内的完成记录
		{
			if(temp.getCollectedTime().getTime() > plan.getStartTime().getTime()&& temp.getCollectedTime().getTime() < plan.getEndTime().getTime())
				indexDataInPlanYear.add(temp);
		}
		for(int i=beginYear;i<endYear+1;i++)
		{
			hasRecord = false;
			for(IndexDataManagement indexDataTemp : indexDataInPlanYear)
			{
				if(Integer.parseInt(indexDataTemp.getCollectedTime().toString().substring(0, 4))==i)
				{
					hasFinished = hasFinished + indexDataTemp.getFinishedWorkload();
					year.add(Integer.parseInt(indexDataTemp.getCollectedTime().toString().substring(0, 4)));
					value.add(indexDataTemp.getFinishedWorkload());
					hasRecord = true ;
				}
			}
			if(!hasRecord)
			{
				year.add(i);
				value.add(Float.parseFloat("0"));
			}			
		}
		result.append("\"hasFinished\":"+hasFinished+",\"year\":"+year.toString()+",\"value\":"+value.toString());
		return result.toString();
	}
}
