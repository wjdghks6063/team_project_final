<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--##### // Visual & LNB #####-->
<%@ include file = "../common_header_yw.jsp" %>


<c:if test="${session_id ne t_dto.getQ_reg_id() && t_dto.getSecret() ne 'n' && session_level ne 'top'}">
	<script type="text/javascript">
		alert("잘못된 접근입니다. 해당 게시글을 읽을 권한이 없습니다.");
		location.href="Qna";
	</script>

</c:if>

<script type="text/javascript">

/*답변 저장*/
function goAnswerSave(){
	if(checkValue(answer.t_answer,"내용을 쓰시오")) return;
	answer.t_gubun.value="AnswerSave";
	answer.method="post";
	answer.action="Qna";
	answer.submit();
}
/*답변 삭제*/
function goAnswerDelete(){
	if(confirm("답변을 삭제하시겠습니까?")){
	answer.t_gubun.value="AnswerDelete";
	answer.method="post";
	answer.action="Qna";
	answer.submit();
}}
/*질문 수정*/
function goQUpdate(){
	answer.t_gubun.value="UpdateForm";
	
	answer.method="post";
	answer.action="Qna";
	answer.submit();
}
/*질문 삭제*/
function goQDelete(){
	if(confirm("질문을 삭제하시겠습니까?")){
		answer.t_gubun.value="Delete";
		answer.method="post";
		answer.action="Qna";
		answer.submit();
}}

//리스트로
	function goList(){
		list.t_gubun.value="List";
		list.method="post";
		list.action="Qna";
		list.submit();
				
	}


</script>
<form name="list">
	<input type="hidden" name="t_no" value="${t_no}">
	<input type="hidden" name="t_gubun" >

	<input type="hidden" name="t_session_id" >
	<input type="hidden" name="t_dum" >
	
	
</form>

<div class="tab-3" data-swipe='{"type":"case1","start":".active"}'>
			<ul>
				<li data-act='tab' class="item"><a href="Notice"><span class="in">공지사항</span></a></li>
				<li data-act='tab' class="item"><a href="FAQ"><span class="in">빠른답변</span></a></li>
				<li data-act='tab' class="item active"><a href="Qna"><span class="in">질의응답</span></a></li>
				
			</ul>
</div>

		<div class="board-view ty-2">
					<div class="board_view">

		  	<h2>[질문] ${t_dto.getQ_title()}</h2>
		  
			<p class="info"><span class="questionn"><i class="fas fa-question-circle"></i></span>
			<span class="user">${t_dto.getQ_reg_id()}</span> | ${t_dto.getQ_reg_date() } | <i class="fa fa-eye"></i> ${t_dto.getHit() }</p>
			<div class="board_body">
				<textarea class="texta" readonly="readonly">${t_dto.getQ_content() }</textarea>
		
			<c:choose>
				<c:when test="${empty t_dto.getA_content()}">
					<p></p>
					<br>
					<p style="font-weight:bold"><span class="waiting">답변대기</span></p>
					<br>
					<hr size=10px; color="#007dc6">
					
				</c:when>
				<c:otherwise>
					<p></p>
					<br>
					<hr size=10px; color="#007dc6">
					<br>
					<p style="font-weight:bold"><span  class="complet">답변완료</span></p>
					<p class="info"><span class="answerr"></span>답변일자 | ${t_dto.getA_reg_date() }</p>
					<textarea class="texta" readonly="readonly">${t_dto.getA_content()}</textarea>
					<hr size=10px; color="#00616b">
				</c:otherwise>
			</c:choose>	
<script type="text/javascript">
//<![CDATA[
$(document).ready(function(){
	$(".answerButt").toggle(function(){
		$(".answerArea").slideDown(500);	
	}, function(){
		$(".answerArea").slideUp(500);
	})
});
//]]>
</script>
<style>
	.answerArea{display:none} 
	.btn_3wrap span {
		padding: 12px 18px;
		display: inline-block;
		
		background-color:#f0f0f0;
		font-family: 'Dongle';
		float: right;
   		font-size:16px;
    	height: 40px;
   		
   		border-radius: 25px;
    	cursor:pointer;
    	margin: 10px;
	}
	.answerArea .textArea_H120{
		padding:5px;
		width:850px;
		height:120px;
		border:1px solid #c0c0c0;
	}	
	.answerArea .saveButt{
		float:right;
		padding: 12px 18px;
		display: inline-block;
		border: 1px solid #878787;
	}	
