package com.javaclimb.houserent.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.util.PageUtil;
import com.javaclimb.houserent.entity.Feedback;
import com.javaclimb.houserent.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/*
 * 后端反馈控制器
 * */
@Controller("backFeedbackController")
public class FeedbackController extends BaseController {
    @Autowired
    private FeedbackService feedbackService;

    @RequestMapping("/admin/feedback")
    public String feedback(@RequestParam(value = "page", defaultValue = "1") Long pageNumber, @RequestParam(value = "size", defaultValue = "6") Long pageSize, Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        Feedback condition = new Feedback();
        Page<Feedback> feedbackPage = feedbackService.findAll(page, condition);
        model.addAttribute("pageInfo", feedbackPage);
        model.addAttribute("pagePrefix", "/news?");
        return "admin/feedback-list";
    }
}
