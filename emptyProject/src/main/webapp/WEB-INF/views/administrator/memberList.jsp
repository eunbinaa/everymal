<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- core라이브러리를 c라는 접두사를 따와서 쓰겠다 -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
<%--     <c:set var="totUser" value="${resultMap.totalList}" />
    <c:set var="section" value="${userList.section }" />
    <c:set var="pageNum" value="${userList.pageNum }" /> --%>


    <% request.setCharacterEncoding("utf-8"); %>

      <!DOCTYPE html>
      <html lang="ko">

      <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My page</title>
        <link rel="stylesheet" href="${contextPath}/resources/css/reset.css" />
        <link rel="stylesheet" href="${contextPath}/resources/css/common.css" />
        <link rel="stylesheet" href="${contextPath}/resources/css/userList.css" />
        <script src="${contextPath}/resources/js/jquery-3.6.3.min.js"></script>

      </head>

      <body>
        <div id="container_sub">
          <header id="header">
            <nav>
              <ul class="topNav">
                <li>
                  <a href="${contextPath}/qna_Board/qnaboardMain.do">1:1온라인 상담</a>
                </li>
                <li>
                  <a href="${contextPath}/emr_Page/emergency.do">24시간 응급실</a>
                </li>
	              <li><a href="${contextPath}/pet_Taxi/petTaxiPage.do">펫택시</a></li>
	              <li><a href="${contextPath}/hos_List/hos_filter.do">병원 찾기</a></li>
                <li>
                <c:choose>
                  <c:when test="${!empty isLogon}">
                    <c:choose>
                      <c:when test="${isHos}">
                        <a href="${contextPath}/hos_MypageInfo/hosMypage.do">병원마이페이지</a>
                      </c:when>
                      <c:when test="${log_id eq 'admin'}">
                      	<a href="${contextPath }/administrator/memberList.do">관리자마이페이지</a>
                      </c:when>
                      <c:otherwise>
                        <a href="${contextPath}/user_Page/isValidPwd.do">회원마이페이지</a>
                      </c:otherwise>
                    </c:choose>
                  </c:when>
                  <c:otherwise>
                    <a href="${contextPath}/member/loginForm.do">로그인•회원가입</a>
                  </c:otherwise>
                </c:choose>
              </li>
              </ul>
            </nav>
          </header>
          <h2 class="pagetitlte">관리자 페이지</h2>
          <section id="sidebar_Area">
            <div class="sidebars" id="sb_sidebar">
            </div>
          </section>
          <section id="tab_Area">
            <div class="tab_nav">
              <ul class="tab_Btns">
                <li class="tBtn tBtn1 choiceTabNav"><a href="${contextPath }/administrator/memberList.do"><span>회원관리</span></a></li>
                <li class="tBtn tBtn2 notChoice"><a href="${contextPath }/administrator/hopitalRegi.do"><span>병원등록요청</span></a></li>
                <li class="tBtn tBtn3 notChoice"><a href="${contextPath }/administrator/reqDelReviewList.do"><span>리뷰관리</span></a></li>
                </li>


              </ul>
            </div>
            <div class="tabcontents">
              <div id="tabBox" class="tab-content">
              <form id="memberlistForm">
              <select name="orderby" id="orderby">
    			<option value="list" selected>전체회원</option>
    			<option value="glist">일반회원</option>
    			<option value="hlist">병원회원</option>
    			<option value="elist">탈퇴회원</option>
   				<option value="alist">활동회원</option>
			  </select>
                 <p class="total_review total_p">회원 수: <span class="gatsoo" id="count">${totalList}</span>명</p>  
                  <div class="tableBox">
                    <table style="height: 100%;">
                      <colgroup>
                        <col width="20%" />
                        <col width="20%" />
                        <col width="20%" />
                        <col width="20%" />
                        <col width="20%" />

                      </colgroup>
                      <thead>
                        <tr class="member-row">
                          <th>회원코드</th>
                          <th>회원아이디</th>
                          <th>회원종류</th>
                          <th>가입일</th>
                          <th>탈퇴여부</th>
                        </tr>
                      </thead>
                      <tbody id="userListTableBody">
                      
                      </tbody>
                    </table>
                  </div>


                </form>
                <!-- -페이징!! -->


				<div id="divPaging">
				    <!-- 페이징 링크가 여기에 동적으로 생성됩니다. -->
				</div>

              </div>



            </div>
          </section>







          <!-- fooooooooooooooooooooooooooooooooooooooooooooooooooooooter -->
          <footer>
            <ul class="bottomNav">
              <li>
                <a id="footerLogo" href="${contextPath}/main.do"><img src="${contextPath}/resources/img/EverymalLogo_w.svg"
                    alt="로고" style="width: 250px; height: auto" /></a>
              </li>
              <li>
                <a href="${contextPath}/qna_Board/qnaboardMain.do">1:1온라인 상담</a>
              </li>
              <li>
                <a href="${contextPath}/emr_Page/emergency.do">24시간 응급실</a>
              </li>
              <li><a href="${contextPath}/pet_Taxi/petTaxiPage.do">펫택시</a></li>
              <li><a href="${contextPath}/hos_List/hos_filter.do">병원 찾기</a></li>
              <li>
                <c:choose>
                  <c:when test="${!empty isLogon}">
                    <a href="${contextPath}/member/logout.do">로그아웃</a>
                  </c:when>
                  <c:otherwise>
                    <a href="${contextPath}/member/loginForm.do">로그인</a>
                  </c:otherwise>
                </c:choose>
              </li>
            </ul>
            <div class="table">
              <address>
                <p>Everymal</p>
                <p>서울특별시 종로구 중구 12길 33층 123호</p>
                <p>공동대표. 김경민, 이초롱, 나은비, 황치연, 김소중</p>
              </address>
              <div class="custom">
                <p>고객문의센터</p>
                <a href="tel:010-111-2222">T. 1111-2222 (10:00 - 19:00 / 점심시간 12:30 - 13:30)</a>
                <a href="mailto:superman@test.com">E. everymal@gmail.com</a>
              </div>
              <div class="footBtn">
                <a href="#">개인정보 처리방침</a>
                <a href="#">이용약관</a>
              </div>
            </div>
          </footer> 
        </div>
      </body>
