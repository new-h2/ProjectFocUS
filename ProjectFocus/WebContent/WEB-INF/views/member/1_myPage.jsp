<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, goods.model.vo.*, service.model.vo.*" %>
<%
	ArrayList<GoodsBag> bagList = (ArrayList<GoodsBag>)request.getAttribute("bagList");
	Service s = (Service)request.getAttribute("s");	
	Reserve r = (Reserve)request.getAttribute("r");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>focUs || MyPage</title>
    <link rel="stylesheet" href="css/0_main.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
    <%@ include file="../common/header.jsp" %>

    <main>
        <div class="myPage_container">
            <div class="section1">
                <div class="box_wrap">
                    <div class="myPage_box">
                        <div class="myPage_title font_sub_title">프로필</div>
                        <div class="myPage_content_wrap">
                            <div class="myPage_content">
                                <div class="myPage_bold font_content">이름</div>
                                <div class="myPage_info"><%= loginUser.getmName() %></div>
                            </div>
                            <div class="myPage_content">
                                <div class="myPage_bold font_content">연락처</div>
                                <div class="myPage_info"><%= loginUser.getmPhone() %></div>
                            </div>
                            <div class="myPage_content">
                                <div class="myPage_bold font_content">주소</div>
                                <div class="myPage_info"><%= loginUser.getmAddress() %></div>
                            </div>
                            <div class="info_update_btn btn" id="updateMember_btn">개인정보수정</div>
                        </div>
                    </div>
                    <div class="myPage_box">
                        <div class="myPage_title font_sub_title">나의 후원</div>
                        <div class="myPage_content_wrap">
                            <div class="myPage_content">
                                <span class="myPage_point"><%= loginUser.getmName() %></span><span class="myPage_comment">님, 후원해주셔서 감사합니다.</span>
                            </div>
                            <div class="myPage_content">
                                <span class="myPage_comment">현재까지&nbsp;&nbsp;</span><span class="myPage_point" id="comma"><%= loginUser.getpMtotalpay() %></span><span class="myPage_comment">원 후원하셨습니다.</span>
                            </div>
                            <div class="info_update_btn btn" id="donation_payList">후원기록보기</div>
                        </div>
                    </div>
                </div>
                <div class="box_wrap">
                    <div class="myPage_box">
                        <div class="myPage_title font_sub_title">봉사 예약 현황</div>
                       <% if(r == null && s == null) { %>
                           <div class="myPage_content_wrap">
                        <div class="myPage_service_no">예약한 봉사가 없습니다.</div>
                     </div>
                        <% } else if (r == null && s != null) { %>
                           <div class="myPage_content_wrap">
                               <div class="service_live">예약대기</div>
                               <div class="myPage_content">
                                   <div class="myPage_bold font_content">봉사 제목</div>
                                   <div class="myPage_info"><%= s.getbTitle() %></div>
                               </div>
                               <div class="myPage_content">
                                   <div class="myPage_bold font_content">예약 날짜</div>
                                   <div class="myPage_info"><%= s.getsTime() %></div>
                               </div>
                               <div class="myPage_content">
                                   <div class="myPage_bold font_content">위치</div>
                                   <div class="myPage_info"><%= s.getsLocation() %></div>
                               </div>
                              </div>
                        <% } else if (r != null && s == null) { %>
                           <div class="myPage_content_wrap">
                               <div class="myPage_content">
                                   <div class="myPage_bold font_content">봉사 제목</div>
                                   <div class="myPage_info"><%= r.getrTitle() %></div>
                               </div>
                               <div class="myPage_content">
                                   <div class="myPage_bold font_content">예약 날짜</div>
                                   <div class="myPage_info"><%= r.getrTime() %></div>
                               </div>
                               <div class="myPage_content">
                                   <div class="myPage_bold font_content">위치</div>
                                   <div class="myPage_info"><%= r.getrLocation() %></div>
                               </div>
                               <div class="service_live">예약대기</div>
                           </div>
                        <% } %>
                    </div>
                    
                    <div class="myPage_box">
                        <div class="myPage_title font_sub_title">나의 활동</div>
                        <div class="myPage_content_wrap">
                            <div class="myPage_content2">
                                <div class="myPage_bold2 font_content">내가 쓴 글 보러가기</div>
                                <div class="myPage_info"><a href="#">100개</a></div>
                            </div>
                            <div class="myPage_content2">
                                <div class="myPage_bold2 font_content">내가 쓴 댓글 보러가기</div>
                                <div class="myPage_info"><a href="#">200개</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="myPage_line"></div>
            <div class="section2">
				<div class="payment_box_wrap">
					<div class="payment_box_header">주문번호/주문날짜</div>
					<div class="payment_box_header product_info">상품정보</div>
					<div class="payment_box_header">상품수량/상품금액</div>
					<div class="payment_box_header">배송정보</div>
				</div>
				<div class="payment_box_line"></div>
				<div id="wrap">	
				<% if(bagList.size() == 0) { %>
					<div style="text-align: center; margin-top: 10px;">구매한 상품이 없습니다.</div>
				<% } else { %>
					<% for(int i = 0; i < bagList.size(); i++) { %>
					<% GoodsBag bag = bagList.get(i); %>
						<div class="payment_box_wrap product_font">
							<input type="hidden" value="<%= i %>" name="gNo">
							<div class="payment_box_content2">
								<div><%= bag.getBuyNum() %></div>
								<div style="margin-top: 10px;"><%= bag.getDate() %></div>
							</div>
							<div class="payment_box_content1 product_info2">
								<div class="payment_box_img"><img src="<%= request.getContextPath() %>/goods_uploadFiles/<%= bag.getThumbnailImg() %>" class="payment_box_img"></div>
								<span class="payment_text"><%= bag.getTitle() %></span>
							</div>
							<div class="payment_box_content2">
								<div><%= bag.getAmount() %>개</div>
								<div style="margin-top: 10px;"><%= bag.getPrice() %>원</div>
							</div>
							<div class="payment_box_content2">
								<div>대한통운</div>
								<div style="margin-top: 10px;">3452-5555-5555</div>
								<div style="margin-top: 10px;">배송현황</div>
							</div>
						</div>
					<% } %>
				<% } %>
				</div>
            </div>

        </div>
    </main>
    
    <!-- donationPayList -->
	<div class="myPage_modal">
		<div class="myPage_modal_background"></div>
		<div class="dpl-main-box">
			<div class="dpl-head">
				<div class="dpl-head-head">
					<div class="dpl-head-ni"><%= loginUser.getmNick() %></div>
					<div class="dpl-head-ck">님의 후원내역</div>
				</div>
				<div class="dpl-head-body">
					<div class="dpl-body">
						<div class="dpl-body-title">
							<div class=dpl-pNo>후원번호</div>
							<div class=dpl-pDate>후원날짜</div>
							<div class=dpl-pCate>카테고리</div>
							<div class=dpl-pTitle>글제목</div>
							<div class=dpl-pWriter>후원기관/개인</div>
							<div class=dpl-pPay>후원금액</div>
						</div>
						<div class="dpl-body-content">
							<div class=dpl-No></div>
							<div class=dpl-Date></div>
							<div class=dpl-Cate></div>
							<div class=dpl-Title></div>
							<div class=dpl-Writer></div>
							<div class=dpl-Pay></div>
						</div>
					</div>
				</div>
			</div>
			<div class="dpl-foot">
				총 <span style="font-weight: bold;" id="com"><%= loginUser.getpMtotalpay() %></span>
				원 후원하셨습니다.
			</div>
		</div>
	</div>

	<%@ include file="../common/footer.jsp" %>
	
	<script>
		$('#updateMember_btn').click(function() {
			location.href="<%= request.getContextPath() %>/myPageUpdate.go";
		});
		
		$('#donation_payList').click(function(){
            $('.myPage_modal_background').addClass('active');
            $('.dpl-main-box').addClass('active');

            var mNo = '<%= loginUser.getmNo() %>';
            var mNick = '<%= loginUser.getmNick() %>';
            var pMtotalpay = <%= loginUser.getpMtotalpay() %>;
            
            $.ajax({
                url:'donationPayList.go',
                data: {mNo:mNo},
                success: function(data){

                    console.log(data);
                    var pList = data;
                    console.log(pList);

                    $('.dpl-body-content').html('');

                    for(var i = 0; i < pList.length; i++){
                        var p = pList[i];
                        var addHtml = "";

                        addHtml += "<div class= 'dpl-body-content'>";
                        addHtml += "<div class= 'dpl-No'>"+ p.pNo +"</div>";
                        addHtml += "<div class= 'dpl-Date'>"+ p.pDate +"</div>";
                        addHtml += "<div class= 'dpl-Date'>"+ p.dCatename +"</div>";
                        addHtml += "<div class= 'dpl-Title'>"+ p.pTitle +"</div>";
                        addHtml += "<div class= 'dpl-Writer'>"+ p.bWriter +"</div>";
                        addHtml += "<div class= 'dpl-Pay' id='comma" + i + "'>"+ p.pPayKakao +"</div>";
                        addHtml += "</div>";

                        $('.dpl-body').append(addHtml);
                        }

                        for(var i = 0; i < pList.length; i++){
                            var p = pList[i];
                        var x = Number($('#comma' + i).text()).toLocaleString();
                        $('#comma' + i).text(x);
                        }
                        var x = Number($('#com').text()).toLocaleString();
                        $('#com').text(x);
                }
       		 }); 

          });
		
		
		$('.myPage_modal_background').click(function() {
			$('.myPage_modal_background').removeClass('active');
			$('.dpl-main-box').removeClass('active');
		});

		window.onload = (function() {

			var x = Number($('#comma').text()).toLocaleString();
			$('#comma').text(x);

		});
	</script>
	
</body>
</html>