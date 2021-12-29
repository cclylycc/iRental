package com.javaclimb.houserent.controller.front;

import com.alibaba.fastjson.JSON;
import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.enums.HouseRentTypeEnum;
import com.javaclimb.houserent.entity.House;
import com.javaclimb.houserent.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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
        //处理轮播图URL
        List<String> slideList = JSON.parseArray(house.getSlideUrl(), String.class); // to list
        house.setSlideImgList(slideList);

        //如果是合租房屋，查询合租房屋。
        List<House> shareHouseList = houseService.findByUserIdAndCertificateNoAndRentType(house.getUserId(), house.getCertificateNo(), HouseRentTypeEnum.SHARE.getValue());
        house.setShareHouseList(shareHouseList);
        model.addAttribute("house", house);
        return "front/house-detail";
    }

    /*
     * 房屋地图页面
     * */
    @RequestMapping("/house/map")
    public String map(@RequestParam("id") Long id, Model model) {
        //根据ID查询房屋
        House house = houseService.get(id);
        if (house == null) {
            return renderNotFound();
        }
        String longitudeLatitude = house.getLongitudeLatitude();
        String[] arr = longitudeLatitude.split(",");
        model.addAttribute("longitude", arr[0]);
        model.addAttribute("latitude", arr[1]);
        model.addAttribute("address", house.getAddress());
        return "front/house-map";
    }
}
