package com.javaclimb.houserent.service;

import com.javaclimb.houserent.common.base.BaseService;
import com.javaclimb.houserent.entity.House;

import java.util.List;

/*
 * 房屋服务接口
 * */
public interface HouseService extends BaseService<House, Long> {
    /*
     * 根据用户ID和房产证号查询合租房屋
     * */
    List<House> findByUserIdAndCertificateNoAndRentType(Long userId, String certificateNo, String rentType);

    List<House> findTopList(String rentType, Integer limit);


}
