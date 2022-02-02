<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../common_header_yw.jsp" %>

<script>
	function goUpdate(){
		if(checkValue(noti.t_title,"제목을 입력하세요")) return;
		//if(checkValue(dona.t_content,"내용을 입력하세요")) return;
		
		//썸머
		
		var summernoteContent = $('#summernote').summernote('code');
		noti.t_content.value = summernoteContent;		
		
		
		
		if(checkValue(noti.t_attatch,"이미지파일을 첨부하세요")) return;
		
		//첨부파일 검사
		var fileName = noti.t_attatch.value;
		if(fileName !=""){
		var pathFileName = fileName.lastIndexOf(".")+1;    //확장자 제외한 경로+파일명
		var extension = (fileName.substr(pathFileName)).toLowerCase();	//확장자명
		//파일명.확장자
	
		if(extension != "jpg" && extension != "gif" && extension != "png"){
			alert(extension +" 형식 파일은 업로드 안됩니다.이미지 파일만 가능!");
		return;
	}		
}	
		//위에는 확장자 검사!
		// 첨부 용량 체크	
	
		var file = noti.t_attatch;
		var fileMaxSize  = 5;
		if(file.value !=""){
			// 사이즈체크
			var maxSize  = 1024 * 1024 * fileMaxSize;  
			//var maxSize  = 10;  
			var fileSize = 0;

			// 브라우저 확인
			var browser=navigator.appName;
			// 익스플로러일 경우
			if (browser=="Microsoft Internet Explorer"){
				var oas = new ActiveXObject("Scripting.FileSystemObject");
				fileSize = oas.getFile(file.value).size;
			}else {
			// 익스플로러가 아닐경우
				fileSize = file.files[0].size;
			}
			//alert("파일사이즈 : "+ fileSize);

			if(fileSize > maxSize){
				alert(" 첨부파일 사이즈는 "+fileMaxSize+"MB 이내로 등록 가능합니다. ");
			return;
				}	
			}
		noti.method="post";
		noti.action="NoticeUpdate";
		noti.submit();
				
	}
	function goList(){
		list.t_gubun.value="List";
		list.method="post";
		list.action="Notice";
		list.submit();
				
	}

//썸머노트
	$(document).ready(function() {
    $("#summernote").summernote({
        placeholder:'',
		width:850,
        height:300,
        callbacks: {
            onImageUpload:function(files, editor, welEditable){
                for(var i = files.length - 1;i>=0;i--){
                    sendFile(files[i], this);
                }
            }
        }
    });
  
    function sendFile(file, el, welEditable){
        var form_data = new FormData();
        form_data.append('file', file);
        $.ajax({
            data:form_data,
            type:"POST",
            url:'NoticeSummerNoteImgUpload',
            cache:false,
            contentType:false,
            processData:false,
            enctype: 'multipart/form-data',
            success:function(url){

/*				 server.xml 에 path상황에 따라 
 				1. 					
				<Context docBase="spring_dbcp_two_cosmetic" path="/spring_dbcp_two_cosmetic" reloadable="true" source="org.eclipse.jst.jee.server:spring_dbcp_two_cosmetic"/>
				$(el).summernote('editor.insertImage',"/spring_dbcp_two_cosmetic/img/news_summernote/"+$.trim(url));
				2.
				<Context docBase="spring_dbcp_two_cosmetic" path="/" reloadable="true" source="org.eclipse.jst.jee.server:spring_dbcp_two_cosmetic"/>
				$(el).summernote('editor.insertImage',"/img/news_summernote/"+$.trim(url));
								
*/
//                $(el).summernote('editor.insertImage',"/img/news_summernote/"+$.trim(url));
                $(el).summernote('editor.insertImage',"/donaimg/notice_summernote/"+$.trim(url));
            },
            error: function(data) {
                console.log(data);
            }
        });
    }  
    
});
</script>
<form name="list">
	<input type="hidden" name="t_no" value="${t_no}">
	<input type="hidden" name="t_gubun">

