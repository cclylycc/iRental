package com.javaclimb.houserent.common.enums;

/*
 * 订单状态枚举
 * */
public enum OrderStatusEnum {

    /*
     * 订单状态：-3租客已取消 -2待签合同 -1待付款 0生效中 1已到期
     * */

    NORMAL(0),

    FINIS(1),

    NOT_PAY(-1),

    NOT_AGREEMENT(-2),

    CUSTOMER_CANCEL(-3);

    private Integer value;

    OrderStatusEnum(Integer value) {
        this.value = value;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }
}
