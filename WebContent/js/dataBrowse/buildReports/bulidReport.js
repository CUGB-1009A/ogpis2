var som={
            "xName":"盆地",
            "yName":"忆方",
            "ds1":[
            {"省（市、区、海域）":"安徽","地质资源量":210.23},
            {"省（市、区、海域）":"福建","地质资源量":61.11},
            {"省（市、区、海域）":"甘肃","地质资源量":6.23},
            {"省（市、区、海域）":"广东","地质资源量":4.23},
            {"省（市、区、海域）":"广西","地质资源量":3.23},
            {"省（市、区、海域）":"贵州","地质资源量":2.23},
            {"省（市、区、海域）":"海南","地质资源量":2.00},
            {"省（市、区、海域）":"河北","地质资源量":1.65},
            {"省（市、区、海域）":"河南","地质资源量":1.23},
            {"省（市、区、海域）":"黑龙江","地质资源量":0.23},
            {"省（市、区、海域）":"山西","地质资源量":10.23}
        ]};
var report=new Data_mould("2005年全国地质资源量",som);
var xmlstr=report.report_xmlstr();
var report_data=report.report_data();
function OnReady(id){
	dataBrowseReport.func('Build',xmlstr);
	dataBrowseReport.func('SetSource','ds1\r\n'+JSON.stringify(report_data));
	dataBrowseReport.func('Fill','');
}
function OnEvent(id, Event, p1, p2, p3, p4){
	
}
