package com.hqyj.controller;

import com.hqyj.pojo.User;
import com.hqyj.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("userController")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("preMenu")
    public ModelAndView preMenu(String username, HttpSession session){//此时参数名必须和前台的值一致。如果参数是基本数据类型或者String
        //封装给前台的值和要跳转的页面
        ModelAndView mav = new ModelAndView();
        //根据username获取User对象
        User user = userService.getUserByName(username);
        //将对象传递前台session中
        session.setAttribute("USER", user);
        //跳转menu.jsp
        mav.setViewName("menu");//设置要跳转的jsp页面名
        //mav.addObject(key, value);给前台jsp传值
        return mav;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}