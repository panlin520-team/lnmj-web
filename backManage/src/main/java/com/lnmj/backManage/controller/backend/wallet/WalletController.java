package com.lnmj.backManage.controller.backend.wallet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: yilihua
 * @Date: 2019/7/3 16:41
 * @Description: 钱包管理路由
 */
@Controller
@RequestMapping("/admin/wallet")
public class WalletController {

    //充值管理
    @RequestMapping("/rechargerecord")
    public String torechargerecord() {
        return "wallet/rechargeRecord";
    }

    //账户管理
    @RequestMapping("/accountType")
    public String toaccountType() {
        return "wallet/accountType";
    }

    //提现审核
    @RequestMapping("/drawmoney")
    public String drawmoney() {
        return "wallet/drawmoney";
    }
    @RequestMapping("/drawmoney_detail")
    public String detail() {
        return "wallet/drawmoney_detail";
    }
    //财务统计
    @RequestMapping("/financeStatistics")
    public String tofinanceStatistics() {
        return "wallet/financeStatistics";
    }
    //资金池
    @RequestMapping("/capitalPool")
    public String tocapitalPool() {
        return "wallet/capitalPool";
    }
}
