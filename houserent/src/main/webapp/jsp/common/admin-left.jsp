<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-lg-3 col-md-4 col-sm-12">
    <div class="property_dashboard_navbar">
        <div class="dash_user_menues">
            <ul>
                <li <c:if test="${tab == 'my-profile'}"> class="active"</c:if>>
                    <a href="/admin/profile" style="color: white">
                        <i class="ti-user"></i>&nbsp个人中心
                    </a>
                </li>
                <li <c:if test="${tab == 'house-list'}"> class="active"</c:if>>
                    <a href="/admin/house" style="color: white">
                        <i class="ti-layers"></i>&nbsp房屋管理
                    </a>
                </li>
                <li <c:if test="${tab == 'order-list'}"> class="active"</c:if>>
                    <a href="/admin/order" style="color: white">
                        <i class="ti-gift"></i>&nbsp订单管理
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>