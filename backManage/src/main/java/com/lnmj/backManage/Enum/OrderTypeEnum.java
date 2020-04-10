package com.lnmj.backManage.Enum;

import com.lnmj.backManage.Enum.base.BaseEnum;

public enum OrderTypeEnum implements BaseEnum {
    PRODUCT_ORDER(1, "商品订单"),
    SERVICE_ORDER (2, "服务订单"),
    CUSTOM_ORDER (3, "定制订单"),
    RECHARGE_ORDER (4, "充值订单"),
    EXPCARD_ORDER (5, "体验卡订单"),
    TEART_ORDER (6, "赠送订单"),
    MAKER_ORDER (7, "创客订单"),
    ;
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

    OrderTypeEnum(Integer code, String desc) { //加上public void 上面定义枚举会报错 The constructor Color(int, String) is undefined
        this.code = code;
        this.desc = desc;

    }
}
