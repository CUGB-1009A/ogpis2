/**
 * Created by yuyuehua on 2017/1/3.
 */
function Data_mould(titleName,data) {//data={"xName":"","yName":"","ds1":[{key11:value11,key12:value12},{key21:value21，key22:value22}]}
    this.title=titleName;
    this.xName=data.xName;
    this.yName=data.yName;
    this.data={"ds1":data.ds1};
}
Data_mould.prototype={
    constructor:Data_mould,
    report_xmlstr:function () {
        var data=this.data;
        var title=this.title;
        var unit=this.yName;
        var columnValue1="";
        var columnValue2="";
        var num=0;
        for(var column in data.ds1[0]){
            if(num==0)
                columnValue1= column;
            else
                columnValue2= column;
            num++;
        }
        //var xmlstr="<?xml version='1.0' encoding='UTF-8' ?><!--By Supcan Report --><Report><WorkSheet name='Sheet'><Properties><BackGround bgColor='#FFFFFF'/><DefaultTD><TD fontIndex='0' textColor='#000000' transparent='true' leftBorder='1' topBorder='1' leftBorderColor='#C0C0C0' leftBorderStyle='solid' topBorderColor='#C0C0C0' topBorderStyle='solid' decimal='2' align='left' vAlign='middle' isProtected='false' isThousandSeparat='true' isRound='true' isPrint='true'/></DefaultTD><Other isShowZero='true' isRefOriPrecision='true' LineDistance='0' isRowHeightAutoExtendAble='true'/></Properties><Fonts><Font faceName='华文宋体' charSet='134' height='-14' weight='400' pitchAndFamily='2' quality='1' outPrecision='3' clipPrecision='2'/><Font faceName='华文宋体' charSet='134' height='-16' weight='400' pitchAndFamily='2' quality='1' outPrecision='3' clipPrecision='2'/><Font faceName='华文宋体' charSet='134' height='-19' weight='700' pitchAndFamily='2' quality='1' outPrecision='3' clipPrecision='2'/></Fonts><Table><Col width='233'/><Col width='246'/><Col width='140'/><Col width='140'/><Col width='140'/><Col width='167'/><Col width='15'/><TR height='50' sequence='0'><TD col='0' fontIndex='2' align='center'>2010年石油地质资源量排名前10的省区</TD><TD col='6' topBorder='0'/></TR><TR height='35' sequence='1'><TD col='0' fontIndex='1' topBorder='0'>单位：万吨</TD><TD col='2' leftBorder='0' topBorder='0'/><TD col='6' topBorder='0'/></TR><TR height='35' sequence='2'><TD col='0' fontIndex='1' bgColor='#FFC080' align='center' datatype='1' formula='=headrow(&apos;ds1&apos;)'>省（市、区、海域）</TD><TD col='1' fontIndex='1' bgColor='#FFC080' align='center' datatype='1'>地质资源量</TD><TD col='2' topBorder='0'/><TD col='6' topBorder='0'/></TR><TR height='35' sequence='3'><TD col='0' fontIndex='1' align='center' datatype='1' formula='=datarow(&apos;ds1&apos;)'/><TD col='1' fontIndex='1' align='center' datatype='1'/><TD col='6' topBorder='0'/></TR><TR height='35' sequence='4'><TD col='0' fontIndex='1' align='center' datatype='1'/><TD col='1' fontIndex='1' align='center' datatype='1'/><TD col='2' leftBorder='0' topBorder='0'/><TD col='6' topBorder='0'/></TR></Table><Merges><Range row1='1' col1='0' row2='1' col2='1'/><Range row1='2' col1='2' row2='3' col2='5'/><Range row1='0' col1='0' row2='0' col2='5'/><Range row1='1' col1='2' row2='1' col2='5'/><Range row1='4' col1='0' row2='4' col2='1'/><Range row1='4' col1='2' row2='4' col2='5'/></Merges><GraphicObjects><Chart alpha='255' isTransparent='false' borderThick='1' borderColor='#000000'><Rect x1='502' y1='89' x2='1038' y2='472'/><Properties bgColorContext='#FFFFFF' bgColor='#FFFFFF' Overflow='1' Exp='Type=4;IsRevert=1;DataExp1=4;DataExp2=B;Meaning1=4;Meaning2=A;MeaningPos=1;' MD5='af79f877d8eed8eab6aea9ef6d20c885'>ARYCAAB9AQAABwAAAAAAAAACAAAAAAAAABwKAAAAlgAAAAcAAAAHAAAAdgEAAA8CAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP**********CAAAABkAAAAHAAAABwAAAHYBAAAPAgAAEQAAAB4AAABbAQAADwIAAB4AAABbAQAAAAAAAABAb0AAAAAAAEBvQAAAAAAAAAAAgAAAAAYBAAAAAP****8AAAAAAgAAADAACAAAAGEAdQB0AG8ACgE=</Properties><Font faceName='Microsoft YaHei UI' charSet='134' height='-12' weight='400'/></Chart></GraphicObjects><PrintPage><Paper><Margin left='19' top='25' right='19' bottom='25'/></Paper><Page isIgnoreValidBorder='false'><PageCode><Font faceName='Microsoft YaHei UI' charSet='134' height='-14' weight='400'/></PageCode></Page></PrintPage></WorkSheet><DataSources Version='255' isAutoCalculateWhenOpen='false' isSaveCalculateResult='false'><DataSource type='4'><!-- Desc: Supcan Report Component DataSource Specification --><Data><ID>ds1</ID><Version>2</Version><Type>4</Type><TypeMeaning>JSON</TypeMeaning><Source>resource/supcan1.0.95.0/reportdata/AF_zyl_qg_02.json</Source><XML_RecordAble_Nodes><Node><name>jsonobject</name></Node></XML_RecordAble_Nodes><Columns><Column><name>jsonobject\\省（市、区、海域）</name><text>省（市、区、海域）</text><type>string</type><visible>true</visible><sequence>1</sequence></Column><Column><name>jsonobject\\地质资源量95</name><text>地质资源量95</text><type>string</type><visible>true</visible><sequence>2</sequence></Column></Columns></Data></DataSource></DataSources></Report>";
        var xmlstr="<?xml version='1.0' encoding='UTF-8' ?><!--By Supcan Report --><Report><WorkSheet name='Sheet'><Properties><BackGround bgColor='#FFFFFF'/><DefaultTD><TD fontIndex='0' textColor='#000000' transparent='true' leftBorder='1' topBorder='1' leftBorderColor='#C0C0C0' leftBorderStyle='solid' topBorderColor='#C0C0C0' topBorderStyle='solid' decimal='2' align='left' vAlign='middle' isProtected='false' isThousandSeparat='true' isRound='true' isPrint='true'/></DefaultTD><Other isShowZero='true' isRefOriPrecision='true' LineDistance='0' isRowHeightAutoExtendAble='true'/></Properties><Fonts><Font faceName='华文宋体' charSet='134' height='-14' weight='400' pitchAndFamily='2' quality='1' outPrecision='3' clipPrecision='2'/><Font faceName='华文宋体' charSet='134' height='-16' weight='400' pitchAndFamily='2' quality='1' outPrecision='3' clipPrecision='2'/><Font faceName='华文宋体' charSet='134' height='-19' weight='700' pitchAndFamily='2' quality='1' outPrecision='3' clipPrecision='2'/></Fonts><Table><Col width='233'/><Col width='246'/><Col width='140'/><Col width='140'/><Col width='140'/><Col width='167'/><Col width='15'/><TR height='50' sequence='0'><TD col='0' fontIndex='2' align='center'>"+title+"</TD><TD col='6' topBorder='0'/></TR><TR height='35' sequence='1'><TD col='0' fontIndex='1' topBorder='0'>单位："+unit+"</TD><TD col='2' leftBorder='0' topBorder='0'/><TD col='6' topBorder='0'/></TR><TR height='35' sequence='2'><TD col='0' fontIndex='1' bgColor='#FFC080' align='center' datatype='1' formula='=headrow(&apos;ds1&apos;)'>"+columnValue1+"</TD><TD col='1' fontIndex='1' bgColor='#FFC080' align='center' datatype='1'>"+columnValue2+"</TD><TD col='2' topBorder='0'/><TD col='6' topBorder='0'/></TR><TR height='35' sequence='3'><TD col='0' fontIndex='1' align='center' datatype='1' formula='=datarow(&apos;ds1&apos;)'/><TD col='1' fontIndex='1' align='center' datatype='1'/><TD col='6' topBorder='0'/></TR><TR height='35' sequence='4'><TD col='0' fontIndex='1' align='center' datatype='1'/><TD col='1' fontIndex='1' align='center' datatype='1'/><TD col='2' leftBorder='0' topBorder='0'/><TD col='6' topBorder='0'/></TR></Table><Merges><Range row1='1' col1='0' row2='1' col2='1'/><Range row1='2' col1='2' row2='3' col2='5'/><Range row1='0' col1='0' row2='0' col2='5'/><Range row1='1' col1='2' row2='1' col2='5'/><Range row1='4' col1='0' row2='4' col2='1'/><Range row1='4' col1='2' row2='4' col2='5'/></Merges><GraphicObjects><Chart alpha='255' isTransparent='false' borderThick='1' borderColor='#000000'><Rect x1='502' y1='89' x2='1038' y2='472'/><Properties bgColorContext='#FFFFFF' bgColor='#FFFFFF' Overflow='1' Exp='Type=4;IsRevert=1;DataExp1=4;DataExp2=B;Meaning1=4;Meaning2=A;MeaningPos=1;' MD5='af79f877d8eed8eab6aea9ef6d20c885'>ARYCAAB9AQAABwAAAAAAAAACAAAAAAAAABwKAAAAlgAAAAcAAAAHAAAAdgEAAA8CAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP**********CAAAABkAAAAHAAAABwAAAHYBAAAPAgAAEQAAAB4AAABbAQAADwIAAB4AAABbAQAAAAAAAABAb0AAAAAAAEBvQAAAAAAAAAAAgAAAAAYBAAAAAP****8AAAAAAgAAADAACAAAAGEAdQB0AG8ACgE=</Properties><Font faceName='Microsoft YaHei UI' charSet='134' height='-12' weight='400'/></Chart></GraphicObjects><PrintPage><Paper><Margin left='19' top='25' right='19' bottom='25'/></Paper><Page isIgnoreValidBorder='false'><PageCode><Font faceName='Microsoft YaHei UI' charSet='134' height='-14' weight='400'/></PageCode></Page></PrintPage></WorkSheet><DataSources Version='255' isAutoCalculateWhenOpen='false' isSaveCalculateResult='false'><DataSource type='4'><!-- Desc: Supcan Report Component DataSource Specification --><Data><ID>ds1</ID><Version>2</Version><Type>4</Type><TypeMeaning>JSON</TypeMeaning><Source>resource/supcan1.0.95.0/reportdata/AF_zyl_qg_02.json</Source><XML_RecordAble_Nodes><Node><name>jsonobject</name></Node></XML_RecordAble_Nodes><Columns><Column><name>jsonobject\\"+columnValue1+"</name><text>"+columnValue1+"</text><type>string</type><visible>true</visible><sequence>1</sequence></Column><Column><name>jsonobject\\"+columnValue2+"</name><text>"+columnValue2+"</text><type>string</type><visible>true</visible><sequence>2</sequence></Column></Columns></Data></DataSource></DataSources></Report>";
        return xmlstr;
    },
    report_data:function () {
        var data=this.data;
        return data;
    },
    chart_data:function () {
        var a=this.data;
        var data={
            "title":"",
            "xName":"",
            "xAxis":[],
            "yName":"",
            "yAxis":[]
        }
        data.title=this.title;
        data.xName=this.xName;
        data.yName=this.yName;
        for (var dataID in a){
            for(var i=0;i<a[dataID].length;i++){
                var num=0;
                for(var j in a[dataID][i]){
                    if(num==0){
                        data.xAxis.push(a[dataID][i][j]);
                    }else{
                        data.yAxis.push(a[dataID][i][j]);
                    }
                    num++;
                }
            }
        }
        return data;
    }
}