<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*, service.model.vo.Service, like.model.vo.Likey, common.PageInfo"%>
<% 
	ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList");
	ArrayList<Image> iList = (ArrayList<Image>)request.getAttribute("iList");
	ArrayList<Service> sList = (ArrayList<Service>)request.getAttribute("sList");
	ArrayList<Likey> lList = (ArrayList<Likey>)request.getAttribute("lList");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="css/service.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	.hover{background-color: rgba(182, 182, 182, 0.3);}
</style>


</head>
<body>

<%@ include file="../common/header.jsp" %>

	 <div class="dv"></div>
	<div class="main_poster_container">
		<div class="board_main_image_box">
			<img style="width: 100%; height: 100%;" src="image/focus_service_main.jpg">
		</div>
	</div>
	<main>

		<div>
		</div>
		<div class="hashtag_box1">
			<div class="hashtag_span_box">
<!-- 				<span style="color: #ffc34d; font-size: 35px;">#</span> -->
				<span class="hashtag_span">카테고리로 빠르게 검색하세요 !</span>
			</div>
<!-- 			<div class = "hashtag_span_box_2"> -->
				
<!-- 			</div> -->
			<div class="hashtag_and_search">
				<div class="hashtag_btn_box">
					<input type="button" value="청소" class="hashtag_btn">
					<input type="button" value="돌봄" class="hashtag_btn">
					<input type="button" value="산책" class="hashtag_btn">
					<input type="button" value="재능기부" class="hashtag_btn">
					<input type="button" value="기타" class="hashtag_btn">


				</div>
				
				<form>
					<select name="category" id="category">
						<option value="제목">제목</option>
						<option value="작성자">작성자</option>
						<option value="내용">내용</option>
					</select>
					<input type="text" placeholder="검색어를 입력하세요" class="input_search" id="search">
					<input type="submit" value="검색" class="btn_sty btn">
					<input type="button" value="글쓰기" class="btn_sty btn" onclick="location.href='<%=request.getContextPath() %>/serviceWrite.go'">
				</form>
			</div>
		</div>
			<section class="content_main" id="content_main">
			
				<section class="content_box" id="content_box">
				<% for(int i = 0; i < bList.size(); i++){ %>
           		 <%  Board b = bList.get(i);  
           		 	 Service s = sList.get(i); %> 
				<div class="content">
				<input type="hidden" value="<%=b.getbNo() %>">
				<input type="hidden" name ="writer" value="<%= b.getbWriter() %>">
					<% for(int z = 0; z < iList.size(); z++){
								Image img = iList.get(z);
								if(b.getbNo() == img.getbNo()){ %>
									<img src="<%= request.getContextPath() %>/service_uploadFiles/<%= img.getiChange() %>" class="img_sty1">
								<% } %>
						<% } %>
					
					<span class="p_sty" id="searchTitle">
							<%= b.getbTitle() %>
					</span>
					<div class="hashtag_box2">
						<span><%= s.getsCatename()%> </span>
					</div>
					<p class="p_sty"><%= b.getbContent()%></p>
					<span class="gray_font"><%= b.getbDate()%></span>
					<%for(int h = 0; h < lList.size(); h++) { %>
					<!-- 로그인한 사람의 좋아요(lList) -->
					<% Likey l = lList.get(h);%>
					<% if(b.getbNo() == l.getbNo()){ %>
					<div class ="like"><i class="fas fa-heart service_heart"></i></div>
					<% break; }%>
						<%  if(h == lList.size()-1 ){ %>
							<div class ="like"><i class="far fa-heart service_heart"></i></div>
							<% } %>
						<% } %>
					<%=b.getbLike() %>
					</div>
			
			<% } %>
			</section>	
		</section>
		
		<!-- 페이징 -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/selectServiceList.bo?currentPage=1'"> &lt;&lt; </button>
			<!-- 이전 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/selectServiceList.bo?currentPage=<%= currentPage - 1 %>'" id="beforeBtn"> &lt; </button>
			<script>
				if(<%= currentPage %> <= 1){
					$('#beforeBtn').attr('disabled', 'true');
				}
			</script>
			<!-- 숫자 버튼 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
			<% 		if(p == currentPage){ %>
						<button id="choosen" disabled> <%= p %> </button>
			<%		} else{ %>
						<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/selectServiceList.bo?currentPage=<%= p %>'"> <%= p %> </button>
			<%		} %>
			<% } %>
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/selectServiceList.bo?currentPage=<%= currentPage + 1 %>'" id="afterBtn"> &gt; </button>
			<script>
				if(<%= currentPage %> >= <%= maxPage %>){
					$('#afterBtn').prop('disabled', true);
				}
			</script>
			<!-- 맨 끝으로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/selectServiceList.bo?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
		</div>
		<br>
	</main>
 <%@ include file="../common/footer.jsp" %>
 <%--  <%@ include file="../common/footer.jsp" %> --%>

	<script>
		$('.hashtag_btn').hover(function(){
			$(this).addClass('hover');
		}, function(){
			$(this).removeClass('hover');
		});
		
		$('.content_box2').click(function(){
			$("#detail").css({"z-index":"10", "display":"block"});
		});
		
		$('#close').click(function(){
			$('#detail').css('display', 'none');
		});
		
		
