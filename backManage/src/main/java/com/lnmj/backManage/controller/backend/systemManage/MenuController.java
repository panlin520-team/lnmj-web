package com.lnmj.backManage.controller.backend.systemManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @param
 * @Author: panlin
 * @Description: 菜单管理路由
 * @Date: Created in 2018/2/21 11:18
 */
@Controller
@RequestMapping("/admin/menu")
public class MenuController {
    //菜单管理
    @RequestMapping("/tomunemanage")
    public String tousermanage() {
        return "power/menu";
    }












}
