package com.lnmj.backManage.Enum.ResponseEnum.errorMsgEnum;

/**
 * @Auther: panlin
 * @Date: 2019/4/22 13:46
 * @Description:
 */
public enum ResponseCodeStoreEnum {

    STOREID_ISNOTNULL(3,"门店id不能为空"),
    STORELIST_ISNOTEXICT(3,"门店列表不存在"),
    STORECATEGORYLIST_ISNOTEXICT(3,"门店分类列表不存在"),
    ADD_STORE_FAIL(3,"门店添加失败"),
    STORE_NAME_EXIT(3,"店铺名称已经存在"),
    STORE_UPDATE_FAIL(3,"店铺信息修改失败"),
    DELETE_STORE_FAIL(3,"店铺删除失败"),
    MOBILE_ILLEGAL(3,"电话号码格式不正确");
    private final int code;
    private final String desc;

    ResponseCodeStoreEnum(int code, String desc) {
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