// 		$('.hashtag_btn').click(function(){
		$(document).on('click', '.hashtag_btn', function(){
				
			var tagName = $(this).val();
			console.log(tagName);
			$.ajax({
				url: 'selectTag.bo', 
				data: {tagName : tagName},
				success: function(data){
					var bList = data["bList"];// content 받아오는중
					var sList = data["sList"];
	    			var iList = data["iList"];
	    			var lList = data["lList"];
					var addHtml = "";
// 					console.log(bList);
// 					console.log(sList);
// 					console.log(iList);
// 					console.log(lList);
	    			
	    		$('#content_box').html('');
					for(var i = 0; i < bList.length; i++){
						var b =bList[i];
						var s =sList[i];
					addHtml += "<div class='content'>"; // html코드 공간 나한테 content
					addHtml += "<input type='hidden' value='" + b.bNo + "'>"; // 내꺼 보드 번호
						for(var z = 0; z < iList.length; z++){ // 이미지리스트
							var img =iList[z];
								if(b.bNo == img.bNo){ 
					addHtml += "<img src='${pageContext.request.contextPath}/service_uploadFiles/" +  img.iChange + "'" + "class='img_sty1'>";		
								}
					}
						addHtml += "<span class='p_sty'>" + b.bTitle + "</span>";
						addHtml += "<div class='hashtag_box2'>";
						addHtml += "<span>" + s.sCatename + "</span>";
						addHtml += "</div>";
						addHtml += "<p class='p_sty'>" + b.bContent + "</p>";
						addHtml += "<span class='gray_font'>" + b.bDate + "</span>"; 
						
						for(var h = 0; h < lList.length; h++) {
							var l = lList[h];
							if(b.bNo == l.bNo) {
								addHtml += "<div class ='like'>";
								addHtml += "<i class='fas fa-heart service_heart'></i>"; 
								addHtml +="</div>";
							break; } 
								if(h == lList.length-1) {
								addHtml += "<div class ='like'>";
								addHtml += "<i class='far fa-heart service_heart'></i>"; 
								addHtml += "</div>";
							}
						}
							addHtml += b.bLike;
							addHtml += "</div>"
						}		
					$('#content_box').append(addHtml); // 선택한요소의 자식요소 뒤에 내용삽입
				}
			});
		});
		$(function(){
			$(document).on('click','.content', function(){
				var bNo = $(this).children().eq(0).val();
				location.href = "<%=request.getContextPath()%>/selectServiceDetail.bo?bNo="+bNo;
			});
		});
		$("#search").keyup(function() {
            var k = $(this).val();
            $("#search > content_main > searchTitle").hide();
            var temp = $("#search > content_main > searchTitle:nth-child(5n+2):contains('" + k + "')");

            $(temp).parent().show();                
        })
		
	</script>
	
	<script>
    var totalData = 1000;    // 총 데이터 수
    var dataPerPage = 3;    // 한 페이지에 나타낼 데이터 수
    var pageCount = 10;        // 한 화면에 나타낼 페이지 수
    
    function paging(totalData, dataPerPage, pageCount, currentPage){
        
//         console.log("currentPage : " + currentPage);
        
        var totalPage = Math.ceil(totalData/dataPerPage);   
        var pageGroup = Math.ceil(currentPage/pageCount);    
        
//         console.log("pageGroup : " + pageGroup);
        
        var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
        if(last > totalPage)
            last = totalPage;
        var first = last - (pageCount-1);    // 화면에 보여질 첫번째 페이지 번호
        var next = last+1;
        var prev = first-1;
        
//         console.log("last : " + last);
//         console.log("first : " + first);
//         console.log("next : " + next);
//         console.log("prev : " + prev);
 
        var $pingingView = $("#paging");
        
        var html = "";
        
        if(prev > 0)
            html += "<a href=# id='prev'><</a> ";
        
        for(var i=first; i <= last; i++){
            html += "<a href='#' id=" + i + ">" + i + "</a> ";
        }
        
        if(last < totalPage)
            html += "<a href=# id='next'>></a>";
        
        $("#paging").html(html);    // 페이지 목록 생성
        $("#paging a").css("color", "black");
        $("#paging a#" + currentPage).css({"text-decoration":"none", 
                                           "color":"red", 
                                           "font-weight":"bold"});    // 현재 페이지 표시
                                           
        $("#paging a").click(function(){
            
            var $item = $(this);
            var $id = $item.attr("id");
            var selectedPage = $item.text();
            
            if($id == "next")    selectedPage = next;
            if($id == "prev")    selectedPage = prev;
            
            paging(totalData, dataPerPage, pageCount, selectedPage);
        });
                                           
    }
    
    $("document").ready(function(){        
        paging(totalData, dataPerPage, pageCount, 1);
    });
	</script>
	
	
</body>
</html>

    