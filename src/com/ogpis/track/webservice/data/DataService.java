package com.ogpis.track.webservice.data;

import java.util.HashMap;
import java.util.Map;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ogpis.track.dao.base.MyTestDao;
import com.ogpis.track.entity.TestEntity;
import com.ogpis.track.webservice.WebService;
import com.ogpis.track.webservice.WebServiceParam;
import com.ogpis.track.webservice.WebServiceParams;

@Component
public class DataService {
	@Autowired
	private MyTestDao myTestDao;
	
	@SuppressWarnings("finally")
	public String getData(String paramJson){
		String result=null;
		String[] results = null;
		result=myTestDao.findByParams(paramJson);
		if(result==null){
			try{
				WebServiceParams params=parse(paramJson);
				System.out.println("执行了getDataByParam查询");
				results=WebService.GetData(params);
				System.out.println("results");
			}catch(Exception e){
				System.out.println("执行了getDataBySql查询");
				results=WebService.GetData(paramJson);
				System.out.println("results");
			}finally{
				if(results!=null&&results[0]=="调用成功!"){
					TestEntity entity=new TestEntity(paramJson,results[1]);
					myTestDao.insert(entity);
					return results[1];
				}
				else
					return "error";
			}
		}else{
			return result;
		}
	}
	
	private WebServiceParams parse(String paramJson){
		JSONObject obj=JSONObject.fromObject(paramJson);
		Map<String, Class<?>> classMap = new HashMap<String, Class<?>>();
		classMap.put("paramList", WebServiceParam.class);
		return (WebServiceParams) JSONObject.toBean(obj, WebServiceParams.class, classMap);
	}
}
