<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />

<!DOCTYPE html>
<html>
<head>
<c:import url='/WEB-INF/views/include/common_head.jsp' />
<title>Petner</title>
<style>
  .container{margin-top:0;}

  .main h3{
    font-size: 4rem;
    line-height: 4.2rem;
    padding-bottom: 68px;
  }
  .main h4{
    font-size: 3rem;
    padding-bottom: 45px;
    text-align: center;
  }

  .main_visual{
    position: relative;
    height: 620px;
    overflow: hidden;
    /* outline: 1px solid red; */}
  .main_visual video{width: 100%; }
  .main_visual .title{
    position:absolute;
    bottom:18%; 
    left:10%;
    /* outline:red 1px solid; */
    color:#fff;
  }
  .main_visual .title .text{
    font-size: 6rem;
    font-weight: 900;
    line-height: 76px;
    padding-bottom: 20px;
  }
  .main_visual .title .btn{
    background: #F9B25C;
    width: fit-content;
    font-size: 2.8rem;
    padding: 12px 36px;
    border-radius: 40px;
  }

  .service_desc{
    text-align: center;
    padding: 70px 0;
  }
  .service_desc > div:not(:last-child){padding-bottom:54px}
  
  .service_desc .title{
    text-decoration: underline;
    font-size: 2.4rem;
    font-weight: 500;
    padding-bottom: 18px;

  }
  .service_desc .desc{}
  .service_desc .desc > p{padding-bottom: 10px;}

  .review{
    padding: 70px 0;
    background-color: #F7F7F8;
  }
  
  .matching_service{
    padding:120px 0;
  }
  
  .join_petner{
    background-color:#FEAC48;
    padding:140px 0;
    color:#fff;
    margin-bottom: -50px;;
  }
  .join_petner .inner{
    width:1000px; 
    margin:0 auto;
    display: flex;
    justify-content: space-between;
  }
  .join_petner h3{padding-bottom: 18px;}
  .join_petner .text_area{
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }
  .join_petner .text_area .intro{line-height: 20px;}
  .join_petner .img_area{width:40%}
  .join_petner img{width:100%}
  .join_petner .btn_area{}
  .join_petner .btn_area a{
    display: block;
    border: 1px solid #fff;
    padding: 14px 28px;
    border-radius: 40px;
    width: fit-content;
    margin-top: 20px;
    font-size: 2rem;
  }

  .join_petner .btn_area a:hover{
    background-color: #fff;
    color:#FEAC48
  }
  
 
</style>
</head>
<body>
	<div id="wrapper">
		<!-- HEADER BASIC -->
		<c:import url='/WEB-INF/views/include/header.jsp' />
		
		<!-- CONTAINER -->
    <div class="container main">
      <!-- 비디오 -->
      <div class="main_visual">
        <video autoplay loop muted type="video.mp4">
          <source src="${imgPath}/petner_main_video.mp4"/>
        </video>
        <div class="title">
          <p class="text">펫시터의 도움이 <br> 지금 필요해요</p>
          <p class="btn"><a href="#">회원가입하기</a></p>
        </div>
      </div>
      <!-- 섹션1 서비스 설명 -->
      <div class="service_desc ">
        <h3>필요할때 언제든지 <br> 펫시터를 부르세요</h3>
        <div>
          <p class="title">안전한 산책</p>
          <div class="desc">
            <p>목줄과 하네스가 연결된 이중산책줄을 통해 안전하게 산책합니다.</p>
            <p>* 목줄은 비상시에만 활용되며 평소 산책시에는 목에 무리가 가지 않도록 설계되었습니다.</p>
          </div>
        </div>
        <div>
          <p class="title">배식 및 환경정리</p>
          <div class="desc">
            <p>요청사항에 맞는 식사를 급여하며배변 치우기 등 간단한 환경정리를 진행합니다.</p>
          </div>
        </div>
        <div>
          <p class="title">다양한 실내놀이</p>
          <div class="desc">
            <p>기상 상황에 의해 산책이 어려울 땐 실내놀이를 합니다.</p>
          </div>
        </div>
        <div>
          <p class="title">환경 맞춤 돌봄</p>
          <div class="desc">
            <p>노령견 또는 환견의 경우, 요청사항에 따라일대일 맞춤 돌봄을 진행합니다.</p>
          </div>
        </div>
      </div>


				<!-- Container.1 -->
				<div class="container_1">
					<!-- video -->
					<video autoplay controls loop muted poster="" preload="auto"
						width="100%" height="auto" src="${imgPath}/petner_main_video.mp4">
						<source src="xxx" type="yyy">
						<!-- 동영상 -->
					</video>
					<div class="section">
						<h1>
							펫시터 도움이<br>지금 필요해요
						</h1>
						<button class="main_btn">
							<a href="./join">가입하기</a>
						</button>
					</div>

				</div>

				<!-- Container.2 -->
				<div class="container_2">
					<div class="section">
						<div>
							<h1>
								<span>오늘은</span><br> 펫트너와 함께
							</h1>
							<p>가나다라 마바사 어쩌고 저쩌고 샬라샬라<br>
							rksksadlfjafeㅁ니아러미ㅏㅓㄹㅁㄷ리ㅏㅓ
							</p>
						</div>

					</div>
					<img src="${imgPath}/main_img1.png">
				</div>

			</div>
		

		<c:if test="${not empty authUser}">
			<div class="container">로그인 후 화면 (with 세션) 
			<p>자동 로그인(${authUser.sessionlimit})까지</p></div>
		</c:if>
		

       <!-- 후기영역 // 데이터로처리? -->
       <div class="review">
        <h4>펫트너 후기</h4>
        <ul>
          <li>
            
          </li>
          
        </ul>
      </div>
      
      <!-- 매칭서비스 설명  -->
      <div class="service_desc matching_service">
        <h3>믿을수 있고 <br> 안심할 수 있어요</h3>
        <p class="intro">철저한 인증, 충분한 대화후 매칭 가능</p>
      </div>


      <!-- 가입유도화면 -->
      <div class="join_petner">
        <div class="inner">
          <div class="text_area">
            <div>
              <h3>펫트너 파트너로 함께해요!</h3>
              <p class="intro">반려가족에게 행복한 시간을 선물할 수 있도록 <br> 펫트너와 함께 성장할 파트너를 찾습니다.</p>
            </div>
            <div class="btn_area">
              <a class="transition02" href="">펫시터 가입 <i class="fa-solid fa-arrow-right"></i></a>
              <a class="transition02" href="">보호자 가입 <i class="fa-solid fa-arrow-right"></i></a>
            </div>
          </div>
          <div class="img_area">
            <img src="${imgPath}/main_img1.png" alt="">
          </div>
        </div>
      </div>
    </div>
		<!-- FOOTER BASIC -->
		<c:import url='/WEB-INF/views/include/footer.jsp' />

	</div>
</body>
</html>