</form>
<div class="tab-3" data-swipe='{"type":"case1","start":".active"}'>
			<ul>
				<li data-act='tab' class="item active"><a href="Notice"><span class="in">공지사항</span></a></li>
				<li data-act='tab' class="item"><a href="FAQ"><span class="in">빠른답변</span></a></li>
				<li data-act='tab' class="item"><a href="QnA"><span class="in">질의응답</span></a></li>
				
			</ul>
		</div>


<div class="sub-write">
			
			<form name="noti" enctype="multipart/form-data">
					<h2 class="title2"> 공지사항을 수정해주세요</h2>
				
					<fieldset>
							<input type="hidden" name="t_no" value="${t_no}">
						<input type="hidden" name="t_page">
						<input type="hidden" name="t_gubun" value="NoticeUpdate">
						<input type="hidden" name="t_reg_id" value="manager">
						<input type="hidden" name="t_reg_date" value="${t_dto.getReg_date()}">
						<table class="table">
							<caption><p style="font-size:30px; margin-bottom:20px;">도움이 필요한 이에게 도움의 손길을...</p></caption>
							<colgroup>
								<col width="20%">
								<col width="20%">
								<col width="*">
							</colgroup>
							
							<tr>
								<th><label for="title">제목</label></th>
								<td colspan="2"><input type="text" maxlength='100' name="t_title" id="title" class="title" placeholder="제목을 입력해주세요" style="border:1px solid #333333" value="${t_dto.getTitle()}"></td>
							</tr>
							
							<tr>
								
								<th><label for="cont">기부 내용</label></th>
								
								<td colspan="2"> 
								
								<input type="hidden" name="t_content"> 
									<div id="summernote">${t_dto.getContent()}</div>
								
								</td>
							</tr>
							
	<script type="text/javascript">
	$(function(){					
		function readImage(input) {
		    // 인풋 태그에 파일이 있는 경우
		    if(input.files && input.files[0]) {
		        // 이미지 파일인지 검사 (생략)
		        // FileReader 인스턴스 생성
		        const reader = new FileReader()
		        // 이미지가 로드가 된 경우
		        reader.onload = e => {
		            const previewImage = document.getElementById("preview-image")
		            previewImage.src = e.target.result;
		        }
		        // reader가 이미지 읽도록 하기
		        reader.readAsDataURL(input.files[0])
		    } else {
		    	// 이미지 안올렸으면
				$("#preview-image").attr('src','');
				$("#preview-image").css("display","none");
		    }
		}
		// input file에 change 이벤트 부여
		const inputImage = document.getElementById("file");
		inputImage.addEventListener("change", e => {
			$("#preview-image").css("display","block");
		    readImage(e.target)
		})	
	});	
	</script>
	<style>
	#preview-image{display:none;}
	
	height:300px;
	</style>
							<tr>
								
								<th><label for="file">중요도</label></th>
								<td colspan="2">
									<label><input type="radio"  name="t_important" value="0"  class="tser" checked style="border:1px solid #333333;">&nbsp 보통</label>
									<label><input type="radio"  name="t_important" value="1"  class="tser" style="border:1px solid #333333">&nbsp 중요</label>
									
								
								</td>
								
							</tr>
							<tr>
								
								<th><label for="file">첨부  파일</label></th>
								<td><img style="width: 500px;" id="preview-image"> </td>
								<td>
								<img style="width: 500px;" id="preview-image" >
								<c:if test="${not empty t_dto.getAttatch() }">
								${t_dto.getAttatch()}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								삭제  <input name="del_check_file" type="checkbox" value="${t_dto.getAttatch()}" style="width:15px; height:15px;">
								<br>
								</c:if>
								<input type="hidden" name="t_ori_attatch" value="${t_dto.getAttatch()}">
								<input type="file" name="t_attatch" class="file" id="file" style="border:1px solid #333333">
								
								
								
								
								</td>
							</tr>
							
							

							</table>
					</fieldset>
				</form>
								<input type="button" onclick="goUpdate()" value="수 정 등 록" class="btn" style="background-color:#f0f0f0;font-family: 'Dongle';">
								<input type="button" onclick="goList()" value="목 록"class="btn" style="background-color:#f0f0f0;font-family: 'Dongle';">
			</div>
			
			

<%@ include file = "../common_footer.jsp" %>
