package com.ypf.feijibookserver.controller;

import com.ypf.feijibookserver.entity.AdminBean;
import com.ypf.feijibookserver.entity.DataModelBean;
import com.ypf.feijibookserver.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * AdminController
 *
 * @author PengFei Yue
 * @date 2022/3/17
 * @description
 */

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    UserService userService;

    @CrossOrigin(origins = "http://baidu.com")
    @RequestMapping("/login")
    @ResponseBody
    public int adminLogin(AdminBean adminBean) {
        String adminName = adminBean.getName();
        String adminPassword = adminBean.getPassword();
        return userService.adminLogin(adminName, adminPassword);
    }


    @CrossOrigin(origins = "http://baidu.com")
    @RequestMapping(value = "/getUser", produces = "application/json; charset=utf-8")
    @ResponseBody
    public String getUser() {
        return userService.getUser();
    }

    @CrossOrigin(origins = "http://baidu.com")
    @RequestMapping("/updateDataModel")
    @ResponseBody
    public String updateDataModel(DataModelBean modelBean) {
        return userService.updateDataModel(modelBean);
    }

    @CrossOrigin(origins = "http://baidu.com")
    @RequestMapping("/getDataModel")
    @ResponseBody
    public String getDataModel() {
        return userService.getDataModel();
    }

    @CrossOrigin(origins = "http://baidu.com")
    @RequestMapping(value = "/getMainProportion", produces = "application/json; charset=utf-8")
    @ResponseBody
    public String getMainProportion() {
        return userService.getMainProportion();
    }

    @CrossOrigin(origins = "http://baidu.com")
    @RequestMapping(value = "/getExpendTrend", produces = "application/json; charset=utf-8")
    @ResponseBody
    public String getExpendTrend() {
        return userService.getExpendTrend();
    }

    @CrossOrigin(origins = "http://baidu.com")
    @RequestMapping(value = "/getUserRecord", produces = "application/json; charset=utf-8")
    @ResponseBody
    public String getUserRecord(String account) {
        return userService.getUserRecord(account);
    }

}

