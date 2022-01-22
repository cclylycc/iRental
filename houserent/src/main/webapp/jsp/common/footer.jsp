<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="dark-footer skin-dark-footer style-2" style="padding-top: 0;">
    <style>
        .footer-bottom a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            font-family: 'Shift', sans-serif;
        }
    </style>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-12">

                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <img src="/assets/img/logo/ihouse.png" width="200px;" height="50px;"><br>
                    <p style="font-family: 'Shift', sans-serif;">
                        爱租房（iRental）是一家联系旅游人士和家有空房出租的房主的服务型网站，它可以为用户提供多样的住宿信息。iRental是一个旅行房屋租赁社区，用户可通过网络或手机应用程序发布、搜索度假房屋租赁信息并完成在线预定程序。</p>
                </div>
                <div class="col-md-3">
                    <h4 style="font-family: 'Shift', sans-serif;font-size: 18px;font-weight: bold;">爱租房</h4>
                    <a>工作机会</a><br>
                    <a href="/news">新闻</a><br>
                    <a>政策</a><br>
                </div>
                <div class="col-md-3">
                    <h4 style="font-family: 'Shift', sans-serif;font-size: 18px;font-weight: bold;">出租</h4>
                    <a href="/news/detail/9">为什么要出租？</a><br>
                    <a href="/news/detail/10">待客之道</a><br>
                    <a>房东义务</a><br>
                </div>
                <div class="col-md-3">
                    <h4 style="font-family: 'Shift', sans-serif;font-size: 18px;font-weight: bold;">客服支持</h4>
                    <a href="/feedback">帮助</a><br>
                    <a href="/feedback">反馈</a><br>
                    <a href="/feedback">联系我们</a><br>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-12">
                    <p class="mb-0" style="color: white;font-family: 'Shift', sans-serif;text-align: center;">©2021 爱租房
                        版权所有 All Rights Reserved.</p>

                </div>
            </div>
        </div>
    </div>
</footer>
</body>
</html>
<%--注册--%>
<div class="modal" id="signup">
    <div class="modal-dialog">
        <header>
            <div class="hm_nav">
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
                                    <input type="text" name="userDisplayName" class="form-control" placeholder="姓名">
                                    <i class="ti-user"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>电子邮箱</label>
                                <div class="input-with-icon">
                                    <input type="email" name="email" class="form-control" placeholder="电子邮箱，用于找回密码">
                                    <i class="ti-user"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>手机号</label>
                                <div class="input-with-icon">
                                    <input type="text" name="phone" class="form-control" placeholder="手机号">
                                    <i class="ti-mobile"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>账号</label>
                                <div class="input-with-icon">
                                    <input type="text" name="userName" class="form-control" placeholder="登录账号">
                                    <i class="ti-user"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>密码</label>
                                <div class="input-with-icon">
                                    <input type="password" name="userPass" class="form-control" placeholder="登录密码">
                                    <i class="ti-unlock"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>角色</label>
                                <div class="input-with-icon">
                                    <div class="simple">
                                        <select name="role" class="form-control">
                                            <option value="customer">我是租客</option>
                                            <option value="owner">我是房东</option>
                                        </select>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <button type="button" onclick="submitRegister()" class="btn btn-md full-width pop-login bg-2">
                            立即注册
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>


<%--登录--%>
<div class="modal" id="login">
    <div class="modal-dialog">
        <header>
            <div class="hm_nav">
                <h3 class="hm_nav_title">登录</h3>
                <span class="mod-close" data-dismiss="modal"><i class="ti-close"></i></span>
            </div>
        </header>
        <div class="modal-content">
            <div class="modal-body">
                <form id="loginForm">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label>账号</label>
                                <div class="input-with-icon">
                                    <input type="text" name="userName" class="form-control" placeholder="请输入账号">
                                    <i class="ti-user"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>密码</label>
                                <div class="input-with-icon">
                                    <input type="password" name="userPass" class="form-control" placeholder="请输入密码">
                                    <i class="ti-unlock"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <button type="button" onclick="submitLogin()" class="btn btn-md full-width pop-login bg-2">
                            立即登录
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>