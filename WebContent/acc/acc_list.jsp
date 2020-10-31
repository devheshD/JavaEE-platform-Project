<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
                  <div class="htc__product__rightidebar">

                     <!-- Start Product View -->
                     <div class="row">
                        <div class="shop__grid__view__wrap">
                           <div role="tabpanel" id="grid-view"
                              class="single-grid-view tab-pane fade in active clearfix">


                              <c:forEach var="vo" items="${alist }">
                                 <!-- Start Single Product -->
                                 <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12 dam">
                                    <div class="category">
                                       <div class="ht__cat__thumb">



                                          <a href="../acc/accDetail.do?product_id=${vo.product_id }">
                                             <img src="${vo.product_main_img}" alt="product images">
                                          </a>
                                       </div>
                                       <div class="fr__hover__info">
                                          <ul class="product__action">
                                             <li>
                                                <button type="button" class="btn btn-info btn-lg subbtn"
                                                   data-toggle="modal" data-target="#myModal1"
                                                   style="padding: 0px;" 
                                                   mTitle="${vo.product_name }" mImage="${vo.product_sub_img1 }">
                                                   <img alt="" src="${vo.product_sub_img1 }" width="50"
                                                      height="50">
                                                </button>
                                             </li>

                                    

                                             <%-- <a class="btn"><img alt=""
                                                   src="${vo.product_sub_img1 }"></a> --%>

                                           
                               



                                          </ul>
                                       </div>
                                       <div class="fr__product__inner">
                                          <h4>
                                             <a href="accDetail.jsp">${vo.product_name }</a>
                                          </h4>
                                          <ul class="fr__pro__prize">
                                             <li class="old__prize">${vo.product_origin_price }
                                                &nbsp;&nbsp;&nbsp;-></li>
                                             <li>${vo.product_dc_price }원</li>
                                          </ul>
                                       </div>
                                    </div>
                                 </div>

                              </c:forEach>
                              <!-- End Single Product -->
								 <div class="modal fade" id="myModal1" role="dialog">
                                                <div class="modal-dialog">

                                                   <!-- Modal content-->
                                                   <div class="modal-content">
                                                      <div class="modal-header">
                                                         <button type="button" class="close"
                                                            data-dismiss="modal">&times;</button>
                                                         <h4 class="modal-title" id="mTitle"></h4>
                                                      </div>
                                                      <div class="modal-body">
                                                         <p>
                                                            <img src="" width="400"
                                                               height="400" id="mImage">
                                                         </p>
                                                      </div>
                                                      <div class="modal-footer">
                                                         <button type="button" class="btn btn-default"
                                                            data-dismiss="modal">Close</button>
                                                      </div>
                                                   </div>

                                                </div>
                                             </div>
                                             
                                             
                           </div>
                           <div role="tabpanel" id="list-view"
                              class="single-grid-view tab-pane fade clearfix">
                              <div class="col-xs-12">
                                 <div class="ht__list__wrap">
                                    <!-- Start List Product -->
                                    <div class="ht__list__product">
                                       <div class="ht__list__thumb">
                                          <a href="accDetail.jsp"><img
                                             src="../images/accessory_img/product-2/pro-1/1.jpg"
                                             alt="product images"></a>
                                       </div>
                                       <div class="htc__list__details">
                                          <h2>
                                             <a href="accDetail.jsp">Product Title Here </a>
                                          </h2>
                                          <ul class="pro__prize">
                                             <li class="old__prize">$82.5</li>
                                             <li>$75.2</li>
                                          </ul>
                                          <ul class="rating">
                                             <li><i class="icon-star icons"></i></li>
                                             <li><i class="icon-star icons"></i></li>
                                             <li><i class="icon-star icons"></i></li>
                                             <li class="old"><i class="icon-star icons"></i></li>
                                             <li class="old"><i class="icon-star icons"></i></li>
                                          </ul>
                                          <p>Lorem ipsum dolor sit amet, consectetur adipisLorem
                                             ipsum dolor sit amet, consec adipisicing elit, sed do
                                             eiusmod tempor incididunt ut labore et dolore magna
                                             aliqul Ut enim ad minim veniam, quis nostrud exercitation
                                             ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                          <div class="fr__list__btn">
                                             <a class="fr__btn" href="cart.html">Add To Cart</a>
                                          </div>
                                       </div>
                                    </div>
                                    <!-- End List Product -->
                                    <!-- Start List Product -->
                                    <div class="ht__list__product">
                                       <div class="ht__list__thumb">
                                          <a href="accDetail.jsp"><img
                                             src="../images/accessory_img/product-2/pro-1/2.jpg"
                                             alt="product images"></a>
                                       </div>
                                       <div class="htc__list__details">
                                          <h2>
                                             <a href="accDetail.jsp">Product Title Here </a>
                                          </h2>
                                          <ul class="pro__prize">
                                             <li class="old__prize">$82.5</li>
                                             <li>$75.2</li>
                                          </ul>
                                          <ul class="rating">
                                             <li><i class="icon-star icons"></i></li>
                                             <li><i class="icon-star icons"></i></li>
                                             <li><i class="icon-star icons"></i></li>
                                             <li class="old"><i class="icon-star icons"></i></li>
                                             <li class="old"><i class="icon-star icons"></i></li>
                                          </ul>
                                          <p>Lorem ipsum dolor sit amet, consectetur adipisLorem
                                             ipsum dolor sit amet, consec adipisicing elit, sed do
                                             eiusmod tempor incididunt ut labore et dolore magna
                                             aliqul Ut enim ad minim veniam, quis nostrud exercitation
                                             ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                          <div class="fr__list__btn">
                                             <a class="fr__btn" href="cart.html">Add To Cart</a>
                                          </div>
                                       </div>
                                    </div>
                                    <!-- End List Product -->
                                    <!-- Start List Product -->
                                    <div class="ht__list__product">
                                       <div class="ht__list__thumb">
                                          <a href="accDetail.jsp"><img
                                             src="../images/accessory_img/product-2/pro-1/3.jpg"
                                             alt="product images"></a>
                                       </div>
                                       <div class="htc__list__details">
                                          <h2>
                                             <a href="accDetail.jsp">Product Title Here </a>
                                          </h2>
                                          <ul class="pro__prize">
                                             <li class="old__prize">$82.5</li>
                                             <li>$75.2</li>
                                          </ul>
                                          <ul class="rating">
                                             <li><i class="icon-star icons"></i></li>
                                             <li><i class="icon-star icons"></i></li>
                                             <li><i class="icon-star icons"></i></li>
                                             <li class="old"><i class="icon-star icons"></i></li>
                                             <li class="old"><i class="icon-star icons"></i></li>
                                          </ul>
                                          <p>Lorem ipsum dolor sit amet, consectetur adipisLorem

                                             ipsum dolor sit amet, consec adipisicing elit, sed do
                                             eiusmod tempor incididunt ut labore et dolore magna
                                             aliqul Ut enim ad minim veniam, quis nostrud exercitation
                                             ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                          <div class="fr__list__btn">
                                             <a class="fr__btn" href="cart.html">Add To Cart</a>
                                          </div>
                                       </div>
                                    </div>
                                    <!-- End List Product -->
                                    <!-- Start List Product -->
                                    <div class="ht__list__product">
                                       <div class="ht__list__thumb">
                                          <a href="accDetail.jsp"><img
                                             src="../images/accessory_img/product-2/pro-1/4.jpg"
                                             alt="product images"></a>
                                       </div>
                                       <div class="htc__list__details">
                                          <h2>
                                             <a href="accDetail.jsp">Product Title Here </a>
                                          </h2>
                                          <ul class="pro__prize">
                                             <li class="old__prize">$82.5</li>
                                             <li>$75.2</li>
                                          </ul>
                                          <ul class="rating">
                                             <li><i class="icon-star icons"></i></li>
                                             <li><i class="icon-star icons"></i></li>
                                             <li><i class="icon-star icons"></i></li>
                                             <li class="old"><i class="icon-star icons"></i></li>
                                             <li class="old"><i class="icon-star icons"></i></li>
                                          </ul>
                                          <p>Lorem ipsum dolor sit amet, consectetur adipisLorem
                                             ipsum dolor sit amet, consec adipisicing elit, sed do
                                             eiusmod tempor incididunt ut labore et dolore magna
                                             aliqul Ut enim ad minim veniam, quis nostrud exercitation
                                             ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                          <div class="fr__list__btn">
                                             <a class="fr__btn" href="cart.html">Add To Cart</a>
                                          </div>
                                       </div>
                                    </div>
                                    <!-- End List Product -->
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <!-- End Product View -->
                  </div>
</body>
</html>