package com.ogpis.track.tools;

import net.sf.json.JSONObject;

public class SafeJson {
	
	private JSONObject json;
	
	public SafeJson(Object obj) {
		this.json = JSONObject.fromObject(obj);
	}

	public String getString(String key) {
		if (isNotNull(key))
			return this.json.getString(key);
		return null;
	}

	public Boolean getBoolean(String key) {
		if (isNotNull(key))
			return this.json.getBoolean(key);
		return null;
	}

	public JSONObject getJSONObject(String key) {
		if (isNotNull(key))
			return this.json.getJSONObject(key);
		return null;

	}

	public Integer getInt(String key) {
		if (isNotNull(key))
			return this.json.getInt(key);
		return null;
	}

	public Double getDouble(String key) {
		if (isNotNull(key))
			return this.json.getDouble(key);
		return null;
	}
	
	public Object get(String key){
		if(isNotNull(key)){
			String className=this.json.get(key).getClass().getSimpleName();
			if(className.equals("Integer"))
				return this.json.getDouble(key);
//			if(className.endsWith("String"))
//				return this.json.getString(key);
//			else if(className.equals("Double"))
//				return this.json.getDouble(key);
//			else if(className.equals("Integer"))
//				return this.json.getInt(key);
//			else if(className.endsWith("Boolean"))
//				return this.json.getBoolean(key);
			return this.json.get(key);
		}
		return null;
	}

	private Boolean isNotNull(String key) {
		if (this.json.get(key) == null)
			return false;
		else
			return true;
	}
}
