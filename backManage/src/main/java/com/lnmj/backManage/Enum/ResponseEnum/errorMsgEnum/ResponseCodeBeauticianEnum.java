package com.lnmj.backManage.Enum.ResponseEnum.errorMsgEnum;

/**
 * @Auther: panlin
 * @Date: 2019/4/22 13:46
 * @Description:
 */
public enum ResponseCodeBeauticianEnum {

    BEAUTICIAN_LIST_NULL(3,"美容师列表不存在"),
    BEAUTICIAN_ID_NULL(3,"美容师ID不能为空"),
    BEAUTICIAN_ADD_FAIL(3,"美容师添加失败"),
    GROUPID_NULL(3,"美容师组号不能为空"),
    POSTID_NULL(3,"美容师所属职位不能空"),
    SORT_NULL(3,"美容师排序不能为空"),
    GRADEID_NULL(3,"美容师等级不能为空"),
    STOREID_NULL(3,"美容师所属店铺不能为空"),
    ENTRYTIME_NULL(3,"美容师入职时间不能为空"),
    GENDER_NULL(3,"美容师性别不能为空"),
    POST_ID_NULL(3,"职位不能为空"),
    MOBILE_NULL(3,"美容师电话不能为空"),
    MOBILE_ILLEGAL(3,"美容师电话格式错误"),
    MOBILE_EXIST(3,"此电话已经存在"),
    MOBILE_USER_NULL(3,"指定手机号码用户不存在"),
    UPDATE_BEAUTICIAN_FAIL(3,"修改美容师失败"),
    DELETE_BEAUTICIAN_FAIL(3,"删除美容师失败"),
    ORDER_WORK_FAIL(3,"排班失败"),
    ORDERWORKDATE_NULL(3,"排班日期不能为空"),
    ORDERWORK_NULL_CANNOT_DELETE(3,"此美容师暂未排班，无法删除"),
    TIMENODES_NULL(3,"排班时间节点不能为空"),
    ORDERWORK_NULL(3,"此美容师暂无排班"),
    ORDERWORK_EXIST(3,"此美容师已经有排班了"),
    PROJECT_NULL(3,"授权项目不能为空"),
    ADD_PROJECT_NULL(3,"未进行任何授权"),
    BEAUTICIAN_PROJECT_NULL(3,"此美容师暂无授权项目"),
    SELECT_POST_FAIL(3,"查询职位失败"),
    SELECT_GROUP_FAIL(3,"查询分组失败"),
    DELETE_FAIL_USING_POST(3,"此职位正在使用中，无法删除"),
    DELETE_FAIL_USING_GROUP(3,"此分组正在使用中，无法删除");
    private final int code;
    private final String desc;

    ResponseCodeBeauticianEnum(int code, String desc) {
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
