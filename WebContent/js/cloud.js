
// Cloud Float...
    var $main = $cloud = mainwidth = null;
    var offset1 = 450;
	var offset2 = 0;
	var time = new Date().getHours();
	
	var offsetbg = 0;
    
    $(document).ready(
        function () {
            $main = $("#mainBody");
			$body = $("body");
            $cloud1 = $("#cloud1");
			$cloud2 = $("#cloud2");
			
            mainwidth = $main.outerWidth();
           change();

         
        }
    );
	
	function change(){
		time = new Date().getHours();
		 if(time>17||time<6){
    		$("#mainBody").css("background","url(./images/loginbg4.png)");
    	}else{
    		$("#mainBody").css("background","url(./images/loginbg3.png)");
    	}
	}
	
    /// 飘动
    setInterval(function flutter() {
    	var t = new Date().getMinutes();
    	if(t==0){
    		change();
    	}
    	if (offset1 >= mainwidth) {
            offset1 =  -580;
        }
		
        if (offset2 >= mainwidth) {
			 offset2 =  -580;
        }
		
        offset1 += 1.1;
		offset2 += 1;
        $cloud1.css("background-position", offset1 + "px 100px")
		
		$cloud2.css("background-position", offset2 + "px 460px")
    }, 100);
	
	
	setInterval(function bg() {
        if (offsetbg >= mainwidth) {
            offsetbg =  -580;
        }

        offsetbg += 0.9;
        $body.css("background-position", -offsetbg + "px 0")
    }, 90 );
	