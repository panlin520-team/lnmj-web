package com.lnmj.backManage.controller.backend.company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: panlin
 * @Date: 2020/2/25 15:51
 * @Description: 客户路由
 */
@Controller
@RequestMapping("/admin/customer")
public class CustomerController {
    @RequestMapping("/tocustomer")
    public String tocustomer() {
        return "company/customer";
    }


}
