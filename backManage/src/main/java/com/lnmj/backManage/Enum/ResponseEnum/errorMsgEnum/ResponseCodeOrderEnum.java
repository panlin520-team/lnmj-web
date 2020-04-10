package com.lnmj.backManage.Enum.ResponseEnum.errorMsgEnum;

/**
 * @Auther: panlin
 * @Date: 2019/4/22 13:46
 * @Description:
 */
public enum ResponseCodeOrderEnum {
    NOT_FIND_APPOINTMENT(1, "预约不存在"),
    BEAUTICIAN_NOT_NULL(1, "美容师不能为空"),
    DATE_NOT_NULL(1, "预约日期不能为空"),
    PRODUCTIDS_NULL(3,"商品不能为空"),
    STOREID_NULL(3,"店铺id不能为空"),
    BOOKINGTIME_NULL(3,"护理时间不能为空"),
    BOOKING_BEAUTICIAN_NULL(3,"护理美容师不能为空"),
    ORDER_TYPE_NULL(3,"订单类型不能为空"),
    ORDER_NUMBER_NULL(3,"总订单编号不能为空"),
    SELECT_ORDER_DETAIL_FAIL(3,"获取订单详情失败"),
    ORDER_CANCEL_FAIL(3,"取消订单失败"),
    ORDER_DELETE_FAIL(3,"删除订单失败"),
    ORDER_STATUS_NULL(3,"订单状态不能为空"),
    CARNUMBER_NULL(3,"会员卡号不能为空"),
    ORDER_STATUS_UPDATE_FAIL(3,"订单状态修改失败"),
    ORDER_NULL(3,"暂无订单"),
    TOTAL_PRICE_ERROR(3,"单项总价有误"),
    TOTAL_PRICE_ALL_ERROR(3,"总合价有误"),
    ORDER_NO_PAY(3,"订单状态必须为已支付才能修改");
    private final int code;
    private final String desc;

    ResponseCodeOrderEnum(int code, String desc) {
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
