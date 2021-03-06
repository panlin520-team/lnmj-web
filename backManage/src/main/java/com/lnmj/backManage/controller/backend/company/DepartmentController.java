package com.lnmj.backManage.controller.backend.company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: panlin
 * @Date: 2020/2/25 15:51
 * @Description: 部门路由
 */
@Controller
@RequestMapping("/admin/department")
public class DepartmentController {
    @RequestMapping("/todepartmentcompany")
    public String todepartmentcompany() {
        return "company/departmentCompany";
    }
    @RequestMapping("/todepartmentsubcompany")
    public String todepartmentsubcompany() {
        return "company/departmentSubCompany";
    }
    @RequestMapping("/todepartmentstore")
    public String todepartmentstore() {
        return "company/departmentStore";
    }

}
