package com.lnmj.backManage.controller.backend.login;

import com.lnmj.backManage.Enum.ResponseEnum.errorMsgEnum.ResponseCodeAccountEnum;
import com.lnmj.backManage.response.Error;
import com.lnmj.backManage.response.ResponseResult;
import com.lnmj.backManage.serviceProxy.AuthorityApi;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @Auther: panlin
 * @Date: 2019/6/19 11:46
 * @Description: 登录路由
 */
@Controller
public class LoginController {
    @Resource
    AuthorityApi authorityApi;

    @RequestMapping("/tologin")
    public String login() {
        return "login";
    }

    @RequestMapping("/topagehome")
    public String pageHome() {
        return "pageHome";
    }

    @ResponseBody
    @RequestMapping("/login")
    public ResponseResult tologin(HttpSession session, HttpServletRequest request, String imageCode, String userName, String password, String companyId, String companyType, String isSuperAdmin) {
        if (StringUtils.isEmpty(imageCode)) {
            return ResponseResult.error(new Error(ResponseCodeAccountEnum.CODE_NULL.getCode(), ResponseCodeAccountEnum.CODE_NULL.getDesc()));
        }
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("code")) {
                if (!imageCode.equalsIgnoreCase(cookie.getValue())) {
                    return ResponseResult.error(new Error(ResponseCodeAccountEnum.CODE_ERROR.getCode(), ResponseCodeAccountEnum.CODE_ERROR.getDesc()));
                }
            }
        }
        ResponseResult responseResult = authorityApi.login(imageCode, userName, password, companyId, companyType, isSuperAdmin);
        if (responseResult.getResponseStatusType().getMessage().equals("Success")) {
            Map userMap = (Map) ((Map) responseResult.getResult()).get("user");
            if (userMap.get("companyName") == null) {
                ((Map) ((Map) responseResult.getResult()).get("user")).put("companyName", "系统超级管理员");
            }
            if (responseResult.isSuccess()) {
                session.setAttribute("tmenuOneClassList", ((Map) responseResult.getResult()).get("tmenu"));
                session.setAttribute("currentUser", ((Map) responseResult.getResult()).get("user"));
            }
        }
        return responseResult;
    }
}
