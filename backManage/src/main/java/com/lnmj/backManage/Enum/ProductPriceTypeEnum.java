package com.lnmj.backManage.Enum;

import com.lnmj.backManage.Enum.base.BaseEnum;

/**
 * @Author: yilihua
 * @Date: 2019/8/15 16:23
 * @Description: 会员使用范围
 */
public enum ProductPriceTypeEnum implements BaseEnum {
    PRODUCTORIGINALPRICE(1, "ProductOriginalPrice"),    //原价
    RETAILPRICE(2, "RetailPrice"),    //零售价
    ACTIVITYRETAILPRICE(3, "ActivityRetailPrice"),   //活动零售价
    FACILITATORPRICE(4, "FacilitatorPrice"),   //零售价（服务商）
    UNIONPRICE(5, "UnionPrice"),   //零售价(联盟商)
    RETAILPRICEVIP1(6, "RetailPriceVip1"),   //零售价VIP1
    RETAILPRICEVIP2(7, "RetailPriceVip2"),   //零售价VIP2
    RETAILPRICEVIP3(8, "RetailPriceVip3"),   //零售价VIP3
    RETAILPRICEVIP4(9, "RetailPriceVip4"),   //零售价VIP4
    RETAILPRICEVIP5(10, "RetailPriceVip5"),   //零售价VIP5
    RETAILPRICEVIP6(11, "RetailPriceVip6"),   //零售价VIP6
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

    ProductPriceTypeEnum(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

}
