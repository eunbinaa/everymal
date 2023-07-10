<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 프로젝트 이름이 각각 다르므로 어느 프로젝트에 가져다 놓아도 사용할 수 있게 컨택스트 패스를 변수로 가져온다 -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <% request.setCharacterEncoding("utf-8"); %>
      <!DOCTYPE html>
      <html lang="ko">

      <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>로그인</title>
        <link rel="stylesheet" href="${contextPath}/resources/css/reset.css" />
        <link rel="stylesheet" href="${contextPath}/resources/css/common.css" />
        <link rel="stylesheet" href="${contextPath}/resources/css/join_choice.css" />
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
          <h2 class="pagetitlte">회원가입 유형선택</h2>
          <section id="sidebar_Area">
            <div class="sidebars" id="sb_sidebar"></div>
          </section>
          <section class="content">
            <div id="user_choicebox">
              <img src="${contextPath}/resources/img/dog2.jpg" class="imgChoice" />
              <a href="${contextPath}/member/join_user.do">개인 회원가입</a>
            </div>
            <div id="hospital_choicebox">
              <img src="${contextPath}/resources/img/n_hospital.jpg" class="imgChoice" />
              <a href="${contextPath}/member/join_hospital.do">병원 회원가입</a>
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

      </html>