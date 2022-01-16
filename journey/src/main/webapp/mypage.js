function deleteCheck(form){

	var result = window.confirm("정말 탈퇴하시겠습니까?");
	const pwCheck = form.pwCheck.value;
	const pw = form.pw.value;
	
	if(result){
		if(pwCheck === pw){
			form.submit();
			alert("탈퇴되었습니다");
			return true;
		}
		else{
			alert("잘못된 비밀번호입니다.");
			return false;
		}
	}
	else
		return false;
	
}

$(`#changeBtn`).click(function(){
	
	var result = window.confirm("수정하시겠습니까?");
	
	if(result)
		return true;
	else
		return false;
	
});