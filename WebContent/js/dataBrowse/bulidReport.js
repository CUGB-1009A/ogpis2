function OnReady(id){
	var reportType="A100";
	switch (reportType){
	case "A100":
		AF.func('Build','http://localhost:8080/report/test4.xml'); 
		AF.func('SetSource','ds1 \r\n http://localhost:8080/report/test4.json');
		AF.func('Calc', 'mode=asynch');		
		break;
	case "B000":
		AF.func('Build','http://localhost:8080/report/B000.xml'); 
		AF.func('SetSource','B000 \r\n http://localhost:8080/report/B000.json');
		AF.func('SetCellData', '1 \r\n 0 \r\n年度计划');
		AF.func('Calc', 'mode=asynch');
		break;
	case "B001":
		break;
	case "A010":
		AF.func('Build','http://localhost:8080/report/test4.xml');
		AF.func('SetSource','ds1 \r\n http://localhost:8080/report/test4.json');
		AF.func('Calc', 'mode=asynch');
		break;
		
	}
}
function OnEvent(id, Event, p1, p2, p3, p4){
	
}
