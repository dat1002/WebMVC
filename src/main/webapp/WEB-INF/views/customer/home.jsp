<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Shop 79</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/> 
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">

    <!-- css -->
    <jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
    <link rel="icon" href="${base}/images/b.png" type="image/gif" sizes="16x16">
</head>
<body>

  <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
  <main>
        <!-- Đây là baner -->
        <div class="body">
          <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
              </div>
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="../images/banner1.png" class="d-block w-100" alt="...">
                  <div class="carousel-caption d-none d-md-block">
                  </div>
                </div>
                <div class="carousel-item">
                  <img src="../images/banner2.png" class="d-block w-100" alt="...">
                  <div class="carousel-caption d-none d-md-block">
                  </div>
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
          </div>
          <!-- Nội dung body -->
          <div class="list-products">
              <c:forEach items="${categoryList.data}" var="category">
                <div class="list-product">
                  <div class="title-list">
                      <a  href="${base}/category/${category.seo}">${category.name}</a>
                  </div>
                    <div class="MultiCarousel" data-items="1,3,5,6" data-slide="1" id="MultiCarousel"  data-interval="1000">
                        <div class="MultiCarousel-inner d-flex" style="margin-bottom: 30px;">
                            <c:forEach items="${productList.data}" var="product">
                                <c:if test="${product.getCategories().getId() == category.id}">
                                    <div class="item ">
                                      <div class="product">
                                        <div class="card" style="width: 18rem;" >
                                            <a href="${base }/details/${product.seo}"><img src="${base}/upload/${product.avatar}" class="card-img-top" alt="..." width="100%"> </a>
                                            <div class="card-body">
                                              <h6 class="mb-1 card-title">${product.title}</h6>
                                              <span class="pe-2 price-sale" style="font-size: 15px;">
                                                <fmt:setLocale value="vi_VN" scope="session" />
                                                <fmt:formatNumber value="${product.priceSale }" type="currency" />
                                              </span>
                                              <span class="price" style="text-decoration: line-through; margin-right: 5px; color: rgb(110, 110, 110); font-size: 14px;">
                                                <fmt:setLocale value="vi_VN" scope="session" />
                                                <fmt:formatNumber value="${product.price }" type="currency" />
                                               </span>
                                            </div>
                                            <div class="card-body-2">
                                              <a type="button" class="by-now " onclick="javascript:AddToCart('${base }', ${product.id}, 1);">
                                                <i class="fas fa-cart-plus"></i>
                                                <h6>Mua nhanh</h6>
                                              </a>
                                              <h4 >|</h4>
                                              <a href="${base }/details/${product.seo}" class="card-link ">
                                                <i class="fas fa-eye"></i>
                                                <h6>Xem chi tiết</h6>
                                              </a>
                                            </div>
                                        </div>
                                      </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                        <button type="button" class="btn btn-primary leftLst"><i class="fas fa-chevron-left"></i></button>
                        <button type="button" class="btn btn-primary rightLst"><i class="fas fa-chevron-right"></i></button>
                    </div>
              </div>
              </c:forEach>
          </div>
          <div class="link-to-zalo">
            <a href="https://zalo.me/0972395389">
            <img src="../images/logo-zalo-vector.png" width="100%" alt="">
            </a>
          </div>
      </div>
    </main>

  <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
</body>
    <!-- JS -->
   <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</html>
