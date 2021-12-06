package com.javaclimb.houserent.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.javaclimb.houserent.entity.House;
import com.javaclimb.houserent.entity.User;
import org.apache.ibatis.annotations.Mapper;

/*
 * 房屋数据访问层
 * */
@Mapper
public interface HouseMapper extends BaseMapper<House> {
}
