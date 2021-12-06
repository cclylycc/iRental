package com.javaclimb.houserent.controller.backend;

import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.common.enums.HouseStatusEnum;
import com.javaclimb.houserent.entity.House;
import com.javaclimb.houserent.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/*
 * 房屋控制器
 * */
@Controller
@RequestMapping("/admin/house")
public class HouseController extends BaseController {
    @Autowired
    private HouseService houseService;

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

    /*
     * 发布房屋提交
     * */
    @RequestMapping("/publish/submit")
    @ResponseBody
    public JsonResult publishSubmit(House house) {
        try {
            house.setCreateTime(new Date());
            house.setUserId(getLoginUserId());
            house.setStatus(HouseStatusEnum.NOT_CHECK.getValue());
            houseService.insertOrUpdate(house);
        } catch (Exception e) {
            return JsonResult.error("发布失败，请填写完整信息");
        }

        return JsonResult.success("发布成功", house.getId());
    }

}
