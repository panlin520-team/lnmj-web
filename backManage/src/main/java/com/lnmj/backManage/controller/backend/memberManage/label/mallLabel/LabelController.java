package com.lnmj.backManage.controller.backend.memberManage.label.mallLabel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mallLabel")
public class LabelController {
    //进入标签管理页面
    @RequestMapping("/toTreeLabel")
    public String TreeTabel() {
        return "label/mallLabel/treeLabel";
    }

}
