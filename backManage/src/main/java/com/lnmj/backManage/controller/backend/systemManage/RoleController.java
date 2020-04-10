package com.lnmj.backManage.controller.backend.systemManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Auther: panlin
 * @Date: 2019/6/21 12:48
 * @Description: 角色管理路由
 */
@Controller
@RequestMapping("/admin/role")
public class RoleController {
    //角色管理
    @RequestMapping("/torolemanage")
    public String torolemanage() {
        return "power/role";
    }
}
