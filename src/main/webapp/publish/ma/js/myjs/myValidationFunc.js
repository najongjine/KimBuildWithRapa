/*사업자 번호 검사 함수*/
function isValidBizNo(num) { 
    var pattern = /([0-9]{3})-?([0-9]{2})-?([0-9]{5})/; 
    if (!pattern.test(num)) return false; 
    num = RegExp.$1 + RegExp.$2 + RegExp.$3;
    var cVal = 0; 
    for (var i=0; i<8; i++) { 
        var cKeyNum = parseInt(((_tmp = i % 3) == 0) ? 1 : ( _tmp  == 1 ) ? 3 : 7); 
        cVal += (parseFloat(num.substring(i,i+1)) * cKeyNum) % 10; 
    } 
    var li_temp = parseFloat(num.substring(i,i+1)) * 5 + '0'; 
    cVal += parseFloat(li_temp.substring(0,1)) + parseFloat(li_temp.substring(1,2)); 
    return (parseInt(num.substring(9,10)) == 10-(cVal % 10)%10) ? true : false; 
}

/*주민번호 검사 함수*/
function isValidJumin(num) {
    var pattern = /^([0-9]{6})-?([0-9]{7})$/; 
	
    if (!pattern.test(num)) return false; 
    num = RegExp.$1 + RegExp.$2;

	var sum = 0;
	var last = num.charCodeAt(12) - 0x30;
	var bases = "234567892345";
	for (var i=0; i<12; i++) {
		if (isNaN(num.substring(i,i+1))) return false;
		sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
	}
	var mod = sum % 11;
	return ((11 - mod) % 10 == last) ? true : false;
}

/*아이디 패턴검사 함수*/
function isValidUserid(val) {
	var pattern = /^[a-z0-9_]{6,16}$/;
	return pattern.test(val) ? true : "id는 8자이상 20자 미만이어야 하고,\n 영문,숫자, _ 문자만 사용할 수 있습니다"
}

/*비밀번호 패턴검사 함수*/
function isValidpass(str) {
	var pattern = /^[a-zA-Z0-9_]{6,16}$/;
	return pattern.test(str) ? true :"비밀번호는 6~16자의 영문,숫자만 사용할 수 있습니다";
}

/*이메일 패턴검사 함수 샘플*/
function isValidEmail(el) {
	var value = el;
	var pattern = /^[_a-zA-Z0-9-\.]+@[\.a-zA-Z0-9-]+\.[a-zA-Z]+$/;
	return pattern.test(value)
}

