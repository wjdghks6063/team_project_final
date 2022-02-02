<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>

    <!--페이지 css-->
    <link href="css/mypage-menu.css" rel="stylesheet">
    <link href="css/my-page-regular payment.css" rel="stylesheet">
    <!-- UIkit CSS -->
    <link rel="stylesheet" href="css/uk/uikit-rtl.css" />
    <link rel="stylesheet" href="css/uk/uikit.css" />
    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.10.1/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.10.1/dist/js/uikit-icons.min.js"></script>
    <script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.2.min.js" type="application/javascript"></script>
    <!-- 달력기능 css,js-->
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="css/daterangepicker-master/daterangepicker.css">
    <!-- js -->
    <script type="text/javascript" src="css/daterangepicker-master/moment.min.js"></script>
    <script type="text/javascript" src="css/daterangepicker-master/daterangepicker.js"></script>
<style>
.my_activity_calendar_wrap {
    padding: 15px 0;
    border: 1px solid #e0e0e0;
    background-color: #fcfcfc;
    text-align: center;
    margin-top: 20px;
}
.activity_calendar_btn_wrap {
    display: inline-block;
    position: relative;
}
input#calendar_1 {  /*input type은 이렇게 지정해준다.*/
    position: relative;
    width: 160px;
    height: 37px;
    padding: 0 48px 0 15px;
    border: 1px solid #e3e3e3;
    background-color: #fff;
    font-family: NanumSquareWebFont,dotum,Sans-serif;
    font-size: 16px;
    letter-spacing: -.3px;
    cursor: pointer;
    background-image: url(../img/calendar-alt-regular.svg);
    background-repeat: no-repeat;
    background-position-x: 130px;
    background-position-y: 6px;
    background-size: 18px;
}
/* input type은 after 요소가 적용되지 않음
.activity_calendar_btn_wrap:after {
    background-image: url(../img/calendar-alt-regular.svg);
    width: 16px;
    height: 18px;
    position: absolute;
    top: 54%;
    right: 13px;
    margin-top: -11px;
    content: '';
    background-size: cover;
    filter: invert(57%) sepia(0%) saturate(0%) hue-rotate(166deg) brightness(90%) contrast(88%);
}
*/
.tilde {
    display: inline-block;
    position: relative;
    vertical-align: top;
}
input#calendar_2 {
    position: relative;
    width: 160px;
    height: 37px;
    padding: 0 48px 0 15px;
    border: 1px solid #e3e3e3;
    background-color: #fff;
    font-family: NanumSquareWebFont,dotum,Sans-serif;
    font-size: 16px;
    letter-spacing: -.3px;
    cursor: pointer;
    background-image: url(../img/calendar-alt-regular.svg);
    background-repeat: no-repeat;
    background-position-x: 130px;
    background-position-y: 6px;
    background-size: 18px;
}
.activity_calendar_search {
    width: 70px;
    min-height: 37px;
    margin-left: 7px;
    padding-top: 1px;
    border: 1px solid #00ab33;
    background-color: #10c838;
    font-size: 15px;
    line-height: 2.2;
    color: #fff;
    vertical-align: top;
}
.my_activity_month {
    position: relative;
    margin: -3px 0;
    background-color: #fff;
    line-height: 24px;
    text-align: center;
}
.my_activity_month:before {
    position: absolute;
    top: 50%;
    right: 0;
    left: 0;
    height: 1px;
    background-color: #e0e0e0;
    content: '';
}
.my_activity_month .number {
    position: relative;
    padding: 0 16px;
    background-color: #fff;
    font-family: NanumSquareWebFont,dotum,Sans-serif;
    font-size: 18px;
    font-weight: 700;
    vertical-align: top;
}
</style>
<script>
$(function () {
    $('#calendar_1').daterangepicker({
        "singleDatePicker": true, /*달력 한개 사용여부 기본은 달력 2개*/
        "showDropdowns": true, /*년 일 수동으로 선택 가능 여부*/
        "locale": {
            "format": "YYYY-MM-DD",
            "separator": " ~ ",
            "applyLabel": "확인", /*확인 버튼 이름*/
            "cancelLabel": "취소", /*취소 버튼 이름*/
            "fromLabel": "From",
            "toLabel": "To",
            "customRangeLabel": "Custom",
            "weekLabel": "W",
            "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            "firstDay": 1
        },
        "startDate": mypage.calendar_1.value, /*달력 시작 일자*/
        "endDate": mypage.calendar_1.value,  /*달력 끝나는 일자*/
        /*"maxDate": "2022/2/22", 달력 최대 값 설정*/
        /* 달력 옆에 선택 버튼 생성
        ranges: {
            '오늘': [moment(), moment()],
            '어제': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            '일주일 전': [moment().subtract(6, 'days'), moment()],
            '30일 전': [moment().subtract(29, 'days'), moment()],
            '이번 달': [moment().startOf('month'), moment().endOf('month')],
            '저번 달': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },*/
        "opens": "left", /*달력 열리는 위치 기본값 right, left, center*/
        "drops": "auto" /*기본값 달력 아래로 내려옴 "down" 위로 "up"*/
    }, function (start, end, label) {
        console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
    });
});

