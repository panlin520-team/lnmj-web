package com.lnmj.backManage.controller.backend.memberManage.label.posLabel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/posLabel")
public class PosLabelController {
    //进入标签管理页面
    @RequestMapping("/toPosTreeLabel")
    public String posTreeTabel() {
        return "label/posLabel/posTreeLabel";
    }

}
