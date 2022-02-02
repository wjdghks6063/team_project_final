<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../common_header_yw.jsp" %>

<!--서브 헤더 -->
	<div class="sub-header sub-header-notice">
		<h1 class="sub-title"><span class="text">FAQ</span></h1>
		<span class="deco-box"><i class="deco-1"></i><i class="deco-2"></i></span>

		
	</div>
<script>
	function goUpdate(){
		
		if(checkValue(faq.t_title,"제목을 입력하세요")) return;
		if(checkValue(faq.t_content,"내용을 입력하세요")) return;
		
		faq.t_gubun.value="Update";
		faq.method="post";
		faq.action="FAQ";
		faq.submit();
				
	}
	function goList(){
		list.t_gubun.value="List";
		list.method="post";
		list.action="FAQ";
		list.submit();
				
	}

</script>
<form name="list">
	
	<input type="hidden" name="t_gubun">

</form>
<div class="tab-3" data-swipe='{"type":"case1","start":".active"}'>
			<ul>
				<li data-act='tab' class="item"><a href="Notice"><span class="in">공지사항</span></a></li>
				<li data-act='tab' class="item active"><a href="FAQ"><span class="in">빠른답변</span></a></li>
				<li data-act='tab' class="item"><a href="QnA"><span class="in">질의응답</span></a></li>
				
			</ul>
		</div>


<div class="sub-write">
			
			<form name="faq" >
					<h2 class="title2">자주묻는 답변을 수정해주세요</h2>
				
					<fieldset>
						<input type="hidden" name="t_no" value="${t_no}">
						<input type="hidden" name="t_page">
						<input type="hidden" name="t_gubun">
						<input type="hidden" name="t_reg_id" value="manager">
						<table class="table">
							<caption><p style="font-size:30px; margin-bottom:20px;">자주묻는답변을 작성합시다.</p></caption>
							<colgroup>
								<col width="20%">
								<col width="20%">
								<col width="*">
							</colgroup>
							
							<tr>
								<th><label for="title">제목</label></th>
								<td colspan="2"><input value="${t_dto.getTitle()}" type="text" maxlength='100' name="t_title" id="title" class="title" placeholder="제목을 입력해주세요" style="border:1px solid #333333"></td>
							</tr>
							
							
							<tr>
								
								<th><label for="cont"> 내용</label></th>
								
								<td colspan="2"  >
									<textarea name="t_content" style="width:850px;height:300px;" >${t_dto.getContent()}</textarea>
								</td>
							</tr>
							
							
	
	<style>
	#preview-image{display:none;}
	
	height:300px;
	</style>
							<tr>
								
								<th><label for="file">중요도</label></th>
								<td colspan="2">
									<label><input type="radio"  name="t_important" value="0"  class="tser" checked style="border:1px solid #333333;">&nbsp 보통</label>
									<label><input type="radio"  name="t_important" value="1"  class="tser" style="border:1px solid #333333">&nbsp 중요</label>
									<label><input type="radio"  name="t_important" value="2"  class="tser" style="border:1px solid #333333">&nbsp 필수</label>
								
								</td>
								
							</tr>
							
							
							

							</table>
					</fieldset>
				</form>
								<input type="button" onclick="goUpdate()" value="수 정" class="btn" style="background-color:#f0f0f0;font-family: 'Dongle';">
								<input type="button" onclick="goList()" value="목 록"class="btn" style="background-color:#f0f0f0;font-family: 'Dongle';">
			</div>
			
			

<%@ include file = "../common_footer.jsp" %>
