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
            swal(data.msg)
            if (data.code == 1) { //如果成功，前往更新资料
                window.location.href = "/admin/profile";
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

            if (data.code == 1) { //如果成功，刷新页面
                swal(data.msg)
                window.location.reload();
            } else {
                swal({
                    text: data.msg,
                    icon: "error",
                });
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
            if (data.code == 1) { //如果成功，刷新页面
                swal(data.msg)
                window.location.href = "/admin/house";
            } else {
                swal({
                    text: data.msg,
                    icon: "error",
                });
            }
        }
    });

}

/*
* 下架房屋
* */
function downHouse(id) {
    swal({
        title: "关键操作提醒！",
        text: "您即将下架房屋，确定要下架吗？",
        icon: "warning",
        buttons: ["取消", "确定下架"],
        dangerMode: true,
    })
        .then((willDownHouse) => {
            if (willDownHouse) {
                $.ajax({
                    type: "POST",
                    url: "/admin/house/down",
                    async: false,
                    data: {
                        "id": id
                    },
                    success: function (data) {
                        if (data.code == 1) { //如果成功，刷新页面
                            swal(data.msg), {icon: "success"},
                                window.location.reload();
                        } else {
                            swal({
                                text: data.msg,
                                icon: "error",
                            });
                        }
                    }
                });
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
            swal(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload();
            } else {
                swal({
                    text: data.msg,
                    icon: "error",
                });
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
            swal(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload();
            } else {
                swal({
                    text: data.msg,
                    icon: "error",
                });
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
            swal(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload();
            } else {
                swal({
                    text: data.msg,
                    icon: "error",
                });
            }
        }
    });
}


/*
* 删除房屋
* */
function deleteHouse(id) {
    swal({
        title: "关键操作提醒！",
        text: "您即将删除房屋，确定要删除吗？",
        icon: "warning",
        buttons: ["取消", "确定删除"],
        dangerMode: true,
    })
        .then((willDeleteHouse) => {
            if (willDeleteHouse) {
                $.ajax({
                    type: "POST",
                    url: "/admin/house/delete",
                    async: false,
                    data: {
                        "id": id
                    },
                    success: function (data) {
                        if (data.code == 1) { //如果成功，刷新页面
                            swal(data.msg), {icon: "success"},
                                window.location.reload();
                        } else {
                            swal({
                                text: data.msg,
                                icon: "error",
                            });
                        }
                    }
                });
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
            swal(data.msg)
            if (data.msg == "请先登录") {
                window.location.href = "/";
            } else {
                swal({
                    text: data.msg,
                    icon: "error",
                });
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
            swal(data.msg)
            if (data.msg == "请先登录") {
                window.location.href = "/";
            }
            //如果创建成功，跳转到签订合同页面。
            if (data.code == 1) {
                window.location.href = "/order/agreement/view?orderId=" + data.result;
            }
        }
    });
}

/*
* 完成签订合同步骤
* */
function confirmAgreement(orderId) {
    $.ajax({
        type: "POST",
        url: "/order/agreement/submit",
        async: false,
        data: {
            "orderId": orderId
        },
        success: function (data) {
            swal(data.msg)
            if (data.msg == "请先登录") {
                window.location.href = "/";
            }
            //如果创建成功，跳转到支付页面。
            if (data.code == 1) {
                window.location.href = "/order/pay?orderId=" + data.result;
            }
        }
    });
}


/*
* 模拟支付成功
* */
function submitPay(orderId, payMethod) {
    $.ajax({
        type: "POST",
        url: "/order/pay/submit",
        async: false,
        data: {
            "orderId": orderId,
            "payMethod": payMethod
        },
        success: function (data) {
            swal(data.msg)
            if (data.msg == "请先登录") {
                window.location.href = "/";
            }
            //如果支付成功，跳转到我的家页面。
            if (data.code == 1) {
                window.location.href = "/admin/home";
            }
        }
    });
}


/*
* 发送邮件联系房东
* */
function submitContact() {
    $.ajax({
        type: "POST",
        url: "/house/contact",
        async: false,
        data: $('#contactForm').serialize(),
        success: function (data) {
            swal(data.msg)
            if (data.msg == "请先登录") {
                window.location.href = "/";
            }
            //如果发送成功，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}

/*个人信息保存*/
function submitProfile() {
    swal({
        title: "关键操作提醒！",
        text: "您即将修改您的个人信息，确定要修改吗？",
        icon: "warning",
        buttons: ["取消", "确定更改"],
        dangerMode: true,
    })
        .then((willChangeProfile) => {
            if (willChangeProfile) {
                $.ajax({
                    type: "POST",
                    url: "/admin/profile/submit",
                    async: false,
                    data: $("#profileForm").serialize(),
                    success: function (data) {
                        if (data.code == 1) { //如果成功，刷新页面
                            swal(data.msg), {icon: "success"},
                                window.location.reload();
                        } else {
                            swal({
                                text: data.msg,
                                icon: "error",
                            });
                        }
                    }
                });
            }
        });
}

/*取消订单*/
function cancelOrder(orderId) {
    $.ajax({
        type: "POST",
        url: "/admin/order/cancel",
        async: false,
        data: {
            'orderId': orderId
        },
        success: function (data) {
            swal(data.msg)
            //如果更新，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            } else {
                swal({
                    text: data.msg,
                    icon: "error",
                });
            }
        }
    });
}


/*申请退租*/
function endOrder(orderId) {
    $.ajax({
        type: "POST",
        url: "/admin/order/end",
        async: false,
        data: {
            'orderId': orderId
        },
        success: function (data) {
            swal(data.msg)
            //如果更新，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            } else {
                swal({
                    text: data.msg,
                    icon: "error",
                });
            }
        }
    });
}


/*退租申请 通过*/
function endOrderPass(orderId) {
    $.ajax({
        type: "POST",
        url: "/admin/order/endPass",
        async: false,
        data: {
            'orderId': orderId
        },
        success: function (data) {
            swal(data.msg)
            //如果更新，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            } else {
                swal({
                    text: data.msg,
                    icon: "error",
                });
            }
        }
    });
}


/*退租申请 拒绝*/
function endOrderReject(orderId) {
    $.ajax({
        type: "POST",
        url: "/admin/order/endReject",
        async: false,
        data: {
            'orderId': orderId
        },
        success: function (data) {
            swal(data.msg)
            //如果更新，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            } else {
                swal({
                    text: data.msg,
                    icon: "error",
                });
            }
        }
    });
}


/*取消收藏功能*/
function cancelMark(id) {
    $.ajax({
        type: "POST",
        url: "/admin/mark/cancel",
        async: false,
        data: {
            'id': id
        },
        success: function (data) {
            swal(data.msg)
            //如果更新，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            } else {
                swal({
                    text: data.msg,
                    icon: "error",
                });
            }
        }
    });
}


/*删除新闻功能*/
function deleteNews(id) {
    swal({
        title: "关键操作提醒！",
        text: "您即将删除新闻，确定要删除吗？",
        icon: "warning",
        buttons: ["取消", "确定删除"],
        dangerMode: true,
    })
        .then((willDeleteNews) => {
            if (willDeleteNews) {
                $.ajax({
                    type: "POST",
                    url: "/admin/news/delete",
                    async: false,
                    data: {
                        "id": id
                    },
                    success: function (data) {
                        if (data.code == 1) { //如果成功，刷新页面
                            swal(data.msg), {icon: "success"},
                                window.location.reload();
                        } else {
                            swal({
                                text: data.msg,
                                icon: "error",
                            });
                        }
                    }
                });
            }
        });
}


/*
* 房屋信息保存
* */
function submitNews() {
    swal({
        title: "关键操作提醒！",
        text: "您即将发布新闻，确定要发布吗？",
        icon: "warning",
        buttons: ["取消", "确定发布"],
        dangerMode: true,
    })
        .then((willSubmitNews) => {
            if (willSubmitNews) {
                $.ajax({
                    type: "POST",
                    url: "/admin/news/publish/submit",
                    async: false,
                    data: $("#newsForm").serialize(),
                    success: function (data) {
                        if (data.code == 1) { //如果成功，刷新页面
                            swal(data.msg), {icon: "success"},
                                window.location.reload();
                        } else {
                            swal({
                                text: data.msg,
                                icon: "error",
                            });
                        }
                    }
                });
            }
        });
}


/*
* 提交用户反馈
* */
function submitFeedback() {
    $.ajax({
        type: "POST",
        url: "/feedback/submit",
        async: false,
        data: $("#feedbackForm").serialize(),
        success: function (data) {
            swal(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload();
            } else {
                swal({
                    text: data.msg,
                    icon: "error",
                });
            }
        }
    });
}

/*
* 给回复提交的ID赋值
* */
function showReplyModal(id) {
    $("#feedbackId").val(id);
}

/*
* 回复反馈
* */
function feedbackReplySumbit() {
    $.ajax({
        type: "POST",
        url: "/admin/feedback/reply/submit",
        async: false,
        data: $("#feedbackForm").serialize(),
        success: function (data) {
            swal(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload();
            } else {
                swal({
                    text: data.msg,
                    icon: "error",
                });
            }
        }
    });
}


/*删除反馈*/
function deleteFeedback(id) {
    $.ajax({
        type: "POST",
        url: "/admin/feedback/delete",
        async: false,
        data: {
            'id': id
        },
        success: function (data) {
            swal(data.msg)
            //如果更新，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            } else {
                swal({
                    text: data.msg,
                    icon: "error",
                });
            }
        }
    });
}


/*禁用用户*/
function disableUser(id) {
    $.ajax({
        type: "POST",
        url: "/admin/user/disable",
        async: false,
        data: {
            'id': id
        },
        success: function (data) {
            swal(data.msg)
            //如果更新，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            } else {
                swal({
                    text: data.msg,
                    icon: "error",
                });
            }
        }
    });
}