$(function () {
    $('#calendar_2').daterangepicker({
        "singleDatePicker": true, /*달력 한개 사용여부 기본은 달력 2개*/
        "showDropdowns": true, /*년 일 수동으로 선택 가능 여부*/
        "locale": {
            "format": "YYYY-MM-DD",
            "separator": " ~ ",
            "applyLabel": "확인", /*확인 버튼 이름*/
            "cancelLabel": "취소", /*취소 버튼 이름*/
            "fromLabel": "From",
            "toLabel": "To",
            "customRangeLabel": "Custom",
            "weekLabel": "W",
            "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            "firstDay": 1
        },
        "startDate":  mypage.calendar_2.value, /*달력 시작 일자*/
        "endDate":  mypage.calendar_2.value,  /*달력 끝나는 일자*/
        /*"maxDate": "2022/2/22", 달력 최대 값 설정*/
        /* 달력 옆에 선택 버튼 생성
        ranges: {
            '오늘': [moment(), moment()],
            '어제': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            '일주일 전': [moment().subtract(6, 'days'), moment()],
            '30일 전': [moment().subtract(29, 'days'), moment()],
            '이번 달': [moment().startOf('month'), moment().endOf('month')],
            '저번 달': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },*/
        "opens": "right", /*달력 열리는 위치 기본값 right, left, center*/
        "drops": "auto" /*기본값 달력 아래로 내려옴 "down" 위로 "up"*/
    }, function (start, end, label) {
        console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
    });
});




$(document).ready(function(){
	$('#more_button').click(function(){
	var id = mypage.t_id.value;
		$.ajax({
			type : "POST",
			url : "Mypage_regular_payment",
			data: {"t_id":id},
			dataType : "text",
			error : function(){
				alert('통신실패!!');
			},
			success : function(data){
				alert("통신데이터 값 : " + data);
				$("#Result").html(data);
				$("#emailResult").html(data);
					$("#emailResult").css("color","red");
					$("#emailResult").css("font-size","31px");
					$("#emailResult").css("margin-left","93px");
					$("#emailResult").css("margin-top","10px");
					$("#emailResult").text("이메일 형식 오류");
					$("#Result").text("");
					$(this).focus();
				}
		});
	})
})
	
	function goSearch(){
		mypage.t_more.value="0";
		mypage.method="post";
		mypage.action="Mypage_regular_payment";
		mypage.submit();
	}
	
$(document).ready(function(){
	$("#more_bottun").click(function(){
	    var urlLocation="Mypage_regular_payment"; 
	    var more = mypage.t_more.value;
	    var dayone = mypage.calendar_1.value;
	    var daytwo = mypage.calendar_2.value;
	    var id = mypage.t_id.value;
	    var objDiv = document.getElementById("more_bottun");
		$.ajax({
			type : "POST",
			url : urlLocation,
			data: {"t_id":id,"calender_1":dayone,"calender_2":daytwo,"t_more":more},
			dataType : "text",
			error : function(){
				alert('통신실패!!');
			},
			success : function(data){
				//alert("통신데이터 값 : " + data);
				mypage.method="post";
				mypage.action="Mypage_regular_payment";
				mypage.submit();
			}
			})
	})
});


