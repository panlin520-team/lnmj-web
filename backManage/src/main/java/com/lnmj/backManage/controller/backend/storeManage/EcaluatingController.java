package com.lnmj.backManage.controller.backend.storeManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/store")
public class EcaluatingController {
    //客户评测
    @RequestMapping("/toEvaluating")
    public String toEcaluating() {
        return "storeList/evaluating/evaluating";
    }


    //客户评测详情
    @RequestMapping("/toEvaluatingDetail")
    public String toEvaluatingDetail() {
        return "storeList/evaluating/evaluatingDetail";
    }

    //客户评测等级
    @RequestMapping("/toEvaluatingLevel")
    public String toEvaluatingLevel() {
        return "storeList/evaluating/evaluatingLevel";
    }

    @RequestMapping("/userevaluating")
    public String userevaluating() {
        return "storeList/evaluating/userevaluating";
    }
}
