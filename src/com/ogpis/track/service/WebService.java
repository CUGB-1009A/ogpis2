package com.ogpis.track.service;

import javax.xml.namespace.QName;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;

public class WebService {

	private static String namespace = "http://tempuri.org/";// 定死的
	private static String endpoint = "http://192.168.198.52/Service1.asmx";//
	private static String ip = "http://192.168.198.52/";

	public static String GetData(String sql) {
		String result = null, method, soapAction;
		try {
			Service service = new Service();
			Call call = (Call) service.createCall();// 通过service创建call对象
			call.setTargetEndpointAddress(new java.net.URL(endpoint));
			if (sql == null) {
				method = "GetData";
			} else {
				method = "GetDataBySQL";
			}
			soapAction = ip + method;
			call.setOperationName(new QName(namespace, method));
			if (sql != null) {
				call.addParameter(new QName(namespace, "sql"),
						org.apache.axis.encoding.XMLType.XSD_STRING,
						javax.xml.rpc.ParameterMode.IN);
			}
			call.setUseSOAPAction(true);
			call.setReturnType(org.apache.axis.encoding.XMLType.XSD_STRING);
			call.setSOAPActionURI(soapAction);
			Object[] objIn = new Object[] { sql };
			result = call.invoke(objIn).toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static String GetData() {
		return GetData(null);
	}
}
