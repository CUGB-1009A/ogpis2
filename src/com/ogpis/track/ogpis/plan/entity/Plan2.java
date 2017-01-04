package com.ogpis.track.ogpis.plan.entity;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.track.ogpis.index.entity.IndexDataManagement2;
import com.ogpis.track.ogpis.index.entity.IndexManagement2;
import com.ogpis.track.ogpis.plan.entity.base.PlanEntity2;


@Entity
@Table(name = "ogpis_plan")
public class Plan2 extends PlanEntity2 {
	
	@SuppressWarnings("unchecked")
	public List<Plan_Index2> getOrderedPlan_Index() {
		List<Plan_Index2> list = (List<Plan_Index2>) this.getPlan_indexs();
		Collections.sort(list);
		return list;
	}
	//为了画相关历史数据，取（跟踪和非跟踪的）所有指标项的历史数据（规划年间的数据）展示出来
	@SuppressWarnings({ "unchecked"})
	public String getAllIndexHistory() {
		StringBuilder result = new StringBuilder();
		ArrayList<Float> indexValue = new ArrayList<Float>();
		ArrayList<Integer> year = new ArrayList<Integer>();
		List<IndexDataManagement2> indexDataAll =  new ArrayList<IndexDataManagement2>();//对应所有的完成情况
		List<IndexDataManagement2> indexDataInPlanYear =  new ArrayList<IndexDataManagement2>();//对应的规划外的十年完成情况
		//List<IndexManagement> indexTemp = new ArrayList<IndexManagement>();
		//indexTemp.addAll(this.getIndexs());
		List<Plan_Index2> plan_index = new ArrayList<Plan_Index2>();
		plan_index.addAll(this.getPlan_indexs());
		Collections.sort(plan_index);
		//Collections.sort(indexTemp);
		result.append("[");
		for(Plan_Index2 tempPlan_Index : plan_index)
		{
			year.clear();
			indexValue.clear();
			indexDataAll.clear();
			indexDataInPlanYear.clear();
			indexDataAll.addAll(tempPlan_Index.getIndex().getIndexData());		
			Collections.sort(indexDataAll); //根据年份排序（2000----2010）
			for(IndexDataManagement2 temp:indexDataAll) //记录处在规划期内的完成记录
			{
				if(temp.getCollectedTime().getTime()<super.endTime.getTime())
					indexDataInPlanYear.add(temp);
			}
			for(IndexDataManagement2 indexDataTemp : indexDataInPlanYear)
			{
				year.add(Integer.parseInt(indexDataTemp.getCollectedTime().toString().substring(0, 4)));
				indexValue.add(indexDataTemp.getFinishedWorkload());
			}
			result.append("{\"indexType\":\""+tempPlan_Index.getIndex().getIndexType()+"\",\"indexUnit\":\"" + tempPlan_Index.getIndex().getIndexUnit() + "\",\"indexName\":\"" + tempPlan_Index.getIndex().getIndexName()
			+ "\",\"year\":"+ year.toString() + ",\"value\":" + indexValue.toString() + "},");
		}
		result.deleteCharAt(result.length() - 1);
		result.append("]");
		return result.toString();
	}
	
	
	//为了画十年的历史数据（规划起始年份前十年的数据）和规划期内每年目标
	@SuppressWarnings({ "unchecked"})
	public String getTenHistoryIndexData() {
		int yearNumber = Integer.parseInt(super.endTime.toString().substring(0, 4))-Integer.parseInt(super.startTime.toString().substring(0, 4))+1;
		StringBuilder result = new StringBuilder();
		List<IndexDataManagement2> indexDataAll =  new ArrayList<IndexDataManagement2>();//对应所有的完成情况
		List<IndexDataManagement2> indexDataTen =  new ArrayList<IndexDataManagement2>();;//对应的规划外的十年完成情况
		List<Plan_Index2> plan_index = new ArrayList<Plan_Index2>();
		for(Plan_Index2 temp:this.getPlan_indexs())
		{
			if(temp.getIndex().isTrack())
				plan_index.add(temp);
		}
		Collections.sort(plan_index);
		ArrayList<Float> indexValue = new ArrayList<Float>();
		ArrayList<String> year = new ArrayList<String>();
		//List<IndexManagement> indexTemp = new ArrayList<IndexManagement>();
		//indexTemp.addAll(this.getIndexs());
		//Collections.sort(indexTemp);
		result.append("[");
		for(Plan_Index2 tempPlan_Index : plan_index)
		{
			indexDataAll.clear();
			indexDataTen.clear();
			year.clear();
			indexValue.clear();
			//找出历史（规划起始年份前）十年数据
			indexDataAll.addAll(tempPlan_Index.getIndex().getIndexData());	
			Collections.sort(indexDataAll); //根据年份排序（小到大）
			for(IndexDataManagement2 temp:indexDataAll) //确保只有十个完成记录
			{
				if(temp.getCollectedTime().getTime()<super.startTime.getTime())
					indexDataTen.add(temp);
				if(indexDataTen.size()>10)
					indexDataTen.remove(0);
			}
			for(IndexDataManagement2 indexDataTemp : indexDataTen)
			{
				year.add("'"+indexDataTemp.getCollectedTime().toString().substring(0, 4)+"'");
				indexValue.add(indexDataTemp.getFinishedWorkload());
			}
			year.add("'目标值'");
			indexValue.add(tempPlan_Index.getTargetValue()/yearNumber);
			result.append("{\"indexUnit\":\"" + tempPlan_Index.getIndex().getIndexUnit() + "\",\"indexName\":\"" + tempPlan_Index.getIndex().getIndexName()
			+ "\",\"indexValue\":" + tempPlan_Index.getTargetValue()/yearNumber + ",\"year\":"
			+ year.toString() + ",\"value\":" + indexValue.toString() + "},");
		}
		result.deleteCharAt(result.length() - 1);
		result.append("]");
		return result.toString();
	}
	
