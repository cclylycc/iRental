package com.javaclimb.houserent.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.javaclimb.houserent.entity.House;
import com.javaclimb.houserent.mapper.HouseMapper;
import com.javaclimb.houserent.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/*
 * 房屋服务接口实现
 * */
@Service
public class HouseServiceImpl implements HouseService {
    @Autowired
    private HouseMapper houseMapper;

    /*
     * mapper对象
     * */
    @Override
    public BaseMapper<House> getRepository() {
        return houseMapper;
    }

    @Override
    public QueryWrapper<House> getQueryWrapper(House house) {
        QueryWrapper<House> queryWrapper = new QueryWrapper<>();
        if (house != null && house.getUserId() != null) {
            queryWrapper.eq("user_id", house.getUserId());
        }
        return queryWrapper;
    }

    @Override
    public QueryWrapper<House> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }

    @Override
    public List<House> findByUserIdAndCertificateNoAndRentType(Long userId, String certificateNo, String rentType) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("user_id", userId);
        queryWrapper.eq("certificate_no", certificateNo);
        queryWrapper.eq("rent_type", rentType);
        return houseMapper.selectList(queryWrapper);
    }

    /*
     * rentType 租房类型
     * limit 限制多少条
     * */
    @Override
    public List<House> findTopList(String rentType, Integer limit) {
        return houseMapper.findTopList(rentType, limit);
    }
}
