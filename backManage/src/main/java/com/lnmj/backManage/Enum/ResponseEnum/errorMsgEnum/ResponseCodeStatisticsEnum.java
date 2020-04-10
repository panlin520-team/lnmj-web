package com.lnmj.backManage.Enum.ResponseEnum.errorMsgEnum;

/**
 * @Auther: panlin
 * @Date: 2019/4/22 13:46
 * @Description: 统计
 */
public enum ResponseCodeStatisticsEnum {
    //统计
    LIST_IS_NULL(1, "统计列表为空"),
    POST_IS_NULL(1, "人员职位为空"),
    ;


    private final int code;
    private final String desc;

    ResponseCodeStatisticsEnum(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public int getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }

}
