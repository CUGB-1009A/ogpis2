function OnReady(id){
	report=new CreatReport('http://localhost:8080/report/test3.xml','http://localhost:8080/report/test3.json');
	
	url=report.creatReport();
	console.log(id);
	A0000.func('Build',url[0]);
	A0000.func('SetSource',url[1]);
	A0000.func('calc', 'mode=asynch');
}
function OnEvent(id, Event, p1, p2, p3, p4){
	
}
