package com.lnmj.backManage.Enum.ResponseEnum.errorMsgEnum;

/**
 * @Auther: panlin
 * @Date: 2019/4/22 13:46
 * @Description:
 */
public enum ResponseCodeExperiencecardEnum {

    EXPERIENCECARD_LIST_NULL(3,"体验卡列表不存在"),
    EXPERIENCECARD_ORDER_LIST_NULL(3,"体验卡订单列表不存在"),
    EXPERIENCECARD_ORDER_DETAIL_LIST_NULL(3,"体验卡订单细目不存在"),
    EXPERIENCECARD_PRODUCT_LIST_NULL(3,"体验卡项目列表不存在"),
    EXPERIENCECARD_NUM_NULL(3,"体验卡编号不能为空"),
    CARDPRODUCTID_NULL(3,"体验卡商品id不能为空"),
    CARDID_NULL(3,"体验卡id不能为空"),
    EXPERIENCECARD_RECORD_NULL(3,"体验卡使用记录不存在"),
    USE_TIMES_ERROR(3,"使用次数超过了总次数"),
    EXP_EFFICIENT_CONDITION_DATE_NULL(3,"体验卡项目生效时间和生效条件不能同时为空"),
    EXP_EFFICIENT_CONDITION_DATE_NOT_NULL(3,"体验卡项目生效时间和生效条件不能同时选择"),
    CARDPRODUCTID_SUBORD_BUY_LIMIT(3,"购买的体验卡限购分组内已经购买过了，无法重复购买");
    private final int code;
    private final String desc;

    ResponseCodeExperiencecardEnum(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }
    public int getCode(){
        return code;
    }
    public String getDesc(){
        return desc;
    }

}
