package com.javaclimb.houserent.controller.backend;

import com.javaclimb.houserent.common.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * 房屋控制器
 * */
@Controller
@RequestMapping("/admin/house")
public class HouseController extends BaseController {
    /*
     * 进入房屋管理页面
     * */
    @RequestMapping("")
    public String houseList() {
        return "admin/house-list";
    }

    /*
     * 进入房屋发布页面
     * */
    @RequestMapping("/publish")
    public String publish() {
        return "admin/house-publish";
    }

}
