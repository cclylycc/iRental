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


/*
* 房屋信息保存
* */
function submitHouse() {
    $.ajax({
        type: "POST",
        url: "/admin/house/publish/submit",
        async: false,
        data: $("#houseForm").serialize(),
        success: function (data) {
            alert(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.href = "/admin/house";
            }
        }
    });

}

/*
* 下架房屋
* */
function downHouse(id) {
    $.ajax({
        type: "POST",
        url: "/admin/house/down",
        async: false,
        data: {
            "id": id
        },
        success: function (data) {
            alert(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload = "/admin/house";
            }
        }
    });
}

/*
* 上架房屋
* */
function upHouse(id) {
    $.ajax({
        type: "POST",
        url: "/admin/house/up",
        async: false,
        data: {
            "id": id
        },
        success: function (data) {
            alert(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload = "/admin/house";
            }
        }
    });
}


/*
* 房屋审核通过
* */
function checkPassHouse(id) {
    $.ajax({
        type: "POST",
        url: "/admin/house/checkPass",
        async: false,
        data: {
            "id": id
        },
        success: function (data) {
            alert(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}

/*
* 房屋审核驳回
* */
function checkRejectHouse(id) {
    $.ajax({
        type: "POST",
        url: "/admin/house/checkReject",
        async: false,
        data: {
            "id": id
        },
        success: function (data) {
            alert(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}


/*
* 删除房屋
* */
function deleteHouse(id) {
    $.ajax({
        type: "POST",
        url: "/admin/house/delete",
        async: false,
        data: {
            "id": id
        },
        success: function (data) {
            alert(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}

/*
* 收藏房屋提交
* */
function submitMark(id) {
    $.ajax({
        type: "POST",
        url: "/mark/submit",
        async: false,
        data: {
            "houseId": id
        },
        success: function (data) {
            alert(data.msg)
            if (data.msg == "请先登录") {
                window.location.href = "/";
            }
        }
    });
}

/*
* 创建房屋订单
* */
function createOrder() {
    var houseId = $("#houseId").val();
    var endDate = $("#endDate").val();
    $.ajax({
        type: "POST",
        url: "/order/create",
        async: false,
        data: {
            "houseId": houseId,
            "endDate": endDate
        },
        success: function (data) {
            alert(data.msg)
            if (data.msg == "请先登录") {
                window.location.href = "/";
            }
        }
    });
}