</script>
    <div id="containar">
    <form name="mypage">
    	<input type="hidden" name="t_id" value="${session_id}">
    	<input type="hidden" name="t_order_id" >

        <!--script 밑에 body와 </div> 있음-->
        <!-- 마이 페이지 메뉴-->
        <div class="my-page-box">
            <div class="my-list-left">
                <div class="my-profile">
                <div class="my_profile_nickname">
                    <span class="ellipsis" id="nickNameArea">${session_name}</span>
                </div>
                <div class="my_profile_id" id="maskingIdArea">${session_id}</div>
            </div>
                <div id="lnb" class="my_lnb" role="menu">
                    <!-- aria-current="#" 여부에 따라 색상 불 들어옴-->
                    <a href="Mypage_home?t_id=${session_id}" role="menuitem" class="my_lnb_item" id="lnb_my_home" aria-current="false">MY홈</a>
                    <a href="Mypage_news?t_id=${session_id}" role="menuitem" class="my_lnb_item" id="lnb_my_notification" aria-current="false">내 소식</a>
                    <a href="Mypage_activity?t_id=${session_id}" role="menuitem" class="my_lnb_item" id="lnb_my_activity" aria-current="false">활동내역</a>
                    <a href="Mypage_regular_payment?t_id=${session_id}" role="menuitem" id="my_lnb_item" class="my_lnb_item" aria-current="true">결제관리</a>
                    <a href="Mypage_year?t_id=${session_id}" role="menuitem" class="my_lnb_item" id="lnb_my_tax" aria-current="false">연말정산</a>
                </div>
            </div>
        

            <!-- 내용 창 -->
                <div role="main" id="content" class="my_content">
                <h3 style="margin-bottom:33px;font-weight:600;" class="my_title">결제내역 </h3>
                <div class="my_regular_menu" style="height: 41px;" role="menubar">
                    <a href="/my/regularPayment?type=donation" class="my_regular_menu_item" id="tab_regular_donation" data-name="donation" role="menuitem" aria-current="true">결제내역</a> 
                </div>
                      <!-- 달력 -->
                    <div class="my_activity_calendar_wrap">
                        <div class="activity_calendar_btn_wrap" id="prevCalendar">
                            <input type="text" id="calendar_1" name="calendar_1" value="${t_day_1}">
                        </div>
                        ~
                        <div class="activity_calendar_btn_wrap" id="prevCalendar">
                            <input type="text" id="calendar_2" name="calendar_2" value="${t_day_2}">
                        </div>

                        <button type="button" class="activity_calendar_search" onclick="goSearch()" id="searchButton">검색</button>
                    </div>
                    
    <table style="margin-bottom: -1px;" class="uk-table uk-table-middle uk-table-divider">
    <thead>
    <colgroup>
					<col width="15%">
					<col width="40%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
				</colgroup>
        <tr>
            <th style="text-align:center;" class="uk-width-small">결제일</th>
            <th style="text-align:center;">대상</th>
            <th style="text-align:center;">결제금액</th>
            <th style="text-align:center;" >상태</th>
            <th style="text-align:center;">영수증</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${t_pay_dtos}" var="dtos">
        <tr style="border-bottom: 0.5px solid #e0e0e0;">
            <td style="text-align:center;" >  ${dtos.getPurchase_date()}</td>
            <td style="text-align:center;" >  ${dtos.getItem_name()}<br><a href="javascript:goView('${dtos.getOrder_id()}')"><span style="font-size:11px;">[상세보기]</span></a></td>
            <td style="text-align:center;" > <fmt:formatNumber value="${dtos.getAmount()}" pattern="#,###"/>원</td>
             <td style="text-align:center;" >
             	<c:choose>
             		<c:when test="${dtos.getCancel_yn() eq 'n'}">
             			<span>결제완료</span>
             		</c:when>
             		<c:otherwise>
             			<span>결제취소</span>
             		</c:otherwise>
            	</c:choose>
             </td>
           
            <td style="text-align:center;" ><button class="uk-button uk-button-default" type="button"><a href="https://iniweb.inicis.com/app/publication/apReceiptOpenMarket100.jsp?${fn:substring(dtos.getReceipt_url(), 71,128)}&flag=0&noMethod=1&tStat=null&re_mail=null" onclick="window.open(this.href,'','top=30%,left=650,width=670,height=780,scrollbars=no'); return false;"
	


>확인</a></button></td>
        	
        </tr>
        </c:forEach>
    </tbody>
