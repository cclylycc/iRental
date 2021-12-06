package com.javaclimb.houserent.common.base;

import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;

//所有controller控制器的基类
@Controller
public class BaseController {
    @Autowired
    protected HttpServletRequest request;

    /*
     * 获取当前登录用户
     * */
    public User getLoginUser() {
        User user = (User) request.getSession().getAttribute(Constant.SESSION_USER_KEY);
        return user;
    }

    /*
     * 获取当前用户ID
     * */
    public Long getLoginUserId() {
        User user = getLoginUser();
        if (user == null) {
            return null;
        } else {
            return user.getId();
        }
    }
}
