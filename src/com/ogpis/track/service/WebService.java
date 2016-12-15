package com.ogpis.track.service;

import javax.xml.namespace.QName;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;

public class WebService {

	private static final String namespace = "http://tempuri.org/";// 定死的
	private static final String endpoint = "http://192.168.198.52/Service1.asmx";//服务发布的地址
	private static final String ip = "http://192.168.198.52/";
	private static final String GetData = "GetData";//方法名称
	private static final String GetDataBySQL = "GetDataBySQL";//方法名称
	
	private static String service(String method, Object[] objIn) {
		String result = null;
		try {
			Service service = new Service();
			Call call = (Call) service.createCall();// 通过service创建call对象
			call.setTargetEndpointAddress(new java.net.URL(endpoint));
			call.setOperationName(new QName(namespace, method));
			if (method.equals(GetDataBySQL)) {
				call.addParameter(new QName(namespace, "sql"),
						org.apache.axis.encoding.XMLType.XSD_STRING,
						javax.xml.rpc.ParameterMode.IN);
			} else if (method.equals(GetData)) {
				call.addParameter(new QName(namespace, "name"),
						org.apache.axis.encoding.XMLType.XSD_STRING,
						javax.xml.rpc.ParameterMode.IN);
				call.addParameter(new QName(namespace, "json"),
						org.apache.axis.encoding.XMLType.XSD_STRING,
						javax.xml.rpc.ParameterMode.IN);
			}
			call.setUseSOAPAction(true);
			call.setReturnType(org.apache.axis.encoding.XMLType.XSD_STRING);
			String soapAction = ip + method;
			call.setSOAPActionURI(soapAction);
			result = call.invoke(objIn).toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// name为表或表联合的标识；json为字段、条件、值的组合，形如{field:石油,symbol:
	public static String GetData(String name, WebServiceParams params) {
		String method = GetData;
		Object[] objIn = new Object[] { name, params.toString() };
		return service(method, objIn);
	}

	// sql为查询数据的SQL语句字符串
	public static String GetData(String sql) {
		String method = GetDataBySQL;
		Object[] objIn = new Object[] { sql };
		return service(method, objIn);
	}
}