</table>
                    <ul class="my_activity_list" id="regularPaymentList" aria-hidden="true"></ul>
                    <c:if test="${t_total_count ne t_pay_dtos.size()}">
                        <button type="button" class="btn_horizontal_more" id="more_bottun">더보기</button>
                        </c:if>
                         <input type="hidden" name="t_more" value="${t_more}">
                         
                            <c:if test="${empty t_pay_dtos}">
                    <div class="my_recent_activity_wrap" id="searchNothing">
                        <div class="none_message">
                            <p class="none_message_inner">조회내역이 없습니다. <span class="small_text">조회 기간 또는 조건을 확인해
                                    주세요.</span></p>
                        </div>
                    </div>
                           </c:if>
                    </div>
                </div>
    </form>
            </div>
           

        <!--my-page-box-->


        <script>
            /*메인 header 따라 오기 */
            let header = document.querySelector(".header-header-1");
            let headerHeight = header.offsetHeight;

            window.onscroll = function () {
                let windowTop = window.scrollY;
                if (windowTop >= headerHeight) {
                    header.classList.add("is-scroll");
                } else {
                    header.classList.remove("is-scroll");
                }
            };
            // 

            var kkeys = [],
                konami = "38,38,40,40,37,39,37,39,66,65";
            $(document).keydown(function (e) {
                kkeys.push(e.keyCode);
                if (kkeys.toString().indexOf(konami) >= 0) {
                    kkeys = [];
                    alert('안녕하세요');
                }
            });
        </script>

    </div>
    
</body>
<!--footer -->
<footer class="footer-box">
    <div class="footer-top">
        <dl class="footer-top-box">
            <dt class="footer-top-notice"><a href="">공지사항</a></dt>
            <dd class="foorer-top-notice-text">
                <a href="">회원 가입시 개인정보 관리 내역에 대해 안내해드립니다.<i class="icon-n"><i class="fab fa-envira"></i></i></a>
            </dd>
        </dl>
        <div class="service-info-box" aria-hidden="false">
            <dl class="service-info-first-line">
                <dt class="service-info-first-line-title">해피빈 안내</dt>
                <dd class="service-info-first-line-item"><a href="">해피빈 소개</a></dd>
                <dd class="service-info-first-line-item"><a href="">콩받기 안내</a></dd>
                <dd class="service-info-first-line-item"><a href="">해피빈 현황</a></dd>
                <dd class="service-info-first-line-item"><a href="">콩구폰 입력</a></dd>
            </dl>
            <dl class="service-info-first-line">
                <dt class="service-info-first-line-title">제휴∙단체안내</dt>
                <dd class="service-info-first-line-item"><a href="">해피로그 가입</a></dd>
                <dd class="service-info-first-line-item"><a href="">기업제휴 문의</a></dd>
                <dd class="service-info-first-line-item"><a href="">펀딩 개설 신청</a></dd>
            </dl>
        </div>
    </div>

    <div class="footer-info-box">
        <div class="footer-info-inner">
            <ul class="footer-info-list">
                <li class="footer-info-item"><a href="" target="해피빈 이용약관">해피빈 이용약관</a></li>
                <li class="footer-info-item"><a href="" target="개인정보처리방침"><strong>개인정보처리방침</strong></a></li>
                <li class="footer-info-item"><a href="" target="책임의 한계와 법적고지">책임의 한계와 법적고지</a></li>
                <li class="footer-info-item"><a href="" target="고객센터">고객센터</a></li>
                <li class="footer-info-item"><a href="" target="공익제보(행정안전부)">공익제보(행정안전부)</a></li>
            </ul><br>
            <!--ul 끼리 붙어 있어 줄바꿈이 생기지 않아서 넣어줌-->
            <ul class="footer-info-list">
                <li class="footer-info-item">제단법인 굿아이디어</li>
                <li class="footer-info-item">대표 : 최정우</li>
                <li class="footer-info-item">사업자 등록번호 :199-40-91928</li>
                <li class="footer-info-item">통신판매업신고 : 2015-대전충남-1994호</li>
            </ul><br>
            <address class="footer-info-address">대전 충남 대덕대로 150 11층 (갈마동,창원빌딩) 대표전화 : 1588-8282</address>
            <small class="footer-info_notice">
                재능 기부 및 직접기부의 진행과 리워드 제공의 책임은 해당 프로젝트의 개설자에게 있습니다. 굿아이디어는 해당 프로젝트의 당사자가 아니며, 리워드 제공에 대한 책임을 지지 않습니다.
            </small>
            <div class="footer-info-copyright">
                <a href="" class="footer-info-logo">
                    <img src="img/company.png" class="company-logo" alt="LOGO">
                </a> <br>
                <span class="Copyright">Copyright © G&I Corp. All Rights Reserved.</span>
            </div>
        </div>
    </div>

</footer>

