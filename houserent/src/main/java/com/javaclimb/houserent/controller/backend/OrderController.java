package com.javaclimb.houserent.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.util.PageUtil;
import com.javaclimb.houserent.entity.Order;
import com.javaclimb.houserent.service.HouseService;
import com.javaclimb.houserent.service.OrderService;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/*
 * 后端订单控制器
 * */
@Controller("backendOrderController")
@RequestMapping("/admin/order")
public class OrderController extends BaseController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private UserService userService;

    /*
     * 进入订单列表页面
     * */
    @RequestMapping("")
    public String allOrder(@RequestParam(value = "page", defaultValue = "1") Long pageNumber, @RequestParam(value = "size", defaultValue = "6") Long pageSize, Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        Order condition = new Order();
        //如果登录用户是租客，查询租客订单
        if (loginUserIsCustomer()) {
            condition.setCustomerUserId(getLoginUserId());
        }

        //如果登录用户是房东，查询房东订单
        if (loginUserIsOwner()) {
            condition.setOwnerUserId(getLoginUserId());
        }

        //如果登录用户是管理员，查询所有订单
        Page<Order> orderPage = orderService.findAll(page, condition);
        for (Order order : orderPage.getRecords()) {
            //TODO 性能需要优化
            order.setHouse(houseService.get(order.getHouseId())); // 优化方案 id in ('1'.'2','3')
            order.setOwnerUser(userService.get(order.getOwnerUserId()));
            order.setCustomerUser(userService.get(order.getCustomerUserId()));
        }
        model.addAttribute("pageInfo", orderPage);
        model.addAttribute("tab", "order-list");
        model.addAttribute("pagePrefix", "admin/order?");
        return "admin/order-list";
    }
}
