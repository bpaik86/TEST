<%@ page contentType="text/html; charset=UTF-8"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>아이디 /비밀번호 찾기 오류</title>

<script>
	window.onload = function(){
		var chk = ${code}
		
		if(chk == -1){
			alert('존재하지 않는 아이디입니다.');
			history.back();
		}
		if(chk == 0){
			alert('비밀 번호가 일치하지 않습니다.');
			history.back();
		}
	}
</script>
</head>
<body>
</body>
</html>