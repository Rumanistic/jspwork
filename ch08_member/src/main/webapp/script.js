isIdExist = (id) => {
	if(id === ""){
		alert("ID를 입력하세요.");
		frm.id.focus();
		return;
	}
	frm.idBtnCheck.value = "idCheck";
	url = "idCheck.jsp?id=" + id;
	window.open(url, "IDCheck", "width=300, height=400");
}

inputIdChk = () => {
	frm.idBtnCheck.value = "idUncheck";
}

signIn = () => {
	if(frm.id.value === ""){
		alert("ID를 입력해주세요");
		frm.id.focus();
		return;
	}
	if(frm.idBtnCheck.value !== "idCheck"){
		alert("ID 중복확인 버튼을 눌러주세요");
		return;
	}
	if(frm.pwd.value === ""){
		alert("비밀번호를 입력해주세요");
		frm.pwd.focus();
		return;
	}
	if(frm.pwd.value !== frm.repwd.value){
		alert("비밀번호가 일치하지 않습니다");
		frm.repwd.value = "";
		frm.repwd.focus();
		return;		
	}
	if(frm.name.value === ""){
		alert("이름을 입력해주세요");
		frm.name.focus();
		return;
	}
	console.log(frm.id.value)
	frm.submit();
}


// api code
findAddr = () => {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            	let roadAddr = data.roadAddress; 	// 도로명 주소
            	let jibunAddr = data.jibunAddress;
            	let addr = '';
            	let extraAddr = '';
            	
            	document.getElementById("postcode").value = data.zonecode;
            	if(data.userSelectedType === 'R'){ // 사용자가 도로명 사용
            		addr = roadAddr;
            	}
            	else {
            		addr = jibunAddr;
            	}
            	if(data.bname !==''){	// 받아온 도로명 주소 혹은 지번 주소 뒤에 이어붙이거나, 따로 쓰기 위해 가져옴
        			extraAddr += data.bname;
        		}
        		if(data.buildingName !==''){
        			extraAddr += ', ' + data.buildingName;
        		}
            	document.getElementById("addr").value = addr;
            	document.getElementById("detailAddr").value = extraAddr;
        }
    }).open();
}