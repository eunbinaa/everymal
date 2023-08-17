<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <% request.setCharacterEncoding("utf-8"); %>
      <!DOCTYPE html>
      <html lang="ko">

      <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>마이페이지 > 내 동물관리</title>
        <link rel="stylesheet" href="${contextPath}/resources/css/reset.css" />
        <link rel="stylesheet" href="${contextPath}/resources/css/common.css" />
        <link rel="stylesheet" href="${contextPath}/resources/css/mypet_info.css" />
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript">
          function init() {
            if (${empty isLogon }) {
              alert("마이페이지를 보려면 로그인 해주세요");
              document.location.href = "${contextPath}/member/loginForm.do";
            }else {
              if (${empty user_code }) {
                alert("병원 회원은 병원 마이페이지에 접속해 주세요");
                document.location.href = "${contextPath}/main.do";
              }
            }
          }


         /* function submitForm() {
            var forms = document.getElementsByClassName("myPetInfoForm");
            if (forms.length > 0) {
              var form = forms[0];
              form.submit();
            }
          }
         */ 


        function submitForm() {
        	  var forms = document.getElementsByClassName("myPetInfoForm");
        	  if (forms.length > 0) {
        	    var formData = [];
        	    for (let i = 0; i < forms.length; i++) {
        	      var form = forms[i];
        	      var formDataItem = {
        	        pet_name: form.pet_name.value,
        	        pet_code: form.pet_code.value,
        	        pet_age: form.pet_age.value,
        	        pet_sex:form.pet_sex.value,
        	        pet_types:form.pet_types.value,
        	        pet_number:form.pet_number.value,
        	        b_type:form.b_type.value,
        	        pet_weight:form.pet_weight.value,
        	        pet_etc:form.pet_etc.value
        	        // ... 나머지 필드들도 추가
        	      };
        	      formData.push(formDataItem);
        	    }
        	    // JSON 형식으로 변환
        	    var jsonData = JSON.stringify(formData);

        	    // Ajax 요청 전송
        	    var xhr = new XMLHttpRequest();
        	    xhr.open("POST", "http://127.0.0.1:8090/stsproject/user_Page/modPet.do", true);
        	    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        	    xhr.send(jsonData);
        	  }
        	}


          function delPetInfo(url, pet_code) {
            let d_form = document.createElement("form"); //createElement=>태그를 만들어준다
            d_form.setAttribute("method", "post");
            d_form.setAttribute("action", url); //매개변수로 받은 주소로 지정
            //폼 안에 필요한 태그요소들 만들기
            let articleNoInput = document.createElement("input");
            articleNoInput.setAttribute("type", "hidden");
            articleNoInput.setAttribute("name", "pet_code");
            articleNoInput.setAttribute("value", pet_code);
            d_form.appendChild(articleNoInput); //만든 태그를 폼 안에 넣어준다
            document.body.appendChild(d_form);//만든 폼을 바디안에 넣어준다
            d_form.submit();
          }
          let petchk = true;
          function petInsert() {
            if (petchk) {
              $("#petInsert").css('display', 'block');
              petchk = false;
            } else {
              alert("반려 동물은 한마리씩 추가가 가능합니다");
            }
          }





        </script>
      </head>

      <body onload="init();">
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
          <h2 class="pagetitlte">마이 페이지</h2>
          <section id="sidebar_Area">
            <div class="sidebars" id="sb_sidebar">

            </div>
          </section>

          <section id="left_Area">
            <div class="profileBox">
              <div class="proimgBox">
                <img class="proImg"
                  src="${contextPath}/user_Page/searchProfil.do?user_id=${log_id}" width="200"
                  alt="사용자 프로필 사진">
              </div>
              <div class="speech_bubble">
                <img class="bubbleImg" src="${contextPath}/resources/img/말풍선.png" alt="말풍선 배경">
                <p><span class="userID">${userVO.user_name}</span>님 환영합니다!</p>
              </div>
            </div>
            <div class="leftCategory">
              <ul class="CatrgoryBox">
                <li class="firstMenu">마이페이지

                  <ul>
                    <li class="secondMenu"><a href="${contextPath}/user_Page/myInfo.do">내 정보 관리</a></li>
                    <li class="secondMenu"><a href="${contextPath}/user_Page/myPetList.do">내 동물 관리</a></li>
                    <li class="secondMenu"><a href="${contextPath}/user_Page/myReview.do">내 리뷰 관리</a></li>
                    <li class="secondMenu"><a href="${contextPath}/user_Page/myQuestion.do">내 질문 관리</a></li>
                  
                  </ul>
                </li>
                <li class="firstMenu">
                  예약관리•이용내역
                  <ul>
                    <li class="secondMenu"><a href="${contextPath}/history">병원 예약 관리</a></li>
                    <li class="secondMenu"><a href="${contextPath}/history/myPetTaxiReserv.do">택시 예약 관리</a></li>
                  </ul>
                </li>
                <li class="firstMenu"><a href="${contextPath }/member/withdrawal.do">회원탈퇴</a></li>
              </ul>
            </div>
          </section>

          <div id="verticalLine"></div>
          <section id="tab_Area">
            <div class="tab_nav">
              <ul class="tab_Btns">
                <li class="tBtn tBtn1 notChoice">
                  <a href="${contextPath}/user_Page/myInfo.do"><span class="pointT">내</span><span>정보</span></a>
                </li>
                <li class="tBtn tBtn2 choiceTabNav">
                  <a href="${contextPath}/user_Page/myPetList.do"><span class="pointT">펫</span><span>정보</span></a>
                </li>

                <li class="tBtn tBtn3 notChoice">
                  <a href="${contextPath}/user_Page/myReview.do"><span class="pointT">내</span><span>리뷰</span></a>
                </li>
                <li class="tBtn tBtn4 notChoice">
                  <a href="${contextPath}/user_Page/myQuestion.do"><span class="pointT">내</span><span>질문</span></a>
                </li>
              </ul>
            </div>
            <div class="tabcontents">
              <div class="fomBtns">
                <button onclick="petInsert();" class="addPetBtn">+ 펫 추가</button>
                <button class="btnOk" onclick="submitForm()">수정하기</button>
              </div>

              <div id="tabBox">

                <c:choose>
                  <c:when test="${!empty petList}">
                    <c:forEach var="petinfo" items="${petList}">

                      <div class="myPetInfoTitle">
                        <div class="inputBck"></div>
                        <form action="${contextPath}/user_Page/modPet.do" name="myPetInfoForm" class="myPetInfoForm"
                          method="post">
                          <fieldset>
                            <legend>내 반려동물 정보 수정 폼</legend>
                            <button type="button" class="delBtn"
                              onclick="delPetInfo('${contextPath}/user_Page/removePetInfo.do', '${petinfo.pet_code}')">- 펫
                              삭제
                            </button>

                            <p>
                              <label class="infoTitle" for="name">반려동물 이름</label>
                              <input class="answer" type="text" id="name" name="pet_name" value="${petinfo.pet_name}"
                                required />
                              <input type="hidden" name="pet_code" value="${petinfo.pet_code}">
                            </p>
                            <p>
                              <label class="infoTitle" for="age">나이</label>
                              <input class="answer" type="number" id="age" name="pet_age" value="${petinfo.pet_age}" />
                            </p>
                            <!-- <p>
                              <label class="infoTitle" for="genderChoice">성별</label>
                              <c:if test="${petinfo.pet_sex==0}"><span style="margin-left:250px;"></span></c:if>
                              <c:if test="${petinfo.pet_sex==1}"><span style="margin-left:250px;"></span></c:if>
                              <label class="genderTitle gt1" for="genderChoice1">♀</label>
                              <input class="answer g_C1" type="radio" id="genderChoice1" name="gender" value="0" />
                              <label class="genderTitle gt2" for="genderChoice2">♂︎</label>
                              <input class="answer g_C2" type="radio" id="genderChoice2" name="gender" value="1" />
                            </p> -->

                            <!-- <p class=".gender">
                              <label class="infoTitle" for="pet_sex">성별</label>
                              <c:set var="pet_sex_f_checked" value="${petinfo.pet_sex eq '0' ? 'checked' : ''}" />
                              <c:set var="pet_sex_m_checked" value="${petinfo.pet_sex eq '1' ? 'checked' : ''}" />
                              <input class=".g_C1 .answer" type="radio" id="pet_sex_f" name="pet_sex" value="0"
                                ${pet_sex_f_checked }>♀
                              <input class=".g_C2 .answer" type="radio" id="pet_sex_m" name="pet_sex" value="1"
                                ${pet_sex_m_checked }>♂
                            </p> -->

                            <p class="gender">
                              <label class="infoTitle" for="pet_sex">성별</label>
                              <c:set var="pet_sex_f_checked" value="${petinfo.pet_sex eq '0' ? 'checked' : ''}" />
                              <c:set var="pet_sex_m_checked" value="${petinfo.pet_sex eq '1' ? 'checked' : ''}" />
                              <label for="pet_sex_f" class="gt1">♀</label>
                              <input class="g_C1 answer" type="radio" id="pet_sex_f" name="pet_sex" value="0"
                                ${pet_sex_f_checked } checked="checked">

                              <label for="pet_sex_m " class="gt2">♂</label>
                              <input class="g_C2 answer" type="radio" id="pet_sex_m" name="pet_sex" value="1"
                                ${pet_sex_m_checked }>

                            </p>


                            <p>
                              <label class="infoTitle" for="race">동물 종</label>
                              <!-- <span style="margin-left:250px;">현재 종 : ${petinfo.pet_types}</span> -->
                              <select name="pet_types" id="petRace" class="answer selectPet" required>
                                <option>${petinfo.pet_types}</option>
                                <option value="개">개</option>
                                <option value="고양이">고양이</option>
                                <option value="소동물">소동물</option>
                                <option value="파충류">파충류</option>
                                <option value="어류">어류</option>
                                <option value="조류">조류</option>
                                <option value="기타">기타</option>
                              </select>
                            </p>
                            <p>
                              <label class="infoTitle" for="petNumber">동물등록번호</label>
                              <input class="answer" type="number" id="petNumber" name="pet_number"
                                value="${petinfo.pet_number}" required />
                            </p>
                            <p>
                              <label class="infoTitle" for="bloodType">혈액형</label>
                              <!-- <span style="margin-left:250px;">현재 혈액형 : ${petinfo.b_type}</span> -->
                              <select name="b_type" id="bloodType" class="answer selectBT" required>
                                <option>${petinfo.b_type} </option>
                                <option value="dea1">DEA1</option>
                                <option value="dea1.1">DEA1.1</option>
                                <option value="dea1.2">DEA1.2</option>
                                <option value="dea3">DEA3</option>
                                <option value="dea4">DEA4</option>
                                <option value="dea5">DEA5</option>
                                <option value="dea7">DEA7</option>
                                <option value="dea8">DEA8</option>
                                <option value="a">A</option>
                                <option value="b">B</option>
                                <option value="ab">AB</option>
                                <option value="o">O</option>
                              </select>
                            </p>
                            <p>
                              <label class="infoTitle" for="weight">몸무게</label>
                              <input class="answer" type="number" id="weight" name="pet_weight"
                                value="${petinfo.pet_weight}" required />
                            </p>
                            <p>
                              <label class="infoTitle" for="notice">유의사항</label>
                              <!-- <input class="answer writeNote" type="text" id="notice" name="notice"
                                value="${petinfo.pet_etc}" /> -->

                              <textarea class="answer writeNote" id="notice" name="pet_etc"
                                maxlength="200">${petinfo.pet_etc}</textarea>

                            </p>

                          </fieldset>
                        </form>
                      </div>
                      <div class="dividLine"></div>

                    </c:forEach>
                  </c:when>
                </c:choose>

                <div class="myPetInfoTitle" style="display:none;" id="petInsert">
                  <div class="inputBck"></div>
                  <form action="${contextPath}/user_Page/addPet.do" name="myPetInfoForm" class="myPetInfoForm"
                    method="post">
                    <fieldset>
                      <legend>내 반려동물 정보 추가 폼</legend>
                      <button type="button" class="delBtn"
                        onclick="delPetInfo('${contextPath}/user_Page/removePetInfo.do', '${petinfo.pet_code}')">- 펫
                        삭제
                      </button>
                      <p>
                        <label class="infoTitle" for="name">반려동물 이름</label>
                        <input class="answer" type="text" id="name" name="pet_name" required />
                      </p>
                      <p>
                        <label class="infoTitle" for="age">나이</label>
                        <input class="answer" type="number" id="age" name="pet_age" required />
                      </p>
                      <p>
                        <label class="infoTitle" for="genderChoice">성별</label>
                        <label class="genderTitle gt1" for="genderChoice1">♀</label>
                        <input class="answer g_C1" type="radio" id="genderChoice1" name="pet_sex" value="0" />
                        <label class="genderTitle gt2" for="genderChoice2">♂︎</label>
                        <input class="answer g_C2" type="radio" id="genderChoice2" name="pet_sex" value="1" />
                      </p>
                      <p>
                        <label class="infoTitle" for="race">동물 종</label>
                        <select name="pet_types" id="petRace" class="answer selectPet" required>
                          <option value="개">개</option>
                          <option value="고양이">고양이</option>
                          <option value="소동물">소동물</option>
                          <option value="파충류">파충류</option>
                          <option value="어류">어류</option>
                          <option value="조류">조류</option>
                          <option value="기타">기타</option>
                        </select>
                      </p>
                      <p>
                        <label class="infoTitle" for="petNumber">동물등록번호</label>
                        <input class="answer" type="number" id="petNumber" name="pet_number" />
                      </p>
                      <p>
                        <label class="infoTitle" for="bloodType">혈액형</label>
                        <select name="b_type" id="bloodType" class="answer selectBT">
                          <option value="dea1">DEA1</option>
                          <option value="dea1.1">DEA1.1</option>
                          <option value="dea1.2">DEA1.2</option>
                          <option value="dea3">DEA3</option>
                          <option value="dea4">DEA4</option>
                          <option value="dea5">DEA5</option>
                          <option value="dea7">DEA7</option>
                          <option value="dea8">DEA8</option>
                          <option value="a">A</option>
                          <option value="b">B</option>
                          <option value="ab">AB</option>
                          <option value="o">O</option>
                        </select>
                      </p>
                      <p>
                        <label class="infoTitle" for="weight">몸무게</label>
                        <input class="answer" type="number" id="weight" name="pet_weight" required />
                      </p>
                      <p>
                        <label class="infoTitle" for="notice">유의사항</label>
                        <input class="answer writeNote" type="text" id="notice" name="pet_etc" />
                      </p>
                      <button class="btnOk" type="submit">추가하기</button>
                    </fieldset>
                  </form>
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

      </html>
