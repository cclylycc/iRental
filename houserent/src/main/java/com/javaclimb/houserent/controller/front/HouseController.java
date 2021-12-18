package com.javaclimb.houserent.controller.front;

import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.entity.House;
import com.javaclimb.houserent.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * 前端房屋信息控制器
 * */
@Controller("frontHouseController")
public class HouseController extends BaseController {
    @Autowired
    private HouseService houseService;

    /*
     * 房屋详情
     * */
    @RequestMapping("/house/detail/{id}")
    public String houseDetail(@PathVariable("id") Long id, Model model) {
        //根据ID查询房屋
        House house = houseService.get(id);
        if (house == null) {
            return renderNotFound();
        }
        model.addAttribute("house", house);
        //处理轮播图URL
        Json
        return "front/house-detail";
    }
}
