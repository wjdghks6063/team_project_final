<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp"%>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!--페이지 css-->
<link href="css/mypage-menu.css" rel="stylesheet">
 <!-- UIkit CSS -->
 <link rel="stylesheet" href="css/uk/uikit-rtl.css" />
 <link rel="stylesheet" href="css/uk/uikit.css" />
 <!-- UIkit JS -->
 <script src="https://cdn.jsdelivr.net/npm/uikit@3.10.1/dist/js/uikit.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/uikit@3.10.1/dist/js/uikit-icons.min.js"></script>
 <script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.2.min.js" type="application/javascript"></script>
<script>
	function sendmail(){
		mail.method="post";
		mail.action="MailSending";
		mail.submit();
	}
</script>
<body>
<div id="containar">
    <div class="my-page-box">
        <div class="my-list-left">
            <div class="my-profile">
                <div class="my_profile_nickname">
                    <span class="ellipsis" id="nickNameArea">${session_name}</span>
                </div>
                <div class="my_profile_id" id="maskingIdArea">${session_id}</div>
            </div>
            <div id="lnb" class="my_lnb" role="menu">
                <a href="javascript:goHome()" role="menuitem" class="my_lnb_item" id="lnb_my_home" aria-current="false">MY홈</a> 
                <a href="javascript:goDona()" role="menuitem" class="my_lnb_item" id="lnb_my_notification" aria-current="false">기부</a>
                <a href="../홈페이지_기본_레이아웃/manager-volunteer.html" role="menuitem" class="my_lnb_item" id="lnb_my_activity" aria-current="false">봉사</a> 
                <a href="../홈페이지_기본_레이아웃/manager-Year-end-settlement.html"role="menuitem" class="my_lnb_item" id="lnb_my_tax" aria-current="true">회원 관리</a>
            </div>
        </div>
        <div>
		
		</div>
		
	<form name ="mail">
    <fieldset class="uk-fieldset" style="padding: 40px 60px 60px 60px; border:none; margin-left:30px;" >
        <div class="uk-margin">
            <input class="uk-input" type="text" placeholder="받는 사람" value="<c:forEach items="${t_arrayParam}" var="array_param" varStatus="status">${array_param}<c:choose><c:when test="${t_array_size-1 > status.index}">,</c:when><c:otherwise></c:otherwise></c:choose></c:forEach>">
        </div>
		  <div class="uk-margin">
            <input class="uk-input" type="text" placeholder="제목을 입력하세요" name="t_title" >
        </div>
		<c:forEach items="${t_arrayParam}" var="array_param">
			<input type="hidden" name="t_to_email[]" value="${array_param}">
		</c:forEach>
        <div class="uk-margin">
            <textarea class="uk-textarea" style="height: 300px;resize: none;" name="t_content" placeholder="내용을 적어주세요"></textarea>
        </div>
  		<div class="uk-margin" style="margin-top:-5px;">
        <div uk-form-custom="target: true">
            <input type="file">
            <input class="uk-input uk-form-width-medium" type="text" name="t_attach" placeholder="Select file" disabled>
        </div>
          <button type="button" class="uk-button uk-button-default" style="float:right;" onclick ="sendmail()">보내기</button>
		</div>
    </fieldset>
    </form>
</form>
    </div>
		
<%@ include file="../common_footer.jsp"%>
</body>
</html>