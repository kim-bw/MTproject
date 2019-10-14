$(function(){
	getReplyList();	
});//ready

function addReply(){
	alert("insert 리플 들어옴")

	var content=$('#reply').val();
	var city=$('#city').val();
	var select=$('#select').val();
	var num=$('#num').val();
	var id = $('#id').val();
	
	alert("리플은 => "+ content);
	alert("city => "+ city);
	alert("select => "+ select);
	alert("num 게시판의 원글 번호 => "+ num);
	alert("id 는  => "+ id);
	
	$.ajax({
		type: 'Post',
		url : "/reply/insertReply",
		data : {
			r_content:content,
			r_city:city,
			r_select:select,
			r_num:num,
			r_id:id
// r_num이 각 게시판에 적용되는 원글의 번호 임 ? ? 
		},
		success: function(data) {
			if(data.insertreply=="result"){
				location.reload();
			}//if
		}//success			
	});//ajax
};//addReply



function getReplyList(){
	var city =$('#select').val();
	var seq = $('#num').val();
	var select=$('#select').val();
	alert ("select은 =>"+$('#select').val());
	alert ("city는 =>"+$('#city').val());
	alert ("seq는 =>"+$('#num').val());
	
	
	$.ajax({
		type: "get",
		url : "/board/showDetailBoard",
		data : {
			p_city:city,
			p_seq:seq,
			p_select:select
		}
	});//ajax
};//getReplyList
//=========================================
var index1 = 0;
function goAddReply_ReplyForm(index){
	index1=index;
	alert("goAddReply_ReplyForm 들어옴");
	alert("index =>"+index);


	
	$("#addReply-ReplyForm"+index).show();

};//goAddReply_ReplyForm

function addReply_Reply(r_seq,r_root){
	
	alert("insert 리플-리플 들어옴")
	alert("index =>"+ index1);

	var content=$('#reply_reply'+ index1).val();
	var city=$('#city').val();
	var select=$('#select').val();
	var num=$('#num').val();
	var id =$('#id').val();
	
	
	alert("리플은 => "+ content);
	alert("city => "+ city);
	alert("select => "+ select);
	alert("num 게시판의 원글 번호 => "+ num);
	alert("r_seq는 =>" + r_seq);
	alert("r_root는 =>" + r_root);
	alert("id는  =>" + id);
	
	$.ajax({
		type: 'Post',
		url : '/reply/insertReply',
		data : {
			r_content : content,
			r_city : city,
			r_select : select,
			r_num : num,
			r_seq : r_seq,
			r_root : r_root,
			r_id : id
					
// r_num이 각 게시판에 적용되는 원글의 번호 임 ? ? 
		},
		success: function(data) {
			if(data.insertreply=="result"){
				location.reload();
			}//if
		}//success			
	});//ajax
	
};//addReply


//======================================
var index2=0;
function goUpReplyForm(index){
	index2=index;
	alert("goUpReplyForm 들어옴");
	alert("index는 =>"+index);

	
	$("#updateReplyForm"+index).show();
	$("#up_del"+index).hide();
};//upReplys


function UdateReply(r_seq){

	alert("r_seq는 =>"+r_seq);
	alert("index는 =>"+ index2);
	
	var	content = $('#updateReply'+index2).val();
	var	city = $('#city').val();
	var select = $('#select').val();
	var num = $('#num').val();
	
	alert ("content=>"+content);
	alert ("city=>"+city);
	alert ("select=>"+select);
	alert ("num=>"+num);

	$.ajax({
		type: 'Post',
		url : '/reply/updateReply',
		data : {
			r_content:content,
			r_city:city,
			r_select:select,
			r_num:num,
			r_seq : r_seq
		},
		success: function(data) {
			if(data.update=="result"){
				location.reload();
			}//if
		}//success		
	});//ajax
};//updateReply

function deleteReply(r_seq){
	alert("삭제 들어옴")
	
	alert("r_seq는 =>"+r_seq);
	alert("r_city 은 =>"+$('#city').val());	
	$.ajax({
		type: 'Post',
		url : '/reply/deleteReply',
		data : {
			
			r_city:$('#city').val(),
			r_seq : r_seq
		},
		success: function(data) {
			if(data.deletereply=="result"){
				location.reload();
			}//if
		}//success		
	});//ajax
};//updateReply



