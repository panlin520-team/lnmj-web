package com.lnmj.backManage.controller.backend.productManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: yilihua
 * @Date: 2019/7/3 16:41
 * @Description: 商品分类路由
 */
@Controller
@RequestMapping("/producttype")
public class ProductTypeController {
    //商城商品分类
    @RequestMapping("/toproducttypemanage")
    public String toproducttypemanage() {
        return "product/productType/productType";
    }
    //pos端商品分类
    @RequestMapping("/toproducttypeperformancemanage")
    public String toproducttypeperfofrmancemanage() {
        return "product/productType/productTypePerformance";
    }
    //商品大类
    @RequestMapping("/tocommitTypemanage")
    public String tocommitTypemanage() {
        return "product/productType/commitType";
    }
    //商品小类
    @RequestMapping("/tosubclassmanage")
    public String tosubclassmanage() {
        return "product/productType/subclass";
    }

}
