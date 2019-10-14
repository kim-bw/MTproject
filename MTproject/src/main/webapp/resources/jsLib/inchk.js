	$(document).ready(function() {
		$('#onsubmit').click(function() {
		


	var m_id=$('#m_id').val();
	var m_password=$('#m_password').val();
	var m_password2=$('#m_password2').val();
	var pLength=m_password.length ;
	var m_name=$('#m_name').val();
	var m_tel=$('#m_tel').val();
	var m_postcode=$('#m_postcode').val();
	var m_roadcode=$('#m_roadcode').val();
	var m_detailAddress=$('#m_detailAddress').val();
	var m_birth=$('#m_birth').val();
	var m_grade=$('#m_grade').val();
	var m_upimage=$('#m_upimage').val();
	
	var passwordRule =  /^[a-zA-Z0-9!@#$%^&*()?_~]{8,16}$/;
	
	if (m_id.length<4) {
		alert('ID 를 4자리이상 정확하게 입력하세요 ~~~') ;
		//$('#id').val('') ;
		$('#m_id').focus();
		return false;
	}
	// id 영문과 숫자만 입력 확인	
	if (m_id.replace(/[a-z.0-9]/gi,'').length>0) {
		alert('ID는 영문과 숫자로만 정확하게 입력하세요 ~~~') ;
		$('#m_id').focus();
		return false;
	}
	
	if (m_password.length < 4) {
		alert('Password 를 4글자 이상 정확하게 입력 하세요 ~~');
		$('#m_password').focus();
		return false;
	} else if(!passwordRule.test($('#m_password').val())) {  
		alert('영문, 숫자, 특수문자 혼합하여 8~16자리 이내로 작성하여 주세요.');
		$('#m_password').focus(); //refocusing
		return false;
	}
	
	// password2 와 동일성 확인 기능 추가
	if (m_password!=m_password2) {
		alert('password1, 2가 다릅니다~~\정확하게 입력하세요 ~~~') ;
		$('#m_password2').focus();
		return false;
	}
		
	if (m_name.length<3) {
		alert('name 을 정확하게 입력하세요 ~~~') ;
		$('#m_name').focus();
		return false;
	} 
	// name: 한글입력  확인
	if (m_name.replace(/[가-힣.a-z]/gi,'').length>0) {
		alert('name은 한글과 영문으로만 정확하게 입력하세요 ~~~') ;
		$('#m_name').focus();
		return false;
	}
		
		
	
	/*
	 	var formData = new FormData();
	 	formData.append("m_id", m_id);
	 	formData.append("m_password", m_password);
	 	formData.append("m_name", m_name);
	 	formData.append("m_tel", m_tel);
	 	formData.append("sample4_postcode", sample4_postcode);
	 	formData.append("sample4_roadAddress", sample4_roadAddress);
	 	formData.append("sample4_detailAddress", sample4_detailAddress);
	 	formData.append("m_birth", m_birth);
	 	formData.append("m_grade", m_grade);
	 	formData.append("m_level", m_level);
	 	formData.append("m_upimage", $("input[name=m_upimage]")[0].files[0]);
	 	*/
	 	var formData = new FormData(document.getElementById('myForm'));
	 	
		$.ajax({
			type: "Post",
			url : "/joinMember",
			data : formData,
			contentType : false,
			processData : false,
			success : function(result) {
				$('#rs').html(result);
			} 
		}) //ajax

		}); //click
	}); // ready


function idCheck() {
	var id=$('#m_id').val();
	
	if (id.length<4) {
		alert('ID 를 4자리이상 정확하게 입력하세요 ~~~') ;
		//$('#id').val('') ;
		$('#m_id').focus();
		return false;
	}
	// id 영문과 숫자만 입력 확인	
	if (id.replace(/[a-z.0-9]/gi,'').length>0) {
		alert('ID는 영문과 숫자로만 정확하게 입력하세요 ~~~') ;
		$('#m_id').focus();
		return false;
	}
  }; // idCheck()
  
//password
function pwCheck() {
	
	if (password.length < 4) {
		alert('Password 를 4글자 이상 정확하게 입력 하세요 ~~');
		$('#m_password').focus();
		return false;
	} else if (password.replace(/[!-*]/g, '').length >= pLength) {
		alert('password는 특수문자를 반드시 입력해야 됩니다 ~~~');
		$('#m_password').focus();
		return false;
	} else if (password.replace(/[!-*.0-9]/g, '').length > 0) {
		alert('password는 숫자와 특수문자로만 정확하게 입력하세요 ~~~');
		$('#m_password').focus();
		return false;
	}
} ; // pwCheck

function idpCheck() {
	
	var id=$('#m_id').val();
	var password=$('#m_password').val();
	
	if (id.length<4) {
		alert('ID 를 4자리이상 정확하게 입력하세요 ~~~') ;
		//$('#id').val('') ;
		$('#m_id').focus();
		return false;
	}
	// id 영문과 숫자만 입력 확인	
	if (id.replace(/[a-z.0-9]/gi,'').length>0) {
		alert('ID는 영문과 숫자로만 정확하게 입력하세요 ~~~') ;
		$('#id').focus();
		return false;
	}
	
	if (password.length < 4) {
		alert('Password 를 4글자 이상 정확하게 입력 하세요 ~~');
		$('#m_password').focus();
		return false;
	} else if (password.replace(/[!-*]/g, '').length >= pLength) {
		alert('password는 특수문자를 반드시 입력해야 됩니다 ~~~');
		$('#m_password').focus();
		return false;
	} else if (password.replace(/[!-*.0-9]/g, '').length > 0) {
		alert('password는 숫자와 특수문자로만 정확하게 입력하세요 ~~~');
		$('#m_password').focus();
		return false;
	}
	
}; //idpcheck