	//这个是取规划年间的完成情况（在规划年间，完成情况有几年，算几年）
	@SuppressWarnings({ "unchecked"})
	public String getIndexDataInPlanYear() {
		int beginYear = Integer.parseInt(super.startTime.toString().substring(0, 4));
		int endYear = Integer.parseInt(super.endTime.toString().substring(0, 4));
		float hasFinished ;
		boolean hasRecord = false ;
		StringBuilder result = new StringBuilder();
		ArrayList<Float> indexValue = new ArrayList<Float>();
		ArrayList<Integer> year = new ArrayList<Integer>();
		List<IndexDataManagement2> indexDataAll =  new ArrayList<IndexDataManagement2>();//对应所有的完成情况
		List<IndexDataManagement2> indexDataInPlanYear =  new ArrayList<IndexDataManagement2>();//对应的规划外的十年完成情况
		List<Plan_Index2> plan_index = new ArrayList<Plan_Index2>();
		for(Plan_Index2 temp:this.getPlan_indexs())
		{
			if(temp.getIndex().isTrack())
				plan_index.add(temp);
		}
		Collections.sort(plan_index);
		result.append("[");
		for(Plan_Index2 tempPlan_Index : plan_index)
		{
			hasFinished = 0;
			year.clear();
			indexValue.clear();
			indexDataAll.clear();
			indexDataInPlanYear.clear();
			indexDataAll.addAll(tempPlan_Index.getIndex().getIndexData());		
			Collections.sort(indexDataAll); //根据年份排序（from small to big）
			for(IndexDataManagement2 temp:indexDataAll) //记录处在规划期内的完成记录
			{
				if(temp.getCollectedTime().getTime()>super.startTime.getTime()&&temp.getCollectedTime().getTime()<super.endTime.getTime())
					indexDataInPlanYear.add(temp);
			}
			for(int i=beginYear;i<endYear+1;i++)
			{
				hasRecord = false;
				for(IndexDataManagement2 indexDataTemp : indexDataInPlanYear)
				{
					if(Integer.parseInt(indexDataTemp.getCollectedTime().toString().substring(0, 4))==i)
					{
						hasFinished = hasFinished + indexDataTemp.getFinishedWorkload();
						year.add(Integer.parseInt(indexDataTemp.getCollectedTime().toString().substring(0, 4)));
						indexValue.add(indexDataTemp.getFinishedWorkload());
						hasRecord = true ;
					}
				}
				if(!hasRecord)
				{
					year.add(i);
					indexValue.add(Float.parseFloat("0"));
				}			
			}
			
			result.append("{\"hasFinished\":"+hasFinished+",\"indexUnit\":\"" + tempPlan_Index.getIndex().getIndexUnit() + "\",\"indexName\":\"" + tempPlan_Index.getIndex().getIndexName()
			+ "\",\"indexValue\":" + tempPlan_Index.getTargetValue()+ ",\"year\":"
			+ year.toString() + ",\"value\":" + indexValue.toString() + "},");
		}
		result.deleteCharAt(result.length() - 1);
		result.append("]");
		return result.toString();
	}
	