<script>
    // select 요소 값 변경 시 이벤트 처리
    $("#orderby").change(function() {
        var contextPath = "${pageContext.request.contextPath}";
        var selectedValue = $(this).val(); // 선택된 값 가져오기
        console.log(selectedValue);
        $.ajax({
            type: "GET",
            url: contextPath + "/administrator/member_List.do",
            dataType: "json",
            data: { orderby: selectedValue },
            success: function(data) {
                updateList(data);
                updatePaging(data);
                
            },
            error: function(error) {
                alert("데이터를 가져오는데 실패했습니다.");
                console.log("error: " + error);
            }
        });
    });
    
    //처음에는 자동으로 전체회원이 나오게 하기 위해서 (이거를 해야, 처음에 전체회원이 나온다.)
    $("#orderby").val("list").change();

    function updateList(data) {
        var userList = data.userList; // 업데이트할 부분에 해당하는 데이터 추출
        var count = data.totalList
        $("#count").text(count);

        var tbody = ""; // 업데이트할 tbody를 담을 변수

        if (userList.length === 0) {
            // userList가 비어있을 경우 메시지를 표시
            tbody = "<tr><td colspan='5' align='center'>등록된 회원이 존재하지 않습니다.</td></tr>";
        } else {
            // userList를 순회하며 테이블의 각 행을 생성하여 tbody에 추가
            for (var i = 0; i < userList.length; i++) {
                var user = userList[i];
                tbody += "<tr>";
                tbody += "<td>" + user.user_code + "</td>";
                tbody += "<td>" + user.user_id + "</td>";
                tbody += "<td>";
                tbody += user.user_code.startsWith('hos') ? "병원회원" : "일반회원";
                tbody += "</td>";
                tbody += "<td>" + user.j_date + "</td>";
                tbody += "<td>";
                tbody += user.user_enabled == 0 ? "N" : "Y";
                tbody += "</td>";
                tbody += "</tr>";
            }
        }

        // 업데이트된 tbody로 기존의 tbody를 교체하여 업데이트
        $("#userListTableBody").html(tbody);
       

    };
    
    function updatePaging(data) {
        var currentPage = data.currentPage;
        var totalPages = data.totalPages;
        var totalList = data.totalList;

        var pagingInfo = "전체 " + totalList + "개 중 " + currentPage + " 페이지";
        $("#pagingInfo").text(pagingInfo);
        console.log(pagingInfo);

        var pagingHtml = ""; // 페이징 링크를 담을 변수

        // 이전 페이지 링크 생성
        if (currentPage > 1) {
            pagingHtml += "<a href='#' onclick='goToPage(" + (currentPage - 1) + ")'>&lt; 이전</a> ";
        }

        // 페이지 번호 링크 생성
        var startPage = Math.max(1, currentPage - 2); // 현재 페이지를 중심으로 앞쪽에 2개 페이지 번호 출력
        var endPage = Math.min(totalPages, startPage + 4); // 시작 페이지로부터 최대 5개의 페이지 번호 출력

        if (startPage > 1) {
            pagingHtml += "<a href='#' onclick='goToPage(1)'>1</a> "; // 첫 번째 페이지로 이동하는 링크
            if (startPage > 2) {
                pagingHtml += "... "; // 중간 페이지 생략 부분 표시
            }
        }

        for (var i = startPage; i <= endPage; i++) {
            if (i === currentPage) {
                pagingHtml += "<span style='color: #9e9e9e;'>" + i + "</span> ";
            } else {
                pagingHtml += "<a href='#' onclick='goToPage(" + i + ")'>" + i + "</a> ";
            }
        }

        if (endPage < totalPages) {
            if (endPage < totalPages - 1) {
                pagingHtml += "... "; // 중간 페이지 생략 부분 표시
            }
            pagingHtml += "<a href='#' onclick='goToPage(" + totalPages + ")'>" + totalPages + "</a> "; // 마지막 페이지로 이동하는 링크
        }

        // 다음 페이지 링크 생성
        if (currentPage < totalPages) {
            pagingHtml += "<a href='#' onclick='goToPage(" + (currentPage + 1) + ")'>다음 &gt;</a> ";
        }

        // 생성된 페이징 HTML을 페이징 영역에 업데이트
        $("#divPaging").html(pagingHtml);
    };


    // 페이지 이동 함수
    function goToPage(page) {
        var contextPath = "${pageContext.request.contextPath}";
        var selectedValue = $("#orderby").val();
        console.log(selectedValue);
        $.ajax({
            type: "GET",
            url: contextPath + "/administrator/member_List.do",
            dataType: "json",
            data: { orderby: selectedValue, pageNum: page },
            success: function(data) {
                updateList(data);
                updatePaging(data);
            },
            error: function(error) {
                alert("데이터를 가져오는데 실패했습니다.");
                console.log("error: " + error);
            }
        });
    };


</script>
<!— 템플릿 정의 —>


      </html>
