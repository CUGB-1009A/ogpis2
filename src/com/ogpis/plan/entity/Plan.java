package com.ogpis.plan.entity;



import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.plan.entity.base.PlanEntity;

@Entity
@Table(name="ogpis_plan")
public class Plan extends PlanEntity {
	
	@SuppressWarnings("unchecked")
	public List<Plan_Index> getOrderedPlan_Index() {
		List<Plan_Index> list = (List<Plan_Index>) this.getPlan_Indexs();
		Collections.sort(list);
		return list;
	}
	//为了画十年的历史数据（规划起始年份前十年的数据）和规划期内每年目标
	@SuppressWarnings({ "unchecked"})
	public String getTenHistoryIndexData() {
		int yearNumber = Integer.parseInt(super.Endtime.toString().substring(0, 4))-Integer.parseInt(super.StartTime.toString().substring(0, 4))+1;
		StringBuilder result = new StringBuilder();
		List<IndexDataManagement> indexDataAll =  new ArrayList<IndexDataManagement>();//对应所有的完成情况
		List<IndexDataManagement> indexDataTen =  new ArrayList<IndexDataManagement>();;//对应的规划外的十年完成情况
		List<Plan_Index> plan_index = new ArrayList<Plan_Index>();
		plan_index.addAll(this.getPlan_Indexs());
		Collections.sort(plan_index);
		ArrayList<Float> indexValue = new ArrayList<Float>();
		ArrayList<String> year = new ArrayList<String>();
		//List<IndexManagement> indexTemp = new ArrayList<IndexManagement>();
		//indexTemp.addAll(this.getIndexs());
		//Collections.sort(indexTemp);
		result.append("[");
		for(Plan_Index tempPlan_Index : plan_index)
		{
			indexDataAll.clear();
			indexDataTen.clear();
			year.clear();
			indexValue.clear();
			//找出历史（规划起始年份前）十年数据
			indexDataAll.addAll(tempPlan_Index.getIndex().getIndexData());	
			Collections.sort(indexDataAll); //根据年份排序（小到大）
			for(IndexDataManagement temp:indexDataAll) //确保只有十个完成记录
			{
				if(temp.getCollectedTime().getTime()<super.StartTime.getTime())
					indexDataTen.add(temp);
				if(indexDataTen.size()>10)
					indexDataTen.remove(0);
			}
			for(IndexDataManagement indexDataTemp : indexDataTen)
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
		int beginYear = Integer.parseInt(super.StartTime.toString().substring(0, 4));
		int endYear = Integer.parseInt(super.Endtime.toString().substring(0, 4));
		float hasFinished ;
		boolean hasRecord = false ;
		StringBuilder result = new StringBuilder();
		ArrayList<Float> indexValue = new ArrayList<Float>();
		ArrayList<Integer> year = new ArrayList<Integer>();
		List<IndexDataManagement> indexDataAll =  new ArrayList<IndexDataManagement>();//对应所有的完成情况
		List<IndexDataManagement> indexDataInPlanYear =  new ArrayList<IndexDataManagement>();//对应的规划外的十年完成情况
		List<Plan_Index> plan_index = new ArrayList<Plan_Index>();
		plan_index.addAll(this.getPlan_Indexs());
		Collections.sort(plan_index);
		result.append("[");
		for(Plan_Index tempPlan_Index : plan_index)
		{
			hasFinished = 0;
			year.clear();
			indexValue.clear();
			indexDataAll.clear();
			indexDataInPlanYear.clear();
			indexDataAll.addAll(tempPlan_Index.getIndex().getIndexData());		
			Collections.sort(indexDataAll); //根据年份排序（from small to big）
			for(IndexDataManagement temp:indexDataAll) //记录处在规划期内的完成记录
			{
				if(temp.getCollectedTime().getTime()>super.StartTime.getTime()&&temp.getCollectedTime().getTime()<super.Endtime.getTime())
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
		List<IndexDataManagement> indexDataAll =  new ArrayList<IndexDataManagement>();//对应所有的完成情况
		List<IndexDataManagement> indexDataInBoth =  new ArrayList<IndexDataManagement>();//对应的规划截止时间的最新10年数据
		//List<IndexManagement> indexTemp = new ArrayList<IndexManagement>();
		//indexTemp.addAll(this.getIndexs());
		List<Plan_Index> plan_index = new ArrayList<Plan_Index>();
		plan_index.addAll(this.getPlan_Indexs());
		Collections.sort(plan_index);
		//Collections.sort(indexTemp);
		result.append("[");
		for(Plan_Index tempPlan_Index : plan_index)
		{
			year.clear();
			indexValue.clear();
			indexDataAll.clear();
			indexDataInBoth.clear();
			indexDataAll.addAll(tempPlan_Index.getIndex().getIndexData());		
			Collections.sort(indexDataAll); //根据年份排序（2000----2010）
			for(IndexDataManagement temp:indexDataAll) //记录处在规划期内的完成记录
			{
				if(temp.getCollectedTime().getTime()<super.Endtime.getTime())
					indexDataInBoth.add(temp);
				if(indexDataInBoth.size()>10)
					indexDataInBoth.remove(0);
			}
			for(IndexDataManagement indexDataTemp : indexDataInBoth)
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
	
	//获取指标对应的所有历史数据（规划截止时间前的所有历史数据）
	@SuppressWarnings("unchecked")
	public String getAllHistoryIndexData(){	
		StringBuilder result = new StringBuilder();
		ArrayList<Float> indexValue = new ArrayList<Float>();
		ArrayList<Integer> year = new ArrayList<Integer>();
		List<IndexDataManagement> indexDataAll =  new ArrayList<IndexDataManagement>();//对应所有的完成情况
		List<IndexDataManagement> indexDataInPlanYear =  new ArrayList<IndexDataManagement>();//对应的规划外的十年完成情况
		//List<IndexManagement> indexTemp = new ArrayList<IndexManagement>();
		//indexTemp.addAll(this.getIndexs());
		List<Plan_Index> plan_index = new ArrayList<Plan_Index>();
		plan_index.addAll(this.getPlan_Indexs());
		Collections.sort(plan_index);
		//Collections.sort(indexTemp);
		result.append("[");
		for(Plan_Index tempPlan_Index : plan_index)
		{
			year.clear();
			indexValue.clear();
			indexDataAll.clear();
			indexDataInPlanYear.clear();
			indexDataAll.addAll(tempPlan_Index.getIndex().getIndexData());		
			Collections.sort(indexDataAll); //根据年份排序（2000----2010）
			for(IndexDataManagement temp:indexDataAll) //记录处在规划期内的完成记录
			{
				if(temp.getCollectedTime().getTime()<super.Endtime.getTime())
					indexDataInPlanYear.add(temp);
			}
			for(IndexDataManagement indexDataTemp : indexDataInPlanYear)
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
		return Integer.parseInt(super.Endtime.toString().substring(0, 4))-Integer.parseInt(super.StartTime.toString().substring(0, 4));
	}
	
	public List<IndexManagement> getIndexs() {
		List<IndexManagement> result = new ArrayList();
		for (Plan_Index p_i : this.getPlan_Indexs()) {
			result.add(p_i.getIndex());
		}
		return result;
	}
	
	public List<String> getIndexIds() {
		List<String> result = new ArrayList();
		for (Plan_Index p_i : this.getPlan_Indexs()) {
			result.add(p_i.getIndex().getId());
		}
		return result;
	}
}