	@SuppressWarnings("unchecked")
	public String getIndexDataInBoth() {
		StringBuilder result = new StringBuilder();
		ArrayList<Float> indexValue = new ArrayList<Float>();
		ArrayList<Integer> year = new ArrayList<Integer>();
		List<IndexDataManagement2> indexDataAll =  new ArrayList<IndexDataManagement2>();//对应所有的完成情况
		List<IndexDataManagement2> indexDataInBoth =  new ArrayList<IndexDataManagement2>();//对应的规划截止时间的最新10年数据
		//List<IndexManagement> indexTemp = new ArrayList<IndexManagement>();
		//indexTemp.addAll(this.getIndexs());
		List<Plan_Index2> plan_index = new ArrayList<Plan_Index2>();
		for(Plan_Index2 temp:this.getPlan_indexs())
		{
			if(temp.getIndex().isTrack())
				plan_index.add(temp);
		}
		Collections.sort(plan_index);
		//Collections.sort(indexTemp);
		result.append("[");
		for(Plan_Index2 tempPlan_Index : plan_index)
		{
			year.clear();
			indexValue.clear();
			indexDataAll.clear();
			indexDataInBoth.clear();
			indexDataAll.addAll(tempPlan_Index.getIndex().getIndexData());		
			Collections.sort(indexDataAll); //根据年份排序（2000----2010）
			for(IndexDataManagement2 temp:indexDataAll) //记录处在规划期内的完成记录
			{
				if(temp.getCollectedTime().getTime()<super.endTime.getTime())
					indexDataInBoth.add(temp);
				if(indexDataInBoth.size()>10)
					indexDataInBoth.remove(0);
			}
			for(IndexDataManagement2 indexDataTemp : indexDataInBoth)
			{
				year.add(Integer.parseInt(indexDataTemp.getCollectedTime().toString().substring(0, 4)));
				indexValue.add(indexDataTemp.getFinishedWorkload());
			}
			result.append("{\"indexUnit\":\"" + tempPlan_Index.getIndex().getIndexUnit() + "\",\"indexName\":\"" + tempPlan_Index.getIndex().getIndexName()
			+ "\",\"indexValue\":" + tempPlan_Index.getTargetValue()+ ",\"year\":"
			+ year.toString() + ",\"value\":" + indexValue.toString() + "},");
		}
		result.deleteCharAt(result.length() - 1);
		result.append("]");
		return result.toString();
	}
	
	//获取指标（跟踪指标）对应的所有历史数据（规划截止时间前的所有历史数据）
	@SuppressWarnings("unchecked")
	public String getAllHistoryIndexData(){	
		StringBuilder result = new StringBuilder();
		ArrayList<Float> indexValue = new ArrayList<Float>();
		ArrayList<Integer> year = new ArrayList<Integer>();
		List<IndexDataManagement2> indexDataAll =  new ArrayList<IndexDataManagement2>();//对应所有的完成情况
		List<IndexDataManagement2> indexDataInPlanYear =  new ArrayList<IndexDataManagement2>();//对应的规划外的十年完成情况
		//List<IndexManagement> indexTemp = new ArrayList<IndexManagement>();
		//indexTemp.addAll(this.getIndexs());
		List<Plan_Index2> plan_index = new ArrayList<Plan_Index2>();
		for(Plan_Index2 temp:this.getPlan_indexs())
		{
			if(temp.getIndex().isTrack())
				plan_index.add(temp);
		}
		Collections.sort(plan_index);
		//Collections.sort(indexTemp);
		result.append("[");
		for(Plan_Index2 tempPlan_Index : plan_index)
		{
			year.clear();
			indexValue.clear();
			indexDataAll.clear();
			indexDataInPlanYear.clear();
			indexDataAll.addAll(tempPlan_Index.getIndex().getIndexData());		
			Collections.sort(indexDataAll); //根据年份排序（2000----2010）
			for(IndexDataManagement2 temp:indexDataAll) //记录处在规划期内的完成记录
			{
				if(temp.getCollectedTime().getTime()<super.endTime.getTime())
					indexDataInPlanYear.add(temp);
			}
			for(IndexDataManagement2 indexDataTemp : indexDataInPlanYear)
			{
				year.add(Integer.parseInt(indexDataTemp.getCollectedTime().toString().substring(0, 4)));
				indexValue.add(indexDataTemp.getFinishedWorkload());
			}
			result.append("{\"indexType\":\""+tempPlan_Index.getIndex().getIndexType()+"\",\"indexUnit\":\"" + tempPlan_Index.getIndex().getIndexUnit() + "\",\"indexName\":\"" + tempPlan_Index.getIndex().getIndexName()
			+ "\",\"indexValue\":" + tempPlan_Index.getTargetValue()+ ",\"year\":"
			+ year.toString() + ",\"value\":" + indexValue.toString() + "},");
		}
		result.deleteCharAt(result.length() - 1);
		result.append("]");
		return result.toString();
		
	}
	
	public Integer getPlanYears()
	{
		return Integer.parseInt(super.endTime.toString().substring(0, 4))-Integer.parseInt(super.startTime.toString().substring(0, 4));
	}
	
	public List<IndexManagement2> getIndexs() {
		List<IndexManagement2> result = new ArrayList();
		for (Plan_Index2 p_i : this.getPlan_indexs()) {
			result.add(p_i.getIndex());
		}
		return result;
	}
	
	public List<String> getIndexIds() {
		List<String> result = new ArrayList();
		for (Plan_Index2 p_i : this.getPlan_indexs()) {
			result.add(p_i.getIndex().getId());
		}
		return result;
	}

}
