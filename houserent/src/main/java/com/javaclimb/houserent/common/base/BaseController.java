package com.javaclimb.houserent.common.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;

//所有controller控制器的基类
@Controller
public class BaseController {
    @Autowired
    protected HttpServletRequest request;
}
