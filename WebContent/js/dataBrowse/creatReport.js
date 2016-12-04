function CreatReport(reportUrl,dataUrl){
	this.url=[reportUrl,dataUrl];
	this.creatReport=function(){
		return this.url;
	}	
}