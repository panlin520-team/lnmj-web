package com.lnmj.backManage.controller.backend.systemManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @Author: yilihua
 * @Date: 2019/7/3 16:41
 * @Description: 后台用户管理路由
 */
@Controller
@RequestMapping("/admin/user")
public class UserAdminController {
    //管理员管理
    @RequestMapping("/tousermanage")
    public String tousermanage() {
        return "power/user";
    }

    //修改密码
    @RequestMapping("/toUpdatePassword")
    public String toUpdatePassword() {
        return "power/updatePassword";
    }

    //安全退出
    @GetMapping("/logout")
    public String logout(HttpSession session)  {
        session.removeAttribute("currentUser");
        return "redirect:/tologin";
    }
}
