<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/paging.css" rel="stylesheet"> <!--page css-->

	<!--##### // Visual & LNB #####-->
<%@ include file = "../common_header_yw.jsp" %> 


<script type="text/javascript">
	function goSearch(search){
	
		sear.t_search.value=search;
		sear.method="post";
		sear.action="Donation";
		sear.submit();
	}
	
	function goWriteForm(){
		dona.t_gubun.value="WriteForm";
		dona.method="post";
		dona.action="Donation";
		dona.submit();
	}
	function goView(no){
		dona.t_no.value=no;
		dona.t_gubun.value="View";
		dona.method="post";
		dona.action="Donation";
		dona.submit();
	}
	function goPage(pageNumber){
		pageform.t_nowPage.value = pageNumber;
		pageform.method="post";
		pageform.action="Donation";
		pageform.submit();
	}
</script>
<form name="dona">
	<input type="hidden" name="t_no">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_id" value="${session_id}">
</form>
<form name="pageform">
	<input type="hidden" name="t_nowPage">
	<input type="hidden" name="t_list_setup_count" value="${t_gulsu}">
	<input type="hidden" name="t_select" value="${t_select }">
	<input type="hidden" name="t_search" value="${t_search }">

</form>

<!--서브 헤더 -->
   <div class="sub-header sub-header-give">
      <h1 class="sub-title"><span class="text">기 부</span></h1>
      <span class="deco-box"><i class="deco-1"></i><i class="deco-2"></i></span>
   </div>
<!-- 서브 헤더 끝 -->

<div class="contents">
<div class="tab-3" data-swipe='{"type":"case1","start":".active"}'>
			<ul>
				<li data-act='tab' class="item active"><a href="Donation"><span class="in">기부</span></a></li>
				<li data-act='tab' class="item"><a href="Volunteer"><span class="in">봉사</span></a></li>
				<li data-act='tab' class="item"><a href="LocalNews"><span class="in">지역뉴스</span></a></li>
				<li data-act='tab' class="item"><a href="Missing"><span class="in">실종아동</span></a></li>
			</ul>
		</div>
	
<!-- 서브 페이지-->	
<div class="sub-main">
	
	<form name="sear">
		<input type="hidden" name="t_search">
	<div class="sub-search">
		<ul class="mini-menu">
                <li>
                	<a href="javascript:goSearch('')"  >
                		<h1 class="menu-bar"><i class="fas fa-globe-asia"></i></h1>전체 검색
               		</a>
				</li>
                   
				<li>
					<a href="javascript:goSearch('child')" >
						<h1 class="menu-bar"><i class="fas fa-child"></i></h1>아이들
					</a>
				</li>
                   
				<li>
					<a href="javascript:goSearch('senior')">
						<h1 class="menu-bar"><i class="fas fa-user"></i></h1>어르신
					</a>
				</li>
                   
				<li>
					<a href="javascript:goSearch('disabled')" >
						<h1 class="menu-bar"><i class="fab fa-accessible-icon"></i></h1>장애인
					</a>
				</li>
                   
				<li>
					<a href="javascript:goSearch('disaster')">
						<h1 class="menu-bar"><i class="fas fa-house-damage"></i></h1>재난
					</a>
				</li>
		</ul>
	</div>
	</form>
	<div class="sub-content">
			 <div class="donation-box">
        

		</h3>    
          
		  <ul class="donation-img-list">
                <li class="donation-card-list">
                    <a href="" class="donation-card-a">
                        <div class="donation-card-pic">
                            <img loading="lazy" src="img/sub_img/thank.jpg" alt="" style="width:265px; height:200px; background-color:#ffb6c1;"> <!--이미지 박스 크기값 설정 및 크기에 맞지않을 경우 알아서 채우기 설정-->
                        </div>
                        <div class="donation-card-content-box" style="background-color:#ffb6c1;">
                            <strong class="donation-card-content-title">오늘 하루 여러분의 관심과 사랑입니다.</strong>
                            <div class="donation-comp">총 모금 달성도</div>
                            <div class="donation-parameter-bar">
                                <span class="donation-parameter-green" style="width: 65%;"></span> <!--width 값 변화에 따라 게이지 량 변경-->
                            </div>
                            <strong class="donation-parameter-num">72%</strong>
                            <strong class="donation-parameter-money">$366,222,230</strong>
                        </div>    
                    </a>
                </li>
                
			<c:forEach items="${t_dtos}" var="dtos">	
                <li class="donation-card-list">
                    <a href="javascript:goView('${dtos.getNo()}')" class="donation-card-a">
                        <div class="donation-card-pic">
                            <img loading="lazy" src="donaimg/dona/${dtos.getAttach()}" alt="기부메인" style="width:265px; height:200px;"> <!--이미지 박스 크기값 설정 및 크기에 맞지않을 경우 알아서 채우기 설정-->
                        </div>
                        <div class="donation-card-content-box">
                            <strong class="donation-card-content-title">${dtos.getTitle()}</strong>
                            <div class="donation-comp">${dtos.getDominator()}</div>
                            <div class="donation-parameter-bar">
                          	 <c:set var="gage" value="${dtos.getTotal() / dtos.getGoal() *100}"/>
                          		<c:choose>
                          			<c:when test="${gage < 100 }"> 
                                		<span class="donation-parameter-green" style="width:<fmt:formatNumber  pattern="###" value="${gage}" />%;" max="100%"></span> <!--width 값 변화에 따라 게이지 량 변경-->
                           				<strong class="donation-parameter-num"><fmt:formatNumber  pattern="###" value="${gage}" />% </strong>
                            <strong class="donation-parameter-money"><span style="color:#10c838;font-size:15px;">₩ <fmt:formatNumber  pattern="###,###,###,###" value="${dtos.getTotal()}"/></span>
                            /<span style="color:#c0c0c0;font-size:14px;">₩ <fmt:formatNumber  pattern="###,###,###,###" value="${dtos.getGoal()}"/></span></strong>
                           			</c:when>
                           			<c:when test="${gage >= 100 }"> 
                                		<span class="donation-parameter-blue" style="width:100%;" max="100%";></span> <!--width 값 변화에 따라 게이지 량 변경-->
                           				<strong class="donation-parameter-num2"><fmt:formatNumber  pattern="###" value="${gage}" />% </strong>
                            <strong class="donation-parameter-money"><span style="color: #00BFFF;font-size:15px;">₩ <fmt:formatNumber  pattern="###,###,###,###" value="${dtos.getTotal()}"/></span>
                            /<span style="color:#c0c0c0;font-size:14px;">₩ <fmt:formatNumber  pattern="###,###,###,###" value="${dtos.getGoal()}"/></span></strong>
                           			</c:when>
                           		</c:choose>	
                            </div>
                            
                        </div>    
                    </a>
                </li>
			</c:forEach>	
			
			</ul>	
	</div>
	
	<br>
	<div class="paging" id="paging1">

	<%	int total_page 				= (int)request.getAttribute("t_total_page");
		int current_page 			= (int)request.getAttribute("t_current_page");
		out.print(CommonUtil.pageListPost2(current_page, total_page, 5));
		%>

	</div>	
	
	
	<br>
	<c:if test="${session_level eq 'top'}">
	<input type="button" onclick="goWriteForm()" value="글 쓰 기" class="btn" style="background-color:#f0f0f0;font-family: 'Dongle';">
	</c:if>


</div>
</div>	
</div>
	




</div>
</body>
<%@ include file = "../common_footer.jsp" %>