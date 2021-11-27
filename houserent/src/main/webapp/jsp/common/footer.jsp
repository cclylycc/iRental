<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="dark-footer skin-dark-footer style-2" style="padding-top: 0;">
    <div class="footer-bottom">
        <div class="container">
            <p class="mb-0" style="color: white">©2021 爱租房 版权所有 All Rights Reserved.</p>
        </div>
    </div>
</footer>
</body>
</html>
<%--注册--%>
<div class="modal" id="signup">
    <div class="modal-dialog">
        <header>
            <div class="hm-nav">
                <h3 class="hm_nav_title">注册</h3>
                <span class="mod-close" data-dismiss="modal"><i class="ti-close"></i></span>
            </div>
        </header>
        <div class="modal-content" id="sign-up">
            <div class="modal-body">
                <form id="registerForm">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label>姓名</label>
                                <div class="input-with-icon">
                                    <input type="text" name="userDisplayName" class="form-content" placeholder="姓名">
                                    <i class="ti-user"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>电子邮箱</label>
                                <div class="input-with-icon">
                                    <input type="email" name="email" class="form-content" placeholder="电子邮箱，用于找回密码">
                                    <i class="ti-user"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>手机号</label>
                                <div class="input-with-icon">
                                    <input type="text" name="phone" class="form-content" placeholder="手机号">
                                    <i class="ti-user"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>