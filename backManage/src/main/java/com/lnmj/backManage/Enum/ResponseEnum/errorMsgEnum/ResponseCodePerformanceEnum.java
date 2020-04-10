package com.lnmj.backManage.Enum.ResponseEnum.errorMsgEnum;

/**
 * @Auther: panlin
 * @Date: 2019/4/22 13:46
 * @Description: 业绩
 */
public enum ResponseCodePerformanceEnum {
    //业绩
    PERFORMANCE_NULL(1, "业绩为空"),
    PERFORMANCE_ID_NOT_NULL(1, "id不能为空"),
    NOT_FIND_PERFORMANCE(1, "业绩不存在"),
    CREATEOPERATOR_NOT_NULL(1, "添加人不能为空"),
    MODIFYOPERATOR_NOT_NULL(1, "修改人不能为空"),
    //业绩阶梯
    LADDER_NULL(1, "业绩阶梯为空"),
    LADDER_ID_NOT_NULL(1, "id不能为空"),
    NOT_FIND_LADDER(1, "业绩阶梯不存在"),
    //业绩明细
    LADDERDETAILED_NULL(1, "业绩明细为空"),
    LADDERDETAILED_ID_NOT_NULL(1, "id不能为空"),
    NOT_FIND_LADDERDETAILED(1, "业绩明细不存在"),
    //业绩统计
    STATISTICDATE_EROOR(1, "统计日期有误"),
    SALESMAN_ID_NULL(1, "员工ID不能为空"),
    ;


    private final int code;
    private final String desc;

    ResponseCodePerformanceEnum(int code, String desc) {
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