</div>
</div>
</div>
</html>
<style>
   .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 999999; /* Sit on top */
        left: 35%;
        top: 15%;
        width: 50%; /* Full width */
        overflow: auto; /* Enable scroll if needed */
		overflow-y: auto;
		
    }

    /* Modal Content/Box */
    .modal-content {
   		 overflow-y: initial !important;
     	z-index: 999999;
        background-color: #fefefe;
        padding: 20px;
        border: 1px solid #888;
        width: 50%; /* Could be more or less, depending on screen size */
        border-radius:10px;
  		box-shadow: 9px 2px 44px 1px lightgray;

    }
</style>
<style>
.uk-accordion-title{
	border-bottom: 0.1px solid lightgray;
}
.uk-accordion-title:hover{
	background-color:#353b48;
	color:#ffffff;
}

.modal .modal-content .uk-accordion li.uk-open a{
	background-color:#353b48;
	color:#ffffff;
	padding: 5px 5px 5px 5px;
}

.modal .modal-content p{
margin-left:15px;
font-size:18px;
}
</style>
<script>
    function goView(order_id){
    	   
    	var order_id= order_id;
  	    var params="t_order_id="+order_id;  
  		var urlLocation="Mypage_regular_payment_modal";
  		 $(".ul_zari ul").empty();
  			$.ajax({
  				type : "POST",
  				url : urlLocation,
  				data: params,
  				dataType : "json",
  				error : function(){
  					alert('통신실패!!');
  				},
  				success : function(data){
  					 $("#myModal").show();
  					//alert("통신데이터 값 : " + data);
  					var amount = data.amount;
  					amount = amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); //10,000
  					var state = data.cancel_yn;
  					if(state=='n'){
  						state="[결제완료]";
  					}else if(state=='y'){
  						state="[결제취소]";
  					}else{
  						state="취소승인중[사용자요청]";
  					}
  					var id = mypage.t_id.value;
  					
  					var nodeList = ""; //여기에 포문 든게 dtos처럼 붙음
  						//alert(data[k].no); //3개가 있으니까 html에 있는 거 생긴거 그대로 controller에서 값받아와서 이렇게 생긴놈한테 뿌려준다는 의미인듯 --> 이거 아닌듯 위치 정해서 이만큼 넣어준다는 말인듯 이렇게 생긴거에 넣는다는게 아니라 
  						var newNode = "<li>";
  						newNode += "<li><span>구매자 아이디: </span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+id+"</li>";
  						newNode += "<li><span>결제 고유번호: </span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+data.order_id+"</li>";
  						newNode += "<li><span>결제 방식: </span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+data.method+"</li>";
  						newNode += "<li><span>결제 카드: </span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+data.method_name+"</li>";
  						newNode += "<li><span>결제일: </span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+data.purchase_date+"</li>";
  						newNode += "<li><span>기부대상: </span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+data.item_name+"</li>";
  						newNode += "<li><span>결제금액: </span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+amount+"원</li>";
  						newNode += "<li><span>결제상태: </span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+state+"</li>";
  						newNode += "<input type='hidden' name='t_order_id' value='"+data.order_id+"'>";
  						newNode += "</li>";
  						nodeList += newNode; //noeList에다가 newNode를 붙이고 붙이고 하는 작업인 것임
  					$(nodeList).appendTo($(".modal-content .ul_zari ul")).slideDown(); //추가하겠다 appento에는 어떤 태그에 추가할 것인가를 정하는것 -->boardList라는 클래스 내에 있는 tbody에 / 밑으로 내려오게끔 추가하겠다 slidedown
  					//alert(nodeList);
  					
  					
  				}
  			});
  		}
    //팝업 Close 기능
    function close_pop1(flag) {
         $("#myModal").hide();
    };
	function goCancel(){
   		alert("zz");
   		alert(pay.t_order_id.value);
   	}
</script>

<div id="myModal" class="modal" >
  <!-- Modal content -->
  <div class="modal-content">
  <form name="pay">
  <div class="ul_zari">
  <ul class="uk-list uk-list-striped" style="border-bottom:1px solid lightgray;">
  
  </ul>
  </div>
    </form>
          <div class="modal_button" style="margin-top:20px;">
            <p class="uk-text-right">
            <button class="uk-button uk-button-default uk-modal-close" onClick="close_pop1();" type="button">닫기</button>
            <button class="uk-button uk-button-primary" onClick="goCancel();" style="background-color:#2f3640" type="button">결제취소요청</button>
        </p>
        </div>
        </div>
  </div>

