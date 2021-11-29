package com.javaclimb.houserent.common.base;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.io.Serializable;

/*
 * 所有service接口的基础接口
 * */
@FunctionalInterface
public interface BaseService<E, ID extends Serializable> {
    /*
     * mapper对象
     * */
    BaseMapper<E> getRepository();


}
