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
}
