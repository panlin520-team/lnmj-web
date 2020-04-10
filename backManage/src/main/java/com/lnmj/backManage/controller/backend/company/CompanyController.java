package com.lnmj.backManage.controller.backend.company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: panlin
 * @Date: 2019/8/19 15:51
 * @Description: 投诉管理路由
 */
@Controller
@RequestMapping("/admin/company")
public class CompanyController {
    @RequestMapping("/tocompanymanage")
    public String tocompanymanage() {
        return "company/company";
    }
    @RequestMapping("/tosubcompanymanage")
    public String tosubcompanymanage() {
        return "company/subcompany";
    }

}
