package com.lnmj.backManage.controller.backend.storeManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @param
 * @Author: panlin
 * @Description: 门店业绩管理路由
 * @Date: Created in 2018/2/21 11:18
 */
@Controller
@RequestMapping("/admin/store")
public class AchievementController {
    //门店业绩管理
    @RequestMapping("/toachievement")
    public String toachievement() {
        return "storeList/achievement/achievement";
    }
    //门店业绩分类管理
    @RequestMapping("/toachievementcategory")
    public String toachievementcategory() {
        return "storeList/achievement/achievementCategory";
    }
    //业绩阶梯管理
    @RequestMapping("/toachievementladder")
    public String toachievementladder() {
        return "storeList/achievement/achievementLadder";
    }
    //业绩明细
    @RequestMapping("/toachievementladderdetailed")
    public String toachievementladderdetailed() {
        return "storeList/achievement/achievementLadderDetailed";
    }





}