</style>
				
			<!-- 답변 -->
			<form name="answer">
				<div class="answerArea">
					<input type="hidden" name="t_no" value="${t_dto.getNo() }">
					<input type="hidden" name="t_gubun">
					<input type="hidden" name="t_a_name" value="${t_dto.getA_reg_id() }">
					<br>
					<textarea name="t_answer" class="textArea_H120"></textarea>
					
					<input type="button" onclick="goAnswerSave()" value="답 변 저 장"class="btn" style="background-color:#f0f0f0;font-family: 'Dongle';">
				</div>
			</form>					
			
			</div>
			<div class="btn_3wrap">
					<input type="button" onclick="goList()" value="목 록"class="btn" style="background-color:#f0f0f0;font-family: 'Dongle';">
				<c:choose>	
					<c:when test="${session_id eq t_dto.getQ_reg_id() && empty t_dto.getA_content()}">
							<input type="button" onclick="goQUpdate()" value="수 정" class="btn" style="background-color:#f0f0f0;font-family: 'Dongle';">
							<input type="button" onclick="goQDelete()" value="삭 제"class="btn" style="background-color:#f0f0f0;font-family: 'Dongle';">
					
					</c:when>
					<c:when test="${session_level eq 'top' && empty t_dto.getA_content()}">
					<span class="answerButt">답변하기</span>
					</c:when>
					<c:when test="${session_level eq 'top' && not empty t_dto.getA_content() }">
						
						<input type="button" onclick="goAnswerDelete()" value="답 변 삭 제"class="btn" style="background-color:#f0f0f0;font-family: 'Dongle';">
						<span class="answerButt" >답변 수정</span> 
						
					</c:when>
				</c:choose>	
				</div>
		
		</div>
			<div class="btn-area">
		
				
			
			</div>
        </div>
    </div>

<!-- 댓글 기능 구현 안함-->



<script>
// 

    var kkeys = [], konami = "38,38,40,40,37,39,37,39,66,65";
$(document).keydown(function(e) {
    kkeys.push( e.keyCode );
    if ( kkeys.toString().indexOf( konami ) >= 0 ){
        kkeys = [];
        alert('안녕하세요');
    }
});

/*공유 버튼 클릭 시 창 열리고 다시 클릭시 꺼짐 'id=share-cont' 에 onclick='toggleDiv() 를 집어넣었으나 모달창으로 교체함*/
/*
function toggleDiv() {
  var div = document.getElementById('share-cont');
  if(div.style.display == 'none')  {
    div.style.display = 'block';
  }else {
    div.style.display = 'none';
  }
}
*/

// 팝업 열기
$(document).on("click", "#btn-share", function (e){
  var target = $(".share-open");
  $(target).addClass("show");
});

// 외부영역 클릭 시 팝업 닫기
$(document).mouseup(function (e){
  var LayerPopup = $(".share-open");
  if(LayerPopup.has(e.target).length === 0){
    LayerPopup.removeClass("show");
  }
});

function clip(){

    var url = '';
    var textarea = document.createElement("textarea");
    document.body.appendChild(textarea);
    url = window.document.location.href;
    textarea.value = url;
    textarea.select();
    document.execCommand("copy");
    document.body.removeChild(textarea);
    alert("URL이 복사되었습니다.")
}
</script>

<script>
		$(function() {
			$(".location  .dropdown > a").on("click",function(e) {
				e.preventDefault();
				if($(this).next().is(":visible")) {
					$(".location  .dropdown > a").next().hide();
				} else {
					$(".location  .dropdown > a").next().hide();
					$(this).next().show();
				}
			});
		});
	</script>

</div>
</body>

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

.board_view {margin-top:100px; width:1100px;}
.board_view h2 {margin-bottom:16px; font-size:32px; letter-spacing:-1px; text-align:center;}
.board_view .info {font-size:18px; text-align:center;}
.board_view .info .user {color:#007dc6;}
.board_view .info .answerr {color:#00616b; font-size:20px;}
.board_view .info .questionn {color:#ff318d; font-size:20px;}


.board_body {padding:70px 120px; border-top:1px solid #ddd; border-bottom:1px solid #ddd; margin-top:35px;}
.board_body .texta {padding:10px 10px; border:0px; resize:none; width:900px; height:300px; font-size:15px; text-align:left;}
.board_pds {padding:20px 120px; border-top:1px solid #ddd;  margin-top:35px; }
.board_body p {margin-bottom:20px;}

ul, ol {list-style:none;}
a {text-decoration:none; color:#333;}
body {font-family:나눔고딕; color:#333;}
header, nav, section, article, footer {display:block;}
h1,h2,h3,h4,h5,h6 {font-weight:normal; font-size:16px;}
table,th,tr,td {border-collapse:collapse;}
fieldset {border:0 none;}
</style>

<%@ include file = "../common_footer.jsp" %>