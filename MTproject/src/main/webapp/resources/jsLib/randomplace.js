function randomPl() {
	
	$.ajax({
		type: 'Post',
		url : "test-goMission",
		success:function(data){
			if(data.pList!=null){
				
				var pList = data.pList;
				//data.pList 배열 객체로 들어옴
				var html="";
				var xlist = new Array();
				var ylist = new Array();
				for(i=0; i<pList.length; i++){
					xlist[i] = pList[i].l_areacode;
					ylist[i] = pList[i].l_location;	
				}

				for (i=0; i<xlist.length; i++){					
					var b =	"<div style='left:"+(xlist[i]-20)+"px; top:"+(ylist[i]-50)+"px; width: 40px; height: 50px; position: absolute;z-index: 1;'>"
								+"<img id='hwasal' src='resources/image/hwa1.png' width='100%' height='100%'>"
								+"</div>"
					html +=b;		
				};
				$(".hwa").empty();	
				$(".hwa").append(html);	
			}//if			
		}//succes
	});//ajax
};	