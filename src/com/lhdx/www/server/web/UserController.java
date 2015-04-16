package com.lhdx.www.server.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.lhdx.www.server.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lhdx.www.server.service.AuthorityService;
import com.lhdx.www.server.service.UserService;

@Controller
@RequestMapping(value = "/service")
public class UserController {


    @Resource(name = "userService")
    private UserService userService;

    @RequestMapping(value = "/addUser2", method = RequestMethod.POST)
    public
    @ResponseBody
    String updateOrAddUser2(
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "phone", required = false) String phone,
            @RequestParam(value = "xiaoqu", required = false) String xiaoqu,
            @RequestParam(value = "birthday", required = false) String birthday,
            @RequestParam(value = "loudong", required = false) String loudong,
            @RequestParam(value = "danyuan", required = false) String danyuan,
            @RequestParam(value = "room", required = false) String room,
            @RequestParam(value = "comment", required = false) String comment, HttpSession httpSession) {
        String wxId = (String) httpSession.getAttribute("wxId");
        User u = (User) httpSession.getAttribute("user");
        if (wxId != null) {
            userService.insertUser(name, phone, null, comment, xiaoqu, wxId,
                    birthday);
        }else{
            if(u!=null){
                userService.insertUser(name, phone, null, comment, xiaoqu, u.getWxId(),
                        birthday);
            }
        }
        return "{success:true,msg:'保存成功!'}";
    }

    @RequestMapping(value = "/initQd", method = RequestMethod.POST)
    public
    @ResponseBody
    Map initQd(HttpSession httpSession) {
        User u = (User) httpSession.getAttribute("user");
        if (u != null) {
            return userService.isDq(u);
        } else {
            return null;
        }
    }

    @RequestMapping(value = "/addJf", method = RequestMethod.POST)
    public
    @ResponseBody
    Map addJf(@RequestParam("jf") String jf, HttpSession httpSession) {
        User u = (User) httpSession.getAttribute("user");

        if (u != null) {
            return userService.addjf(u.getWxId(), jf);
        } else {
            return null;
        }

    }

    @RequestMapping(value = "/initUserInfo", method = RequestMethod.POST)
    public
    @ResponseBody
    Map initUserInfo(HttpSession httpSession) {
        User u = (User) httpSession.getAttribute("user");
        System.out.println("客户名：" + u.getName());
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("user", userService.findUserByWxId(u.getWxId()));
        return map;
    }


    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    public
    @ResponseBody
    String updateUser(
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "phone", required = false) String phone,
            @RequestParam(value = "addr", required = false) String addr,
            @RequestParam(value = "birthday", required = false) String birthday,
            @RequestParam(value = "comment", required = false) String comment, HttpSession httpSession) {
        User u = (User) httpSession.getAttribute("user");
        userService.updateUser(u.getWxId(), name, phone, addr, birthday, comment);
        return "{success:true,msg:'保存成功!'}";
    }

    @RequestMapping(value = "/initUserView", method = RequestMethod.POST)
    public
    @ResponseBody
    Map initUserView(HttpSession httpSession) {
        User u = (User) httpSession.getAttribute("user");
        return userService.initUserView(u.getWxId());
    }


}
