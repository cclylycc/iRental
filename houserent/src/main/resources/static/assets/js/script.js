/*
* 注册提交
* */
function submitRegister() {
    $.ajax({
        type: "POST",
        url: "/register/submit",
        async: false,
        data: $("#registerForm").serialize(),
        success: function (data) {
            alert(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload();
            }
        }
    });

}

/*
* 登录提交
* */
function submitLogin() {
    $.ajax({
        type: "POST",
        url: "/login/submit",
        async: false,
        data: $("#loginForm").serialize(),
        success: function (data) {
            alert(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload();
            }
        }
    });

}

