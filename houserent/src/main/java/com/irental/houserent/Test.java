package com.irental.houserent;

import org.springframework.util.ClassUtils;

import static com.irental.houserent.common.constant.Constant.UPLOADS_ABSOLUTEPATH;

public class Test {
    public static void main(String[] args) {
        System.out.println(ClassUtils.getDefaultClassLoader().getResource("static").getPath().replaceFirst("/", "") + UPLOADS_ABSOLUTEPATH);
        System.out.println(System.getProperties().getProperty("user.home") + UPLOADS_ABSOLUTEPATH);
        System.out.println(System.getProperties().getProperty("user.dir") + UPLOADS_ABSOLUTEPATH);
    }
}
