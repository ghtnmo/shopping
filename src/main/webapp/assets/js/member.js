﻿
 function check(){
	 if($.trim($("#mem_id").val())==""){
		 alert("회원아이디를 입력하세요!");
		 $("#mem_id").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_pwd").val())==""){
		 alert("회원비번을 입력하세요!");
		 $("#mem_pwd").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_pwd_re").val())==""){
		 alert("회원비번확인을 입력하세요!");
		 $("#mem_pwd_re").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_pwd").val()) != $.trim($("#mem_pwd_re").val())){
		 //!=같지않다 연산. 비번이 다를 경우
		 alert("비번이 다릅니다!");
		 $("#mem_pwd").val("");
		 $("#mem_pwd_re").val("");
		 $("#mem_pwd").focus();
		 return false;
	 }
	 if($.trim($("#mem_name").val())==""){
		 alert("회원이름을 입력하세요!");
		 $("#mem_name").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_phone2").val())==""){
		 alert("휴대전화번호를 입력하세요!");
		 $("#mem_phone2").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_phone3").val())==""){
		 alert("휴대전화번호를 입력하세요!");
		 $("#mem_phone3").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_email1").val())==""){
		 alert("메일 아이디를 입력하세요!");
		 $("#mem_email1").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_email2").val())==""){
		 alert("메일 주소를 입력하세요!");
		 $("#mem_email2").val("").focus();
		 return false;
	 }	 	 
 }

/* 아이디 중복 체크*/
function id_check(){
	$("#idcheck").hide();//idcheck span 아이디 영역을 숨긴다.
	var memid=$("#mem_id").val();
	
	//1.입력글자 길이 체크
	if($.trim($("#mem_id").val()).length < 4){
		var newtext='<font color="red">아이디는 4자 이상이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);//span 아이디 영역에 경고문자 추가
		$("#mem_id").val("").focus();
		return false;
	};
	if($.trim($("#mem_id").val()).length >12){
		var newtext='<font color="red">아이디는 12자 이하이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);//span 아이디 영역에 경고문자 추가
		$("#mem_id").val("").focus();
		return false;
	};
	//입력아이디 유효성 검사
	if(!(validate_userid(memid))){
		var newtext='<font color="red">아이디는 영문소문자,숫자,_ 조합만 가능합니다.</font>';
		$("#idcheck").text('');//문자 초기화
		$("#idcheck").show();//span 아이디 영역을 보이게 한다.
		$("#idcheck").append(newtext);
		$("#mem_id").val("").focus();
		return false;
	};
	

	//아이디 중복확인
    $.ajax({
        type:"POST",
        url:"member_idcheck.nhn",
        data: {"memid":memid},        
        success: function (data) { 
        	alert("return success="+data);
      	  if(data==1){	//중복 ID
      		var newtext='<font color="red">중복 아이디입니다.</font>';
      			$("#idcheck").text('');
        		$("#idcheck").show();
        		$("#idcheck").append(newtext);
          		$("#mem_id").val('').focus();
          		return false;
	     
      	  }else{	//사용 가능한 ID
      		var newtext='<font color="blue">사용가능한 아이디입니다.</font>';
      		$("#idcheck").text('');
      		$("#idcheck").show();
      		$("#idcheck").append(newtext);
      		$("#mem_pwd").focus();
      	  }  	    	  
        }
        ,
    	  error:function(e){
    		  alert("data error"+e);
    	  }
      });//$.ajax	
};
/*아이디 중복 체크 끝*/

function validate_userid(memid)
{
  var pattern= new RegExp(/^[a-z0-9_]+$/);
  //영문 소문자,숫자 ,_가능,정규표현식
  return pattern.test(memid);
};
 
function domain_list() {
	 var num=f.mem_email3.selectedIndex;
	/*selectedIndex속성은 select객체하위의 속성으로서 해당리스트 목록번호를 반환
	*/
	if ( num == -1 ) {
	//num==-1은 해당 리스트목록이 없다
	return true;
	 }
	 if(f.mem_email3.value=="0") // 직접입력
	 {
	/*리스트에서 직접입력을 선택했을때*/
	 f.mem_email2.value="";
	//@뒤의 도메인입력란을 빈공간시켜라.
	 f.mem_email2.readOnly=false;
	//@뒤의 도메인입력란을 쓰기 가능
	f.mem_email2.focus();
	//도메인입력란으로 입력대기상태
	}
	 
	 else {
	//리스트목록을 선택했을때
	 
	f.mem_email2.value=f.mem_email3.options[num].value;
	/*num변수에는 해당리스트 목록번호가 저장되어있다.해당리스트 번호의 option value값이 도메인입력란에 선택된다.options속성은 select객체의 속성으로서 해당리스트번호의 value값을 가져온다
	*/
	f.mem_email2.readOnly=true;
	 }
 }

 
 /* 회원정보 수정 경고창 */
function edit_check(){
	if($.trim($("#join_pwd1").val())==""){
		 alert("회원비번을 입력하세요!");
		 $("#join_pwd1").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_pwd2").val())==""){
		 alert("회원비번확인을 입력하세요!");
		 $("#join_pwd2").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_pwd1").val()) != $.trim($("#join_pwd2").val())){
		 //!=같지않다 연산. 비번이 다를 경우
		 alert("비번이 다릅니다!");
		 $("#join_pwd1").val("");
		 $("#join_pwd2").val("");
		 $("#join_pwd1").focus();
		 return false;
	 }
	 if($.trim($("#join_name").val())==""){
		 alert("회원이름을 입력하세요!");
		 $("#join_name").val("").focus();
		 return false;
	 }
	 /*if($.trim($("#join_zip1").val())==""){
		 alert("우편번호를 입력하세요!");
		 $("#join_zip1").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_zip2").val())==""){
		 alert("우편번호를 입력하세요!");
		 $("#join_zip2").val("").focus();
		 return false;
	 }*/
	 if($.trim($("#join_addr1").val())==""){
		 alert("주소를 입력하세요!");
		 $("#join_addr1").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_addr2").val())==""){
		 alert("나머지 주소를 입력하세요!");
		 $("#join_addr2").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_tel2").val())==""){
		 alert("전화번호를 입력하세요!");
		 $("#join_tel2").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_tel3").val())==""){
		 alert("전화번호를 입력하세요!");
		 $("#join_tel3").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_phone2").val())==""){
		 alert("휴대전화번호를 입력하세요!");
		 $("#join_phone2").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_phone3").val())==""){
		 alert("휴대전화번호를 입력하세요!");
		 $("#join_phone3").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_mailid").val())==""){
		 alert("메일 아이디를 입력하세요!");
		 $("#join_mailid").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_maildomain").val())==""){
		 alert("메일 주소를 입력하세요!");
		 $("#join_maildomain").val("").focus();
		 return false;
	 }	 	 
}
 
 












 
 
 
 