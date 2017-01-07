var som={
            "xName":"盆地",
            "yName":"忆方",
            "ds1":[
            {"省（市、区、海域）":"安徽","地质资源量95":210.23},
            {"省（市、区、海域）":"福建","地质资源量95":61.11},
            {"省（市、区、海域）":"甘肃","地质资源量95":6.23},
            {"省（市、区、海域）":"广东","地质资源量95":4.23},
            {"省（市、区、海域）":"广西","地质资源量95":3.23},
            {"省（市、区、海域）":"贵州","地质资源量95":2.23},
            {"省（市、区、海域）":"海南","地质资源量95":2.00},
            {"省（市、区、海域）":"河北","地质资源量95":1.65},
            {"省（市、区、海域）":"河南","地质资源量95":1.23},
            {"省（市、区、海域）":"黑龙江","地质资源量95":0.23},
            {"省（市、区、海域）":"山西","地质资源量95":10.23}
        ]};
var report=new Data_mould("2006年全国石油资源量",som);
var xmlstr=report.report_xmlstr();
var report_data=report.report_data();

function OnReady(id){
	if(id=='AF_zyl_dq_01'){
		AF_zyl_dq_01.func('Build','http://localhost:8080/ogpis2/resource/supcan1.0.95.0/report/AF_zyl_qg_01.xml');
		AF_zyl_dq_01.func('SetSource','ds1 \r\n http://localhost:8080/ogpis2/resource/supcan1.0.95.0/reportdata/AF_zyl_dq_01.json');
		AF_zyl_dq_01.func('SetCellData','A1 \r\n 2006年全国东部地区石油地质资源量');
		AF_zyl_dq_01.func('Fill')
	}
	else if(id=='AF_zyl_qg_01'){
		AF_zyl_qg_01.func('Build','http://localhost:8080/ogpis2/resource/supcan1.0.95.0/report/AF_zyl_qg_01.xml');
		AF_zyl_qg_01.func('SetSource','ds1 \r\n http://localhost:8080/ogpis2/resource/supcan1.0.95.0/reportdata/AF_zyl_qg_01.json');
		AF_zyl_qg_01.func('Fill')
	}
	else if(id=='AF_zyl_qg_02'){
		//AF_zyl_qg_02.func('Build','http://localhost:8080/ogpis2/resource/supcan1.0.95.0/report/AF_zyl_qg_02.xml');				
		//AF_zyl_qg_02.func('SetSource','ds1 \r\n http://localhost:8080/ogpis2/resource/supcan1.0.95.0/reportdata/AF_zyl_qg_02.json');
		AF_zyl_qg_02.func('Build',xmlstr);
		AF_zyl_qg_02.func('SetSource','ds1\r\n'+JSON.stringify(report_data));
		AF_zyl_qg_02.func('Fill','');
	}
}
function OnEvent(id, Event, p1, p2, p3, p4){
	
}
