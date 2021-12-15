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


}
