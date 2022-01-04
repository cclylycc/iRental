package com.javaclimb.houserent.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.javaclimb.houserent.entity.House;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/*
 * 房屋数据访问层
 * */
@Mapper
public interface HouseMapper extends BaseMapper<House> {
    /*
     * 根据租房类型获取最新的N条房屋信息
     * 简单类可以直接通过注解方式来写
     * */
    @Select("select * from t_house where status = 0 and rent_type = #{rentType} order by create_time desc limit #{limit}")
    List<House> findTopList(@Param("rentType") String rentType, @Param("limit") Integer limit);


}
