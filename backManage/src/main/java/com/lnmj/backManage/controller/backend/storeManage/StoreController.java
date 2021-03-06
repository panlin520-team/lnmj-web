package com.lnmj.backManage.controller.backend.storeManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @param
 * @Author: panlin
 * @Description: 门店管理路由
 * @Date: Created in 2018/2/21 11:18
 */
@Controller
@RequestMapping("/admin/store")
public class StoreController {
    //门店信息管理
    @RequestMapping("/tostoremanage")
    public String tostoremanageList() {
        return "storeList/storemanage";
    }
    //门店分类
    @RequestMapping("/tostorecategory")
    public String tostorecategory() {
        return "storeList/storecategory";
    }
    //职位管理
    @RequestMapping("/post")
    public String topost() {
        return "storeList/post/post";
    }
    //职位分类管理
    @RequestMapping("/postCategory")
    public String topostCategory() {
        return "storeList/post/postCategory";
    }
    //职位等级管理
    @RequestMapping("/postLevel")
    public String topostLevel() {
        return "storeList/post/postLevel";
    }
    //员工管理
    @RequestMapping("/staff")
    public String tostaff() {
        return "storeList/staff/staffmanage";
    }
    //员工分组管理
    @RequestMapping("/group")
    public String togroup() {
        return "storeList/staff/group";
    }


}
