package com.lnmj.backManage.controller.backend.memberManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: yilihua
 * @Date: 2019/6/21 15:51
 * @Description: 商城会员管理
 */
@Controller
@RequestMapping("/member")
public class MemberController {
    //进入POS端会员管理页面
    @RequestMapping("/toMemberUser")
    public String tostoreusermanage() {
        return "member/MemberUser";
    }

    //进入会员信息地址管理页面
    @RequestMapping("/toMemberUserAddress")
    public String toMallMemberAddress() {
        return "member/MemberUserAddress";
    }




    //进入会员等级管理页面
    @RequestMapping("/toMemberLevel")
    public String toMallMemberLevel() {
        return  "member/MemberLevel";
    }

    //进入会员升级记录页面
    @RequestMapping("/toMemberRecord")
    public String toMallMemberRecord() {
        return "member/MemberRecord";
    }


}
