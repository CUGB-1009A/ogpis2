var nstd_ie = 0;
var nstd_mo = 0;
function procxml(xml)
{
 if(xml=="") return "";
 if(xml.charAt(0)=='?') return xml;
 if(xml.charAt(0)=='/') return '/<b><font color=#0055cc>' +xml.substring(1) + '</font></b>';
 rets = '<b><font color=#0055cc>';
 for(i=0; i<xml.length; i++) {
  var chr = xml.charAt(i);
  if(chr==' ' || chr=='/' || chr=='&') break;
 }
 return rets + xml.substring(0, i) + '</font></b>' + xml.substring(i);
}
function procpures(s, xml)
{
 if(xml==false) return s;
 var rets="";
 while(true) {
  off1 = s.indexOf('&lt;');
  if(off1==-1) break;
  off2 = s.indexOf('&gt;');
  if(off2==-1) break;
  if(off1>off2) break;
  rets += s.substring(0, off1+4);
  rets += procxml(s.substring(off1 + 4, off2));
  rets += s.substring(off2, off2+4);
  s = s.substring(off2+4);
 };
 return rets + s;
}
function as(x, xml, mxchrs)
{
 var rt="";
 var arr=x.innerHTML.split(/\r?\n/);
 var nInN=0;
 var crossclr=false;

 mxchrs=parseInt(mxchrs);
 for(ln=0; ln<arr.length; ln++) {
  var sbg='';
  if(mxchrs>0) crossclr=!crossclr;
  if(crossclr) sbg=' bgColor="#ffff55"';
  s = '<tr><td align=center' +sbg+ ' class="program" style="color:#0055ee;border-left:0px solid #ffffff">';
  s += (ln+1) + '.</td><td class="program" ' +sbg+ '>';
  var ths=arr[ln];

  //break
  if(mxchrs>0)
   if(ths.length>mxchrs)
    for(i=mxchrs-1; i>0; i--) {
     if(ths.charAt(i)==' ') {
      ths = ths.substring(0, i) + "<br>" + ths.substring(i+1);
      break;
     }
    }

  //replace space
  var bgn=ths.search(/[^ ]/);
  if(bgn>0) {
   var nbsps='';
   for(i=0; i<bgn*2; i++) nbsps = '&nbsp;' + nbsps;
   ths=nbsps+ths.substring(bgn);
  }

  if(nInN != 0) {
   var off = (nInN==1) ? ths.indexOf('--&gt;') : ths.indexOf('*/');
   s+=procnts(ths, nInN, off, xml);
   if(off!=-1) bInN=0;
  }
  else {	/*** nInN==0 ***/
   var sright = null;
   var lind = 0;
   while(true) {
    lind = ths.indexOf("//", lind);
    if(lind==-1) break;
    sright = ths.substring(lind);
    ths = ths.substring(0, lind);
	if(ths.length==0) break;
 	if(ths.charAt(lind-1)!=':') break;
    ths = ths + sright;
	sright = null;
	lind += 2;
   }
   
   if(sright==null) {
    off = ths.indexOf('&lt;!--');
    if(off==-1) {
     off = ths.indexOf('/*');
     if(off!=-1) nInN=2;
    }
    else
     nInN=1;

    if(nInN==0) s += procpures(ths, xml);
    else {
     s+= procpures(ths.substring(0, off), xml);
     ths = ths.substring(off);
     off = (nInN==1) ? ths.indexOf('--&gt;') : ths.indexOf('*/');
     s+= procnts(ths, nInN, off, xml);
     if(off!=-1) nInN=0;
    }
   }
   else {
    s += procpures(ths, xml);
    s += '<font color=#008800>' + sright + '</font>';
   }
  }

  s+= '</td></tr>';
  rt+=s;
 }
 rt = '<table cols=1 width=98% cellpadding=0 cellspacing=0 border=1 style="border:#aaaaaa solid 1px" align="center"><tr><td><table class="programTable" cols=2 width=100% cellpadding=2 cellspacing=0 border=0><col width=35><col>' + rt + '</table></td></tr></table>';
 x.innerHTML=rt;
}
function procnts(ths, nInN, off, xml)
{
 var s="";
 if(off==-1)
  s+= '<font color=#008800>' + ths + '</font>';
 else {
  off += (nInN==1)? 6:2;
  s+= '<font color=#008800>' + ths.substring(0, off) + '</font>';
  s+= procpures(ths.substring(off), xml);
 }
 return s;
}
function chan(ang)
{
 if(ang==315) return "100% 100%,0% 0%";
 else if(ang==270) return "100% 0%,0% 0%";
 else if(ang==225) return "100% 0%,0% 100%";
 else if(ang==180) return "0% 0%,0% 100%";
 else if(ang==135) return "0% 0%,100% 100%";
 else if(ang==90) return "0% 0%,100% 0%";
 return "0% 100%, 0% 0%";
}
function nstd()
{
 var agt = navigator.userAgent.toLowerCase();
 var off = agt.indexOf("msie");
 if(off>=0) {
  var s=agt.substring(off+4);
  off=s.indexOf('.');
  if(off>0)
   nstd_ie=parseInt(s.substring(0, off));
  else
   nstd_ie=7;
  if(nstd_ie == 10) {
   nstd_ie=0;
   nstd_mo=0;
  }
 }
 else if(agt.indexOf("chrome")>=0)
  nstd_mo=1;

 //png=============
 var nstd_tag = document.getElementsByTagName("div");
 for(nsi=0; nsi<nstd_tag.length; nsi++) {
  var x = nstd_tag[nsi];
  var item=x.attributes.getNamedItem("class");
  if(item==null) continue;
  if(item.nodeValue!='png') continue;
  item.nodeValue=null;

  item= x.attributes.getNamedItem("src");
  if(item==null) continue;
  var src=item.nodeValue;
  if(src==null) continue;
  if(src=='') continue;
  item.nodeValue=null;

  if(nstd_ie==6) {
   var s='<div style="position:relative;width:100%;height:100%;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src=' +src+ ');"></div>';
   x.innerHTML=s;
  }
  else {
   var nimg=document.createElement('IMG');
   nimg.setAttribute('SRC', src);
   x.appendChild(nimg);
  }
 }

 //pre=============
 nstd_tag=document.getElementsByTagName("pre");
 for(nsi=0; nsi<nstd_tag.length; nsi++) {
  var x=nstd_tag[nsi];
  var item=x.attributes.getNamedItem("class");
  if(item==null) continue;
  var stp=item.nodeValue;

  var mxchrs=0;
  item=x.attributes.getNamedItem("maxchars");
  if(item!=null) mxchrs=item.nodeValue;
  if(stp=='cpp' || stp=='xml') as(x, stp=='xml', mxchrs);
 }

 //td =============
 nstd_tag = document.getElementsByTagName("td");
 for(nsi=0; nsi<nstd_tag.length; nsi++) {
  var x=nstd_tag[nsi];
  var item=x.attributes.getNamedItem("class");
  if(item==null) continue;

  var nstd_clsname=item.nodeValue;
  if(nstd_clsname==null) continue;
  if(nstd_clsname.substring(0, 5) !='round') continue;

  //size
  var nstd_height=0, nstd_width=0;
  item= x.attributes.getNamedItem("height");
  if(item!=null) nstd_height = item.nodeValue;
  item= x.attributes.getNamedItem("width");
  if(item!=null) nstd_width = item.nodeValue;
  if(nstd_height==null || nstd_width==null) continue;
  if(nstd_height==0 || nstd_width==0) continue;

  //round
  var bLeft=true, bRight=true;
  item= x.attributes.getNamedItem("round");
  if(item!=null) {
   if(item.nodeValue.indexOf('left')==-1) bLeft=false;
   if(item.nodeValue.indexOf('right')==-1) bRight=false;
  }

  //arcsize
  var arcsz = "5%";
  item= x.attributes.getNamedItem("arcsize");
  if(item!=null) arcsz= item.nodeValue;

  //colors
  var clrHi="#e0edfd", clrLo="#9abee0", clrLine="#6792b4";
  item= x.attributes.getNamedItem("fillColor");
  if(item!=null) {
   var fclrs= item.nodeValue;
   if(fclrs != "") {
    var off= fclrs.indexOf(',');
    if(off==-1)
     clrHi=clrLo=round_cls;
    else {
     clrHi=fclrs.substring(0, off);
     clrLo=fclrs.substring(off+1);
    }
   }
  }
  item=x.attributes.getNamedItem("lineColor");
  if(item!=null) clrLine=item.nodeValue;

  //line thick
  var lineThick=1;
  item=x.attributes.getNamedItem("lineThick");
  if(item!=null) lineThick=item.nodeValue;

  //fill Angle
  var fillAngle=45;
  item=x.attributes.getNamedItem("fillAngle");
  if(item!=null) fillAngle=item.nodeValue;
  if(nstd_ie==0 && fillAngle>0) fillAngle=360-fillAngle;

  //main
  if(nstd_clsname=='round')
   gwround(x, bLeft, bRight, clrHi, clrLo, clrLine, lineThick, fillAngle, nstd_width, nstd_height, arcsz);
  else
   gwroundtop(x, bLeft, bRight, clrHi, clrLo, clrLine, lineThick, fillAngle, nstd_width, nstd_height);
 }
}
function gwroundtop(x, bLeft, bRight, clr1, clr2, clrLine, lineThick, fillAngle, w, h)
{
 var rt, s1, s2, s=x.innerHTML;
 var off = s.indexOf('<br>');
 if(off==-1) off = s.indexOf('<BR>');
 if(off==-1) {
  s1="";
  s2=s;
 }
 else {
  s1=s.substring(0, off);
  s2=s.substring(off+4);
 }
 var off1=s2.search(/<pre/i);
 if(off1>=0) {
  var off2=s2.search(/<\/pre>/i);
  if(off2>=0) {
   var ks1=s2.substring(0, off1);
   var ks2=s2.substring(off1+5, off2);
   var ks3=s2.substring(off2+6);
   s2 = ks1+ks2.replace(/\r?\n/g, '<BR>')+ ks3;
  }
 }
 s2 = '<table cellpadding=5 cols=1 width=100% height=100% border=0><tr><td>' +s2 + '</td></tr></table>';

 if(nstd_ie>0) {
  var asize='20';
  if(bLeft==false && bRight==false) asize='0';
  var ss ='stroked="f"';
  if(lineThick>0) ss = 'strokecolor="' +clrLine+ '" strokeweight="' +lineThick+ 'pt"';
  rt= '<v:RoundRect ' +ss+ ' fillcolor="' +clr1+ '" style="position:relative;padding-top:5px;width:' +w+ ';height:32;" arcsize="' +asize+ '%">';
  rt+= '<v:Fill angle=180 type="gradient" color2="' +clr2+ '"/>';
  rt+= s1 + '<br>&nbsp;';
  rt+= '</v:RoundRect>';
  rt+= '<v:Rect ' +ss+ ' fillcolor="' +clr1+ '" style="position:relative;top:-17;left:0;width:' +w+ ';height:' +(h-28)+ ';">';
  rt+= '<v:Fill angle=' +fillAngle+ ' type="gradient" color2="' +clr2+ '"/>' + s2 + '</v:Rect>';
 }
 else {
  rt= '<div style="position:relative;width:100%;height:22px;border:' +lineThick+ 'px solid ' +clrLine+ ';padding-top:4px;';
  if(bLeft)  rt+= 'border-top-left-radius:9px;';
  if(bRight) rt+= 'border-top-right-radius:9px;';
  if(nstd_mo==0)
   rt+= 'background:#dddddd; background-image:linear-gradient(180deg, ' +clr1+ ', ' +clr2+ ');">';
  else
   rt+= 'background:#dddddd; background-image:-webkit-gradient(linear,' +chan(180) + ', from(' +clr1+ '), to(' +clr2+ ') );">';
  rt+= s1+ '</div>';
  rt+= '<div style="position:relative;width:100%;height:' +(h-29)+ 'px; top:-1px;border:' +lineThick+ 'px solid ' +clrLine+ ';';
  if(bRight==false) rt+= 'border-bottom-right-radius:9px;';
  if(nstd_mo==0)
   rt+= 'background:#eeeeee; background-image:linear-gradient(' +fillAngle+ 'deg, ' +clr1+ ', ' +clr2+ ');">' +s2 + '</div>';
  else
   rt+= 'background:#eeeeee; background-image:-webkit-gradient(linear,' +chan(fillAngle)+ ', from(' +clr1+ '), to(' +clr2+ ') );">' +s2 + '</div>';
 }
 x.innerHTML = rt;
}
function gwround(x, bLeft, bRight, clr1, clr2, clrLine, lineThick, fillAngle, w, h, arcsz)
{
 var rt;
 if(nstd_ie>0) {
  var ss ='stroked="f"';
  if(lineThick>0) ss = 'strokecolor="' +clrLine+ '" strokeweight="' +lineThick+ 'pt"';
  ss+= ' fillcolor="' +clr1+ '"';

  if(bLeft==false && bRight==false)
   rt= '<v:Rect ' +ss+ ' style="position:relative;left=-1;top=-1;width:' +w+ ';height:' +h+ ';">';
  else
   rt= '<v:RoundRect ' +ss+ ' style="position:relative;width:' +w+ ';height:' +h+ ';" arcsize="' +arcsz+ '">';
  rt+= '<v:fill angle=' +fillAngle+ ' type="gradient" color2="' +clr2+ '"/>';
  rt+= x.innerHTML;
  if(bLeft==false && bRight==false)
   rt+= '</v:Rect>';
  else
   rt+= '</v:RoundRect>';
 }
 else {
  rt= '<div style="position:relative;width:100%;height:100%; border:' +lineThick+ 'px solid ' +clrLine + ';';
  if(bLeft && bRight)
   rt+= 'border-radius:9px;';
  else if(bLeft)
   rt+= 'border-top-left-radius:9px;border-bottom-right-radius:9px;';
  else if(bRight)
   rt+= 'border-top-right-radius:9px;border-bottom-left-radius:9px;';
  if(nstd_mo==0)
    rt+= 'background:#eeeeee; background-image:linear-gradient(' +fillAngle+ 'deg, ' +clr1+ ', ' +clr2+ ');">';
  else
    rt+= 'background:#eeeeee; background-image:-webkit-gradient(linear,' +chan(fillAngle)+ ', from(' +clr1+ '), to(' +clr2+ ') );">';
  rt+= x.innerHTML + '</div>';
 }
 x.innerHTML=rt;
}nstd();