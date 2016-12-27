function OnReady(id){
	if(id=='AF_zyl_dq_01'){
		AF_zyl_dq_01.func('Build','http://localhost:8088/ogpis2/resource/supcan1.0.95.0/report/AF_zyl_qg_01.xml');
		AF_zyl_dq_01.func('SetSource','ds1 \r\n http://localhost:8088/ogpis2/resource/supcan1.0.95.0/reportdata/AF_zyl_dq_01.json');
		AF_zyl_dq_01.func('SetCellData','A1 \r\n 2006年全国东部地区石油地质资源量');
		AF_zyl_dq_01.func('Fill')
	}
	else if(id=='AF_zyl_qg_01'){
		AF_zyl_qg_01.func('Build','http://localhost:8088/ogpis2/resource/supcan1.0.95.0/report/AF_zyl_qg_01.xml');
		AF_zyl_qg_01.func('SetSource','ds1 \r\n http://localhost:8088/ogpis2/resource/supcan1.0.95.0/reportdata/AF_zyl_qg_01.json');
		AF_zyl_qg_01.func('Fill')
	}
	else if(id=='AF_zyl_qg_02'){
		AF_zyl_qg_02.func('Build','http://localhost:8088/ogpis2/resource/supcan1.0.95.0/report/AF_zyl_qg_02.xml');
		AF_zyl_qg_02.func('SetSource','ds1 \r\n http://localhost:8088/ogpis2/resource/supcan1.0.95.0/reportdata/AF_zyl_qg_02.json');
		AF_zyl_qg_02.func('Fill')
	}
}
function OnEvent(id, Event, p1, p2, p3, p4){
	
}
