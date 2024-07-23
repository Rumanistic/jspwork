inputCheck = () => {
	if(regForm.id.value === ""){
		alert("아이디를 입력해주세요");
		regForm.id.focus();
		return;
	}
	
	if(regForm.pwd.value === ""){
		alert("비밀번호를 입력해주세요");
		regForm.pwd.focus();
		return;
	}
	
	if(regForm.repwd.value === ""){
		alert("비밀번호 확인을 입력해주세요");
		regForm.repwd.focus();
		return;
	}
	
	if(regForm.repwd.value !== regForm.pwd.value){
		alert("비밀번호 확인을 입력해주세요");
		regForm.repwd.focus();
		return;
	}
	
	if(regForm.name.value === ""){
		alert("이름을 입력해주세요");
		regForm.name.focus();
		return;
	}
	regForm.submit();
}