package com.lnmj.backManage.Enum;

import com.lnmj.backManage.Enum.base.BaseEnum;

/**
 * @Author: yilihua
 * @Date: 2019/5/14 17:24
 * @Description:  赠送状态
 */
public enum AppointmentStatusEnum implements BaseEnum {
    CANCEL(0, "取消"),
    APPOINTMENT(1, "预约"),
    PUSH_APPOINTMENT(2, "推送：预约提醒"),
    PUSH_PAY(3, "推送：支付提醒");

    private Integer code;
    private String desc;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    AppointmentStatusEnum(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

}
