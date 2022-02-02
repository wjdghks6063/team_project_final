<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../common_header_yw.jsp" %>

	<!-- sub contents -->
<c:if test="${empty session_id}">
	<script type="text/javascript">
 	alert("잘못된 접근입니다. 로그인해 주십시오.");
	location.href="Index";
 	</script>
</c:if>	
<script type="text/javascript">
	function goSave(){
		
		if(checkValue(qna.t_q_title,"제목을 쓰시오")) return;
		if(checkValue(qna.t_q_content,"내용을 쓰시오")) return;
		
		qna.method="post";
		qna.action="Qna";
		qna.submit();
	}
	//리스트로
	function goList(){
		list.t_gubun.value="List";
		list.method="post";
		list.action="Qna";
		list.submit();
				
	}
</script>
<!--서브 헤더 -->
	<div class="sub-header sub-header-notice">
		<h1 class="sub-title"><span class="text">Qna</span></h1>
		<span class="deco-box"><i class="deco-1"></i><i class="deco-2"></i></span>

		
	</div>

<form name="list">
	
	<input type="hidden" name="t_gubun">

</form>
<div class="tab-3" data-swipe='{"type":"case1","start":".active"}'>
			<ul>
				<li data-act='tab' class="item"><a href="Notice"><span class="in">공지사항</span></a></li>
				<li data-act='tab' class="item"><a href="FAQ"><span class="in">빠른답변</span></a></li>
				<li data-act='tab' class="item active"><a href="Qna"><span class="in">질의응답</span></a></li>
				
			</ul>
		</div>


<div class="sub-write">
			
	 <div class="write_wrap">
	  <h2 class="sr-only">질문과 답변 글쓰기</h2>
	  
	  <!-- action을 처리하기전에 check()사용자 함수를 실행하고 되돌아 와라-->
			<table class="bord_table">
				<caption class="sr-only">공지사항 입력 표</caption>
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">				
				</colgroup>
				<tbody>
			<form name="qna">
			<input type="hidden" name="t_gubun" value="Write">
			<input type="hidden" name="t_id" value="${session_id}">	
					<tr class="first">
						<th>글쓴이</th>
						<td colspan="3">${session_name}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" name="t_q_title" value="${t_dto.getQ_title()}"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea name="t_q_content">${t_dto.getQ_content()}</textarea></td>
					</tr>
					<tr>
						<th>비공개 여부</th>
						<td>
						<input type="radio" name="t_secret" value="y" <c:if test="${t_secret eq 'y'}">checked</c:if>>비밀글
						<input type="radio" name="t_secret" value="n" <c:if test="${t_secret eq 'n'}">checked</c:if>>일반글
						</td>
						<th>등록 날짜</th>
						<td>${t_dto.getQ_reg_date()}</td>
					</tr>
			</form>		
				</tbody>
			</table>
			
		
	  </div>
			</form>
								<input type="button" onclick="goSave()" value="수 정" class="btn" style="background-color:#f0f0f0;font-family: 'Dongle';">
								<input type="button" onclick="goList()" value="목 록"class="btn" style="background-color:#f0f0f0;font-family: 'Dongle';">
</div>
			
<style>

.sr-only {position:absolute; top:0; left:0; width:0; height:0; font-size:0; overflow:hidden;}
.w100 {width:100%;}
.clearfix {content:""; display:block; clear:both;}
.complet {background:#8893ab; color:#fff;padding:5px 8px;}
ul, ol {list-style:none;}
a {text-decoration:none; color:#333;}
body {font-family:나눔고딕; color:#333;}
header, nav, section, article, footer {display:block;}
h1,h2,h3,h4,h5,h6 {font-weight:normal; font-size:16px;}

.search_wrap {margin-top:100px;}
.record_group {float:left;}
.search_group {float:right;}
.record_group span {color:#007dc6;}
.search_group .select {height:44px; width:70px; border:1px solid #e0e0e0; padding:5px;}
.search_group .selectq {height:44px; width:140px; border:1px solid #e0e0e0; padding:5px;}
.search_group .search_word {height:44px; border:1px solid #e0e0e0; padding:5px; width:220px;}
.search_group .btn_search {height:44px; padding:5px 15px; border:1px solid #e0e0e0; background:transparent;} /*투명하게*/

.bord_list {clear:both; padding-top:40px;}
.bord_table {width:100%;}
.bord_list th {border-top:1px solid #333;border-bottom:1px solid #333; padding:15px 5px;}
.bord_table td {border-bottom:1px solid #e0e0e0; padding:15px 5px; text-align:center;}
.bord_table td.title {text-align:left;}

.write_wrap {margin-top:100px;}
.write_wrap th,.write_wrap td {padding:10px;border-bottom:1px solid #ddd;}
.write_wrap th {background:#f7f8fc;}
.write_wrap .first th,.write_wrap .first td {border-top:1px solid #333;}
.write_wrap td {text-align:left;}
.write_wrap input,.write_wrap textarea {border:1px solid #dcdcdc; height:33px; width:100%;}
.write_wrap textarea {height:270px;}
.write_wrap .btn_wrap {padding-top:30px; text-align:center;}
.write_wrap .btn_wrap .btn_ok {width:60px; background:#007dc6; border:0 none; color:#fff;}
.write_wrap .btn_wrap .btn_reset {width:70px;background:#F78181; border:0 none; color:#fff;}
.write_wrap .btn_wrap .btn_list {width:70px;background:#F78181; border:0 none; color:#fff;}

.complet {background:#8893ab; color:#fff;padding:5px 8px;}
.waiting {background:#0489B1; color:#fff;padding:5px 8px;}

</style>			

<%@ include file = "../common_footer.jsp" %>
