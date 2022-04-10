package com.irental.houserent.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.irental.houserent.entity.News;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/*
 * 新闻资讯Mapper
 * */
@Mapper
public interface NewsMapper extends BaseMapper<News> {

    @Select("select * from t_news order by id desc limit 3")
    List<News> newestNews();
}
