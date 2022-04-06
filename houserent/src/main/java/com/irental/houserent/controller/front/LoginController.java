package com.irental.houserent.controller.front;

import com.irental.houserent.common.constant.Constant;
import com.irental.houserent.common.dto.JsonResult;
import com.irental.houserent.common.enums.UserStatusEnum;
import com.irental.houserent.common.util.MailUtil;
import com.irental.houserent.common.util.VerificationCode;
import com.irental.houserent.entity.User;
import com.irental.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

/*
 * 登录相关的控制器
 * */
@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private UserService userService;

    /*
     * 注册提交
     * */
    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult loginSubmit(User user, HttpSession session) {
        if (user == null) {
            return JsonResult.error("接收到非法操作，请重试！");
        }
        User user1 = userService.findByUserName(user.getUserName());
        if (user1 == null) {
            return JsonResult.error("您输入的用户不存在，请重试。");
        }
        //判断密码是否正确
        if (!user.getUserPass().equals(user1.getUserPass())) {
            return JsonResult.error("您输入的密码错误，请重试。");
        }
        if (UserStatusEnum.DISABLE.getValue().equals(user1.getStatus())) {
            return JsonResult.error("此账户已被系统锁定，请联系我们获取更多帮助。");
        }
        session.setAttribute(Constant.SESSION_USER_KEY, user1);
        return JsonResult.success("登录成功，欢迎回来！");
    }

    /*
     * 退出登录，返回首页
     * */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute(Constant.SESSION_USER_KEY);
        session.invalidate();
        return "redirect:/";
    }

    /*
     * 用户密码 邮箱 找回
     * */
    @RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult resetPassword(User user, HttpSession session) throws Exception {
        User user1 = userService.findByUserName(user.getUserName());
        if (user == null) {
            return JsonResult.error("请填写完整后尝试！");
        }
        if (user.getUserName().equals("") || user.getEmail().equals("")) {
            return JsonResult.error("请填写完整后尝试！");
        }
        if (user1.getUserName().equals(user.getUserName()) && user1.getEmail().equals(user.getEmail())) {
            StringBuilder sb = new StringBuilder();
            sb.append("这是一封找回密码的邮件。").append("<br/>");
            sb.append("账号：").append(user1.getUserName()).append("<br/>");
            sb.append("邮箱：").append(user1.getEmail()).append("<br/>");
            sb.append("原密码：").append(user1.getUserPass()).append("<br/>");
            sb.append("请立即登录到账号并修改密码，如果不是本人操作，请忽略。").append("<br/>");
            sb.append("爱租房 2022 Inc.");
            try {
                MailUtil.sendEmail(user1.getEmail(), "用户找回密码通知", sb.toString());
            } catch (Exception e) {
                return JsonResult.error("未知错误！");
            }
            return JsonResult.success("您的密码已通过邮件的方式发送至" + user1.getEmail() + "，请注意查收。");
        } else {
            return JsonResult.error("资料找回失败，填写的内容错误。");
        }
    }

    @GetMapping("/verifyCode")
    public void verifyCode(HttpServletRequest request, HttpServletResponse resp) throws IOException {
        VerificationCode code = new VerificationCode();
        BufferedImage image = code.getImage();
        String text = code.getText();
        HttpSession session = request.getSession(true);
        session.setAttribute("verify_code", text);
        VerificationCode.output(image, resp.getOutputStream());
    }
}
