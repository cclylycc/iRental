package com.javaclimb.houserent.common.constant;

/*
 * 常量类
 *
 * */
public class Constant {
    /*
     * 用户Session的key
     * */
    public static final String SESSION_USER_KEY = "user";


    /*相对路径*/
    public static final String UPLOADS_ABSOLUTEPATH = "/uploads/";


    /*
     * 上传目录
     * */
    public static final String UPLOADS_PATH = System.getProperties().getProperty("user.home") + UPLOADS_ABSOLUTEPATH;


    /*
     * 图片session的前缀
     * */
    public static final String SESSION_IMG_PREFIX = "SESSION_IMG_";

    /*
     * 最小租住天数
     * */
    public static final Integer MIN_RENT_DAYS = 1;

    /*
     * 首页显示房屋数量
     */
    public static final Integer INDEX_HOUSE_NUM = 6;
}
