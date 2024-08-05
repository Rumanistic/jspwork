/**
 * 
 */

 	logout = () => {

		location.href = "index.jsp";
	}
	
	let i = $.ajax({
		
	});
	
	updateTimer = () => {
		let min = Math.floor(i/60);
		let sec = i%60;
		
		sec = sec < 10 ? '0' + sec : sec;
		let curTime = min + ":" + sec;
		$("#timer").text(curTime);
		i--;
		
		if(i < 0){
			clearInterval(expireCounter);
			alert("세션 만료로 로그아웃 되었습니다.");
			logout();
		}
	}
	
	$(() => {
		$("button[name='timerReset']").click(() => {
		})
		
		adjustBodyHeight();
	})
	
	adjustBodyHeight = () => {
        let footerHeight = $("footer").outerHeight();
        $("body").css("height", `calc(100% - ${footerHeight}px)`);
    };

    $(window).on('resize', () => {
        adjustBodyHeight();
    });
	
	let expireCounter = setInterval(updateTimer, 1000);