# Zhang Chuhao's Mainpage
<style>
    .content {
        width: 300px;
        height: 300px;
        margin: 0 auto;
    }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="content">
<p id="p1"></p>
<h1>2020.2.13至今已</h1>
<h1 id="h1"></h1>
<p id="p2"></p>
</div>
<title>顺计时</title>
<script>
function Spandays(d1,d2){
var daysList = [
0,
31,
31+28,
31+28+31,
31+28+31+30,
31+28+31+30+31,
31+28+31+30+31+30,
31+28+31+30+31+30+31,
31+28+31+30+31+30+31+31,
31+28+31+30+31+30+31+31+30,
31+28+31+30+31+30+31+31+30+31,
31+28+31+30+31+30+31+31+30+31+30
];
var lDaysList = [
0,
31,
31+29,
31+28+31,
31+28+31+30,
31+28+31+30+31,
31+28+31+30+31+30,
31+28+31+30+31+30+31,
31+28+31+30+31+30+31+31,
31+28+31+30+31+30+31+31+30,
31+28+31+30+31+30+31+31+30+31,
31+28+31+30+31+30+31+31+30+31+30
];

var a_d1 = d1.split("-");
var a_d2 = d2.split("-");
var y1 = a_d1[0];
var y2 = a_d2[0];
var m1 = a_d1[1];
var m2 = a_d2[1];
var ds1 = a_d1[2];
var ds2 = a_d2[2];
if(y1 % 4 !== 0){
	var re_ds1 = 365 - (Number(daysList[m1-1]) + Number(ds1));
	var re_ds2 = Number(daysList[m2-1]) + Number(ds2);
}else{
	var re_ds1 = 366 - (Number(lDaysList[m1-1]) + Number(ds1));
	var re_ds2 = Number(lDaysList[m2-1]) + Number(ds2);
}
var re_ds3 = (y2-y1-1)*365;
var re_days = Number(re_ds3)+Number(re_ds1)+Number(re_ds2);
return(re_days);
}
setInterval(function (){
var date = new Date();
var mainDate = date.getFullYear()+"-"+(Number(date.getMonth())+1)+"-"+date.getDate();
var spanDay = Spandays("2020-2-13",mainDate);
if((spanDay-1)%365===0)
	document.getElementById("p1").innerHTML = (spanDay/365) + "年前的今天，你们相识了。";
//Eggs
if(spanDay-1==520){
	document.getElementById("p1").innerHTML = "zch2020年3月29号写的程序：久违的第520天到了！！！";
}
if(spanDay-1==1314){
	document.getElementById("p1").innerHTML = "zch2020年3月29号写的程序：久违的第1314天到了！！！";
}
//Eggsend
var y = (spanDay/365).toFixed(2);
var mt = (spanDay/30).toFixed(2);
var h = date.getHours();
var m = date.getMinutes();
var s = date.getSeconds();
spanDay = (spanDay-1) + "日" + h + "时" + m + "分" + s + "秒";
document.getElementById("h1").innerHTML = spanDay;
document.getElementById("p2").innerHTML = "约" + y + "年，" + mt + "月";
},1000);
</script>
