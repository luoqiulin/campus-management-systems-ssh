			var code = new Array(50);
			code[0]="2UNN";
			code[1]="3FDC";code[2]="43WJ";code[3]="47NA";code[4]="4MJM";code[5]="5CF5";code[6]="5CLL";code[7]="5NVP";code[8]="6UYY";code[9]="7AS3";code[10]="7P3E";
			code[11]="7UKK";code[12]="8983";code[13]="A3F3";code[14]="ACS3";code[15]="AQWE";code[16]="BWXQ";code[17]="D6F6";code[18]="D8J4";code[19]="F3KF";code[20]="FEUF";
			code[21]="FWXL";code[22]="G8QB";code[23]="HAW8";code[24]="HCQN";code[25]="HQV3";code[26]="JGYG";code[27]="KK4G";code[28]="L39A";code[29]="LC8D";code[30]="MJX7";
			code[31]="N57V";code[32]="NQYE";code[33]="PFTF";code[34]="PKSS";code[35]="QVGU";code[36]="R4K6";code[37]="RLTF";code[38]="SGD8";code[39]="T8Y6";code[40]="TWLH";
			code[41]="UV97";code[42]="VWM9";code[43]="W3YM";code[44]="WA57";code[45]="XWBT";code[46]="Y2MC";code[47]="YC2E";code[48]="YJFL";code[49]="YLAY";
			var i ;
			
			window.onload = function init(){
				i = Math.floor(Math.random()*49);
				document.getElementById("codeImg").src="code/"+code[i]+".jpg";
			}
			function changeCode(){
				i = Math.floor(Math.random()*49);
				document.getElementById("codeImg").src="code/"+code[i]+".jpg";
				
			}