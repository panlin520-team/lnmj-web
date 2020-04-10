package com.lnmj.backManage.controller.backend.company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: panlin
 * @Date: 2019/10/29 20:51
 * @Description: 供应商
 */
@Controller
@RequestMapping("/admin/supplier")
public class SupplierController {
    @RequestMapping("/tosupplier")
    public String tosupplier() {
        return "company/supplier";
    }
    @RequestMapping("/tosuppliercategory")
    public String tosuppliercategory() {
        return "company/supplierCategory";
    }

}
