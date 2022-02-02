<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/paging.css" rel="stylesheet"> <!--파트너 css-->
<%@ include file = "../common_header_yw.jsp" %>


<!--서브 헤더 -->
	<div class="sub-header sub-header-notice"><!-- sub-header 뒤에 이름 변경으로 이미지 변경 -->
		<h1 class="sub-title"><span class="text">FAQ</span></h1>
		<span class="deco-box"><i class="deco-1"></i><i class="deco-2"></i></span>
	</div>
<!-- 서브 헤더 끝 -->

<script type="text/javascript">
	function goSearch(){
		
		sear.method="post";
		sear.action="Qna";
		sear.submit();
	}
	
	function goWriteForm(){
		qna.t_gubun.value="WriteForm";
		qna.method="post";
		qna.action="Qna"
		qna.submit();
	}
	function goView(no){
		qna.t_gubun.value="View";
		qna.t_no.value=no;
			
		qna.method="post";
		qna.action="Qna"
		qna.submit();
	}
	function goPage(pageNumber){
		pageform.t_nowPage.value = pageNumber;
		pageform.method="post";
		pageform.action="Qna";
		pageform.submit();
	}
</script>
<form name="qna">
	<input type="hidden" name="t_no">
	<input type="hidden" name="t_gubun">
</form>
<form name="pageform">
	<input type="hidden" name="t_nowPage">
	<input type="hidden" name="t_list_setup_count" value="${t_gulsu}">
	<input type="hidden" name="t_select" value="${t_select }">
	<input type="hidden" name="t_search" value="${t_search }">

</form>



	<div class="tab-3" data-swipe='{"type":"case1","start":".active"}'>
			<ul>
				<li data-act='tab' class="item"><a href="Notice"><span class="in">공지사항</span></a></li>
				<li data-act='tab' class="item"><a href="FAQ"><span class="in">빠른답변</span></a></li>
				<li data-act='tab' class="item active"><a href="Qna"><span class="in">질의응답</span></a></li>
				
			</ul>
		</div>
<!-- 서브 페이지-->	
<div class="sub-main">
	
	<div class="sub-search">
	<h3 class="donation-text-box"><a href="" class="donation-text">질문게시판입니다.. <i class="fas fa-chevron-right"></i></a>
		<br>

	</div>

	<div class="container">
	  <div class="search_wrap">
		<div class="record_group">
			<p>총게시글<span>${t_dtos.size()}</span>건</p>
		</div>
		<div class="search_group">
			<form name="sear" ">
				<input type="hidden" name="t_gubun" value="List">
				<select name="t_select" class="selectq">
					<option value="q_title" <c:if test="${t_select eq 'q_title'}">selected</c:if>>질문제목</option>
					<option value="q_content" <c:if test="${t_select eq 'q_content'}">selected</c:if>>질문내용</option>
				</select>
				<input value="${t_search}" type="text" name="t_search" class="search_word">
				<button onclick="gosearch" class="btn_search" type="submit"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
			</form>
		</div>
	  </div> <!-- search end -->
	  <div class="bord_list">
		<table class="bord_table" summary="이표는 번호,제목,답변상태, 작성자, 작성일, 조회수로 구성되어 있습니다">
			<caption class="sr-only">질문과 답변 리스트</caption>
			<colgroup>
				<col width="5%">
				<col width="5%">
				<col width="40%">
				<col width="10%">
				<col width="7%">
				<col width="30%">
				<col width="3%">
			</colgroup>
			<thead>
				<tr>
					<th>비밀</th>
					<th>번호</th>
					<th>제목</th>
					<th>답변상태</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${t_dtos}" var="dtos">
				<tr>
				<!-- 조건에 따라 자물쇠 그림이 보인다. -->
				<c:choose>
					<c:when test="${dtos.getSecret() eq 'y' }">
						<td><i class="fas fa-lock"></i></td>
					</c:when>
					<c:otherwise>
						<td><i class="fas fa-lock-open"></i></td>
					</c:otherwise>
				</c:choose>
				<!-- 조건에 따라 링크를 타고 상세보기를 할수 있거나 못한다. -->
				<c:choose>
					<c:when test="${session_level eq 'top' || dtos.getSecret() eq 'n' || dtos.getQ_reg_id() eq session_id}">
						<td><a href="javascript:goView('${dtos.getNo()}')">${dtos.getNo()}</a></td>
						<td class="title"><a href="javascript:goView('${dtos.getNo()}')">${dtos.getQ_title()}</a></td>
					</c:when>
					<c:otherwise>
						<td>${dtos.getNo()}</td>
						<td class="title">${dtos.getQ_title()}</td>
					</c:otherwise>
				</c:choose>
				<!-- 답변여부에 따라 답변대기인지 답변완료인지 나타낸다. -->				
				<c:if test="${empty dtos.getA_content() }">	
					<td><span class="waiting">답변대기</span></td>
				</c:if>	
				<c:if test="${not empty dtos.getA_content() }">	
					<td><span  class="complet">답변완료</span></td>
				</c:if>	
				<!-- 여긴 특별히 조건문이 없다. -->
					<td>${dtos.getQ_reg_id()}</td>
					<td>${dtos.getQ_reg_date()}</td>
					<td>${dtos.getHit()}</td>
				</tr>
			</c:forEach>	
				
				
			</tbody>
		</table>
		<div class="paging" id="paging1">
 		<%	int total_page 				= (int)request.getAttribute("t_total_page");
		int current_page 			= (int)request.getAttribute("t_current_page");
		out.print(CommonUtil.pageListPost2(current_page, total_page, 5));
		%>
 		
		</div>	
		
		 <c:if test="${empty session_id}">
			
			<input type="button"  onclick = "location.href = 'Qna' " value="로그인 후 작성해주세요" class="btn" style="width:250px;background-color:#f0f0f0;font-family: 'Dongle';">
		</c:if>		
		 <c:if test="${not empty session_id}">
			
			<input type="button" onclick="goWriteForm()" value="글 쓰 기" class="btn" style="background-color:#f0f0f0;font-family: 'Dongle';">
		</c:if>		
		</div>
	  </div>
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




	<br>
</div>
	
</body>
<%@ include file = "../common_footer.jsp" %>