/*启用用户*/
function enableUser(id) {
    $.ajax({
        type: "POST",
        url: "/admin/user/enable",
        async: false,
        data: {
            'id': id
        },
        success: function (data) {
            swal(data.msg)
            //如果更新，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            } else {
                swal({
                    text: data.msg,
                    icon: "error",
                });
            }
        }
    });
}


/*
* 修改密码
* */
function submitPassword() {
    swal({
        title: "关键操作提醒！",
        text: "您即将修改您的密码，确定要修改吗？",
        icon: "warning",
        buttons: ["取消", "确定更改"],
        dangerMode: true,
    })
        .then((willChangePassword) => {
            if (willChangePassword) {
                $.ajax({
                    type: "POST",
                    url: "/admin/password/submit",
                    async: false,
                    data: $("#passwordForm").serialize(),
                    success: function (data) {
                        if (data.code == 1) { //如果成功，刷新页面
                            swal(data.msg), {icon: "success"},
                                window.location.reload();
                        } else {
                            swal({
                                text: data.msg,
                                icon: "error",
                            });
                        }
                    }
                });
            }
        });
}

/*
* REDEEM 兑换充值卡 充值到用户账号余额
* */
function redeemGiftCard() {
    $.ajax({
        type: "POST",
        url: "/admin/giftcard/redeem",
        async: false,
        data: $("#giftcardForm").serialize(),
        success: function (data) {

            if (data.code == 1) { //如果成功，刷新页面
                swal(data.msg)
                window.location.reload();
            } else {
                swal({
                    text: data.msg,
                    icon: "error",
                });
            }
        }
    });
}

/*
* 找回密码功能
* */
function submitPasswordReset() {
    $.ajax({
        type: "POST",
        url: "/login/resetPassword",
        async: false,
        data: $("#forgetPasswordForm").serialize(),
        success: function (data) {
            if (data.code == 1) { //如果成功，刷新页面
                swal({
                    text: data.msg,
                    icon: "success",
                });
                window.location.reload();
            } else {
                swal({
                    text: data.msg,
                    icon: "error",
                });
            }
        }
    });
}