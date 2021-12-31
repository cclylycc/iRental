package com.javaclimb.houserent.controller.front;

import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.common.enums.HouseStatusEnum;
import com.javaclimb.houserent.common.enums.OrderStatusEnum;
import com.javaclimb.houserent.common.util.DateUtil;
import com.javaclimb.houserent.entity.House;
import com.javaclimb.houserent.entity.Order;
import com.javaclimb.houserent.entity.User;
import com.javaclimb.houserent.service.HouseService;
import com.javaclimb.houserent.service.OrderService;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

/*
 * 前端订单控制器
 * */
@Controller("frontOrderController")
public class OrderController extends BaseController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private UserService userService;

    /*
     * 创建订单
     * */
    @RequestMapping("/order/create")
    @ResponseBody
    public JsonResult createOrder(@RequestParam("houseId") Long houseId, @RequestParam("endDate") String endDateStr) {
        if (getLoginUser() == null) {
            return JsonResult.error("用户未登录");
        }

        House house = houseService.get(houseId);
        if (house == null) {
            return JsonResult.error("房屋信息不存在");
        }

        if (Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())) {
            return JsonResult.error("房屋已被租出或未释放");
        }

        Order checkOrder = orderService.getCurrentEffectiveOrder(houseId);
        if (checkOrder != null) {
            return JsonResult.error("房屋已被租出或未释放");
        }

        User ownerUser = userService.get(house.getUserId());
        if (ownerUser == null) {
            return JsonResult.error("房东用户不存在");
        }

        //退租日期
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/YYYY");
        Date endDate;
        try {
            endDate = sdf.parse(endDateStr);
        } catch (ParseException e) {
            e.printStackTrace();
            return JsonResult.error("退租日期格式不合法");
        }
        Date startDate = new Date();
        //计算总共天数
        Integer dayNum = DateUtil.daysBetween(startDate, endDate);
        if (dayNum <= Constant.MIN_RENT_DAYS) {
            return JsonResult.error("最少租住" + Constant.MIN_RENT_DAYS + "天");
        }

        //创建订单
        Order order = new Order();
        order.setCreateTime(new Date());
        order.setCustomerUserId(getLoginUserId());
        order.setOwnerUserId(house.getUserId());
        order.setHouseId(houseId);
        order.setStatus(OrderStatusEnum.NOT_AGREEMENT.getValue());
        order.setMonthRent(house.getMonthRent());
        order.setDayNum(dayNum);
        order.setTotalAmount(house.getMonthRent() / 30 * dayNum);
        order.setStartDate(startDate);
        order.setEndDate(endDate);
        orderService.insert(order);

        return JsonResult.success("订单创建成功，请签订合同。", order.getId());
    }
}
