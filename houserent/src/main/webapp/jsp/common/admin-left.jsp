<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-lg-3 col-md-4 col-sm-12" style="min-height: 850px;">
    <div class="property_dashboard_navbar">
        <div class="dash_user_menues">
            <ul>
                <li <c:if test="${tab == 'my-profile'}"> class="active"</c:if>>
                    <a href="/admin/profile" style="color: white">
                        <i class="ti-user"></i>&nbsp个人信息
                    </a>
                </li>
                <li <c:if test="${tab == 'home'}"> class="active"</c:if>>
                    <a href="/admin/home" style="color: white">
                        <i class="ti-user"></i>&nbsp我的家
                    </a>
                </li>
                <c:if test="${sessionScope.user.role == 'admin' || sessionScope.user.role == 'owner'}">
                    <li <c:if test="${tab == 'house-list'}"> class="active"</c:if>>
                        <a href="/admin/house" style="color: white">
                            <i class="ti-layers"></i>&nbsp房屋管理
                        </a>
                    </li>
                </c:if>
                <li <c:if test="${tab == 'order-list'}"> class="active"</c:if>>
                    <a href="/admin/order" style="color: white">
                        <i class="ti-gift"></i>&nbsp订单管理
                    </a>
                </li>
                <li <c:if test="${tab == 'mark-list'}"> class="active"</c:if>>
                    <a href="/admin/mark" style="color: white">
                        <i class="ti-bookmark"></i>&nbsp我的收藏
                    </a>
                </li>
                <c:if test="${sessionScope.user.role == 'admin'}">
                    <li <c:if test="${tab == 'news-list'}"> class="active"</c:if>>
                        <a href="/admin/news" style="color: white">
                            <i class="ti-new-window"></i>&nbsp新闻资讯
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.user.role == 'admin'}">
                    <li <c:if test="${tab == 'feedback-list'}"> class="active"</c:if>>
                        <a href="/admin/feedback" style="color: white">
                            <i class="ti-alert"></i>&nbsp反馈管理
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</div>