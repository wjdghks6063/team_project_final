<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/css_pyw/paging.css" rel="stylesheet"> <!--page css-->
 <link rel="stylesheet" type="text/css" href="css/css_pyw/sub.css" />
<link rel="stylesheet" type="text/css" href="css/css_pyw/subb.css" />
<link rel="stylesheet" type="text/css" href="css/css_pyw/subba_yw.css" />
	<!--##### // Visual & LNB #####-->
<%@ include file = "../common_header_yw.jsp" %>

<!--서브 헤더 -->
	<div class="sub-header sub-header-vol">
		<h1 class="sub-title"><span class="text">봉 사</span></h1>
		<span class="deco-box"><i class="deco-1"></i><i class="deco-2"></i></span>

		
	</div>
<script type="text/javascript">
	function goSearch(search){
	
		sear.t_search.value=search;
		sear.method="post";
		sear.action="Volunteer";
		sear.submit();
	}
	
	function goWriteForm(){
		dona.t_gubun.value="WriteForm";
		dona.method="post";
		dona.action="Volunteer";
		dona.submit();
	}
	function goView(no){
		dona.t_no.value=no;
		dona.t_gubun.value="View";
		dona.method="post";
		dona.action="Volunteer";
		dona.submit();
	}
	function goPage(pageNumber){
		pageform.t_nowPage.value = pageNumber;
		pageform.method="post";
		pageform.action="Volunteer";
		pageform.submit();
	}
</script>
<form name="dona">
	<input type="hidden" name="t_no">
	<input type="hidden" name="t_gubun">
</form>
<form name="pageform">
	<input type="hidden" name="t_nowPage">
	<input type="hidden" name="t_list_setup_count" value="${t_gulsu}">
	<input type="hidden" name="t_select" value="${t_select }">
	<input type="hidden" name="t_search" value="${t_search }">

</form>
<div class="contents">  
<div class="tab-3" data-swipe='{"type":"case1","start":".active"}'>
			<ul>
				<li data-act='tab' class="item"><a href="Donation"><span class="in">기부</span></a></li>
				<li data-act='tab' class="item active"><a href="Volunteer"><span class="in">봉사</span></a></li>
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
			<a href="javascript:goSearch('')"  >
	            <li>
					<h1 class="menu-bar">all-search</h1>전체 검색
				</li>
			</a>
            
           <a href="javascript:goSearch('yuseong')" >
				<li>
					<h1 class="menu-bar">yuseong</h1>유성구
				</li>
           </a>
           
           <a href="javascript:goSearch('dong-gu')">
				<li>
					<h1 class="menu-bar">dong-gu</h1>동구
				</li>
           </a>
           
           <a href="javascript:goSearch('jung-gu')">
				<li>
					<h1 class="menu-bar">jung-gu</h1>중구
				</li>
		   </a>
		   
		   <a href="javascript:goSearch('seo-gu')" >
				<li>
					<h1 class="menu-bar">seo-gu</h1>서구
				</li>
			</a>
			    
			<a href="javascript:goSearch('daedeok')"> 
				<li>
					<h1 class="menu-bar">daedeok</h1>대덕구
				</li>
			</a>
		</ul>
	</div>
	</form>

<style>
.card_today {
    color: #fff;
    display: inline-block;
    vertical-align: top;
    padding-top: 20px;
    text-align: left;
    float: left;
}
a.card_today_inner {
    float: left;
    position: relative;
    width: 300px;
    height: 363px;
    border: 1px solid rgba(0,0,0,.11);
    background-color: #fff;
    margin: 0 0 24px 24px;
    background-color: #4697e2;
    text-align: center;
    padding-top: 30px;
}
a.card_today_inner:hover {
    color: inherit;
}
.card_today .label_today {
    display: block;
    width: 70px;
    margin: 0 auto;
    padding: 6px 0 5px;
    background-clip: padding-box;
    background-color: #6da4d6;
    font-weight: 700;
    letter-spacing: .3px;
    font-size:14px;
}
.card_today .card_today_title {
    display: block;
    margin-top: 17px;
    font-size: 24px;
    line-height: 29px;
    letter-spacing: -1px;
}
.card_today .card_today_text {
    display: inline-block;
    margin-top: 34px;
    padding: 0 5px;
    font-size: 20px;
    line-height: 30px;
}
.card_today .card_today_text:before {
    display: block;
    width: 29px;
    height: 1px;
    margin: 0 auto 37px;
    background-color: #6da4d6;
    content: '';
}
.card_today .card_today_text .point {
    font-weight: 700;
    color: #fff;
}
.write-btn {
    position: relative;
    right: 160px;
}
</style>
	
	<div class="sub-content">
			 <div class="donation-box">
		  <ul class="donation-img-list">
            <li class="card_today">
		  		<a href="/introduction/DonationStatusGuide" class="card_today_inner">
		  			<span class="label_today">Today</span> <strong class="card_today_title">오늘 함께한 봉사단</strong> 
		  			<span class="card_today_text"><strong class="point"><span class="scrollnumber" id="lines4">9,650</span>개</strong>의 봉사단체와<br>
			  			<strong class="point">
			  				<span class="scrollnumber" id="lines5">86,140,200</span>명
		  				</strong>이<br>함께 하였습니다.
	  				</span>
  				</a>
  			</li>
                
			<c:forEach items="${t_dtos}" var="dtos">	
                <li class="donation-card-list">
                    <a href="javascript:goView('${dtos.getNo()}')" class="donation-card-a">
                        <div class="donation-card-pic">
                            <img loading="lazy" src="donaimg/vol/${dtos.getAttach()}" alt="기부메인" style="width:298px; height:200px;"> <!--이미지 박스 크기값 설정 및 크기에 맞지않을 경우 알아서 채우기 설정-->
                        </div>
                        <div class="donation-card-content-box">
                            <strong class="donation-card-content-title">${dtos.getTitle()}</strong>
                            <div class="donation-comp">${dtos.getVolunteersite()}</div>
                            <div class="donation-parameter-bar">
                          	 <c:set var="gage" value="${dtos.getTotal() / dtos.getGoal() *100}"/>
                          	 
                                <span class="donation-parameter-green" style="width:${gage}%;" max="100%"></span> <!--width 값 변화에 따라 게이지 량 변경-->
                            </div>
                            <strong class="donation-parameter-num"><fmt:formatNumber  pattern="###" value="${gage}" /> % </strong>
                            <strong class="donation-parameter-money"><span style="color:#10c838;font-size:15px;">₩ <fmt:formatNumber  pattern="###,###,###,###" value="${dtos.getTotal()}"/></span>
                            / <span style="color:#c0c0c0;font-size:15px;">₩ <fmt:formatNumber  pattern="###,###,###,###" value="${dtos.getGoal()}"/></span></strong>
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
	<div class="write-btn">
		<input type="button" onclick="goWriteForm()" value="글 쓰 기" class="btn">
	</div>					



</div>	
</div>
	




</div>
</div>
</body>
<%@ include file = "../common_footer.jsp" %>