function fillReportData(id,title,unit,data){
	window[id].func("SetCellData", "title \r\n "+title);
	window[id].func("SetCellData", "unit \r\n 单位："+unit);
	window[id].func("setSource","ds1 \r\n "+data);
	window[id].func("Calc",'mode=asynch;range=current');
}