<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--##### // Visual & LNB #####-->
<%@ include file = "../common_header_yw.jsp" %>


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
	qnaq.t_gubun.value="UpdateForm";
	qnaq.method="post";
	qnaq.action="Qna";
	qnaq.submit();
}
/*질문 삭제*/
function goQDelete(){
	if(confirm("질문을 삭제하시겠습니까?")){
	qnaq.t_gubun.value="Delete";
	qnaq.method="post";
	qnaq.action="Qna";
	qnaq.submit();
}}
//리스트로
	function goList(){
		qnaq.t_gubun.value="List";
		qnaq.method="post";
		qnaq.action="Notice";
		qnaq.submit();
				
	}




</script>
<form name="qnaq">
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

		<div class="board_view">

		  	<h2>[질문] ${t_dto.getQ_title()}</h2>
		  
			<p class="info"><span class="questionn"><i class="fas fa-question-circle"></i></span>
			<span class="user">${t_dto.getQ_regname()}</span> | ${t_dto.getQ_regdate() } | <i class="fa fa-eye"></i> ${t_dto.getHit() }</p>
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
					<p class="info"><span class="answerr"></span>답변일자 | ${t_dto.getA_regdate() }</p>
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
		border: 1px solid #878787;
	}
	.answerArea .textArea_H120{
		padding:5px;
		width:700px;
		height:120px;
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
					<input type="hidden" name="t_a_name" value="${t_dto.getA_regid() }">
					<br>
					<textarea name="t_answer" class="textArea_H120"></textarea>
					<a href="javascript:goAnswerSave()" class="saveButt">답변 저장</a>
				</div>
			</form>					
			
			</div>
			
			<div class="prev_next">
			
			<form name="page">
				<input type="hidden" name="t_no">
				<input type="hidden" name="t_gubun">
				
					
					
				<div class="btn_3wrap">
					<a href="Qna">목록</a> 
				<c:choose>	
					<c:when test="${session_id eq t_dto.getQ_regid() && empty t_dto.getA_content()}">
						<a href="javascript:goQUpdate()">질문 수정</a> 
						<a href="javascript:goQDelete()">질문 삭제</a> 
					
					</c:when>
					<c:when test="${session_level eq 'top' && empty t_dto.getA_content()}">
					<span class="answerButt" style="cursor:pointer">답변하기</span>
					</c:when>
					<c:when test="${session_level eq 'top' && not empty t_dto.getA_content() }">
						<span class="answerButt" style="cursor:pointer">답변 수정</span> 
						<a href="javascript:goAnswerDelete()">답변 삭제</a> 
					</c:when>
				</c:choose>	
				</div>
					
			</div>
		</form>	
		</div>





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



<%@ include file = "../common_footer.jsp" %>