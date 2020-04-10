package com.lnmj.backManage.serviceProxy;


import com.lnmj.backManage.response.ResponseResult;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.util.Map;

/**
 * @Auther: panlin
 * @Date: 2019/4/19 15:35
 * @Description:
 */

@FeignClient(name = "lnmj-authority")
public interface AuthorityApi {
    @RequestMapping(value = "/manager/authority/login", method = RequestMethod.POST)
    ResponseResult login(@RequestParam("imageCode") String imageCode,
                         @RequestParam("userName") String userName,
                         @RequestParam("password") String password,
                         @RequestParam("companyId") String companyId,
                         @RequestParam("companyType") String companyType,
                         @RequestParam("isSuperAdmin") String isSuperAdmin);
    @RequestMapping(value = "/manager/authority/drawImage", method = RequestMethod.POST)
    ResponseResult drawImage();

}

