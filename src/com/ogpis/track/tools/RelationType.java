package com.ogpis.track.tools;

import net.sf.json.JSONObject;

public class RelationType {
	static private JSONObject json;
	private String 全部 = "";
	private String 大于 = ">";
	private String 大于等于 = ">=";
	private String 等于 = "=";
	private String 小于等于 = "<=";
	private String 小于 = "<";
	private String 不等于 = "!=";
	private String 包含 = "like";
	private String 不包含 = "not like";

	public String get全部() {
		return 全部;
	}

	public String get大于() {
		return 大于;
	}

	public String get大于等于() {
		return 大于等于;
	}

	public String get等于() {
		return 等于;
	}

	public String get小于等于() {
		return 小于等于;
	}

	public String get不等于() {
		return 不等于;
	}

	public String get包含() {
		return 包含;
	}

	public String get不包含() {
		return 不包含;
	}

	public String get小于() {
		return 小于;
	}

	static public String map(String key){
		if(json==null){
			synchronized(RelationType.class) {
				if(json==null){
					json=JSONObject.fromObject(new RelationType());
				}
			}
		}
		if(json.get(key)!=null)
			return json.getString(key);
		else
			return null;
	}
}
