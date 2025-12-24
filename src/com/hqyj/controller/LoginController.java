package com.hqyj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hqyj.pojo.User;
import com.hqyj.service.UserService;

@Controller
@RequestMapping("loginController")/*窄化请求*/
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping("login")
    public String login(User user,Model model){//User类中属性名必须和前台input标签name的值一致。
        System.out.println(user.getName()+"==="+user.getPwd());
        //调用userService
        String result = userService.login(user);
        if("登录成功".equals(result)){
        	model.addAttribute("USERNAME", user.getName());//将登录的用户名传递到前台
            return "main";//jsp页面的名称
        }else{
            //把错误信息返回jsp
            model.addAttribute("MSG", result);
            return "login";
        }
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}