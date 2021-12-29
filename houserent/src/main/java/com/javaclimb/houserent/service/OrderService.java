package com.javaclimb.houserent.service;

import com.javaclimb.houserent.common.base.BaseService;
import com.javaclimb.houserent.entity.Order;

/*
 * 订单服务接口
 * */
public interface OrderService extends BaseService<Order, Long> {
    /*
     * 查询当前有效订单
     * */
    Order getCurrentEffectiveOrder(Long houseId);
}
