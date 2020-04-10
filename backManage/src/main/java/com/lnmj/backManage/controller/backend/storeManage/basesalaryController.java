package com.lnmj.backManage.controller.backend.storeManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @param
 * @Author: panlin
 * @Description: 底薪
 * @Date: Created in 2018/2/21 11:18
 */
@Controller
@RequestMapping("/admin/store")
public class basesalaryController {
    //门店业绩管理
    @RequestMapping("/tobasesalary")
    public String toachievement() {
        return "storeList/achievement/basesalary";
    }








}
