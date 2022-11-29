<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
        <!DOCTYPE html>
        <html>


        <head>
            <%@include file="includes/head.jsp" %>
                <title> Thực đơn </title>

        </head>

        <body class="sub_page">

<<<<<<< HEAD
    <body class="sub_page">

        <div class="hero_area">
            <div class="bg-box">
                <img src="images/hero-bg.jpg" alt="">
            </div>
            <!-- header section strats -->
            <header class="header_section">
                <div class="container">
                    <nav class="navbar navbar-expand-lg custom_nav-container ">
                        <a class="navbar-brand" href="index.jsp">
                            <div class="logo">
                                <img src="./images/logoMain_1.png" class="logo" alt="">
                            </div>
                        </a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class=""> </span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav  mx-auto ">
                                <li class="nav-item ">
                                    <a class="nav-link" href="index.jsp">TRANG CHỦ </a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link " href="menu.jsp">THỰC ĐƠN <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link" href="about.jsp">VỀ CHÚNG TÔI  </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="contact.jsp">LIÊN HỆ</a>
                                </li>
                               
                            </ul>
                            <div class="user_option">
                                <button type="button" class="icon-button">
                                    <span class="material-symbols-outlined">
                                        shopping_bag
                                    </span>
                                    <span class="icon-button__badge">0</span>

                                </button>

                                <% if (session.getAttribute("username") == null) {%>
                                <a href="login.jsp" class="order_online"> Đăng nhập </a>
                                <% } else {%>
                                <a href="" class="order_online"> ${username} </a>
                                <%}%>

                            </div>
                        </div>
                    </nav>
=======
            <div class="hero_area">
                <div class="bg-box">
                    <img src="images/hero-bg.jpg" alt="">
>>>>>>> 8a0f915e0ae1b4e3a64f702076ce18e52c6af6cb
                </div>
                <!-- header section strats -->
                <header class="header_section">
                    <div class="container">
                        <nav class="navbar navbar-expand-lg custom_nav-container ">
                            <a class="navbar-brand" href="index">
                                <div class="logo">
                                    <img src="./images/logoMain.png" class="logo" alt="">
                                </div>
                            </a>

                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class=""> </span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav  mx-auto ">
                                    <li class="nav-item ">
                                        <a class="nav-link" href="index">TRANG CHỦ </a>
                                    </li>
                                    <li class="nav-item active">
                                        <a class="nav-link " href="ThucDon">THỰC ĐƠN <span
                                                class="sr-only">(current)</span></a>
                                    </li>
                                    <li class="nav-item ">
                                        <a class="nav-link" href="about.jsp">VỀ CHÚNG TÔI </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="contact.jsp">LIÊN HỆ</a>
                                    </li>
                                </ul>
                                <div class="user_option">
                                    <button type="button" class="icon-button">
                                        <span class="material-symbols-outlined">
                                            shopping_bag
                                        </span>
                                        <span class="icon-button__badge">0</span>

                                    </button>

                                    <% if (session.getAttribute("username")==null) {%>
                                        <a href="login.jsp" class="order_online"> Đăng nhập </a>
                                        <% } else {%>
                                            <a href="" class="order_online"> ${username} </a>
                                            <%}%>

                                </div>
                            </div>
                        </nav>
                    </div>
                </header>
                <!-- end header section -->
            </div>

            <!-- food section -->

            <section class="food_section layout_padding">
                <div class="container">
                    <div class="heading_container heading_center">
                        <h2>
                            Thực đơn
                        </h2>
                    </div>

                    <ul class="filters_menu">
                        <li class="active" data-filter="*">TẤT CẢ</li>
                        <li data-filter=".cafe">CÀ PHÊ</li>
                        <li data-filter=".tra">TRÀ</li>
                        <li data-filter=".trasu">TRÀ SỮA</li>
                        <li data-filter=".daxay">ĐÁ XAY</li>
                    </ul>

                    <div class="filters-content">
                        <div class="row grid">
                            <c:forEach items="${products}" var="product">
                                <c:if test="${product.category.categoryID==1}">
                                    <div class="col-sm-6 col-lg-4 all cafe">
                                </c:if>
                                <c:if test="${product.category.categoryID==2}">
                                    <div class="col-sm-6 col-lg-4 all tra">
                                </c:if>
                                <c:if test="${product.category.categoryID==3}">
                                    <div class="col-sm-6 col-lg-4 all trasu">
                                </c:if>
                                <c:if test="${product.category.categoryID==4}">
                                    <div class="col-sm-6 col-lg-4 all daxay">
                                </c:if>
                                <div class="box">
                                    <div>
                                        <div class="img-box">
                                            <img src="${product.image}" loading="lazy">
                                        </div>
                                        <div class="detail-box">
                                            <h5>
                                                ${product.productName}
                                            </h5>

                                            <div class="options">
                                                <h6>
                                                    ${product.price} VND
                                                </h6>
                                                <a href="login.jsp">
                                                    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                                                        xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                        viewBox="0 0 456.029 456.029"
                                                        style="enable-background:new 0 0 456.029 456.029;"
                                                        xml:space="preserve">
                                                        <g>
                                                            <g>
                                                                <path
                                                                    d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                                                      c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                                            </g>
                                                        </g>
                                                        <g>
                                                            <g>
                                                                <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                                                      C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                                                      c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                                                      C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                                            </g>
                                                        </g>
                                                        <g>
                                                            <g>
                                                                <path
                                                                    d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                                                    c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                                            </g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                    </svg>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        </c:forEach>
                    </div>
<<<<<<< HEAD
                </div>
                <div class="btn-box">
                    <a href="">
                        Xem thêm
                    </a>
                </div>
            </div>
        </section>
        <!-- footer -->
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
=======
            </section>
            <!-- footer -->
            <%@include file="includes/footer.jsp" %>
        </body>

        </html>
>>>>>>> 8a0f915e0ae1b4e3a64f702076ce18e52c6af6cb
