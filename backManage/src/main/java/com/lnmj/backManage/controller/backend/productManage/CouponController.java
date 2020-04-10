package com.lnmj.backManage.controller.backend.productManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: yilihua
 * @Date: 2019/6/21 15:51
 * @Description: 商品管理路由
 */
@Controller
@RequestMapping("/admin")
public class CouponController {
    //优惠券参数设置
    @RequestMapping("/coupons")
    public String tocouponsmanage() {
        return "product/coupons/coupons";
    }
    //优惠券领取记录
    @RequestMapping("/couponsGetRecord")
    public String tocouponsgetrecordmanage() {
        return "product/coupons/couponsGetRecord";
    }
    //优惠券使用记录
    @RequestMapping("/couponsUseRecord")
    public String tocouponsuserecordmanage() {
        return "product/coupons/couponsUseRecord";
    }
}
