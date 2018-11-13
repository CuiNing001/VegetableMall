//
//  Url.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/1.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#ifndef Url_h
#define Url_h

/*
 * 除登录、注册和获取验证码外，其他接口请求时必须在header中加入token
 * 需要分页的时候  传page(页码) rows(条数) 可传可不传
 * 9200 请求成功
 * 9500 服务器错误
 * 9400 客户端参数错误
 * 9201 会话过期，重新登录
 */
// 开发环境
// #define SERVER_BASE_URL @"http://192.168.1.20:8900/"

// 线上环境
#define SERVER_BASE_URL @"http://app.caidasao.cn/"

// token  0575e2c9-c617-4a88-9eb6-a17e4dc52a90
#define TOKEN @"0575e2c9-c617-4a88-9eb6-a17e4dc52a90"

//********************************    登录\注册    **************************************／/

/*
 * 1.登录:   /login
 *  @param phone   :登录手机号
 *  @param password:登录密码
 */

#define LOGIN_URL  @"login"

/*
 * 2.注册验证码:   /sendCaptchaByRegister
 *  @param phone   :登录手机号
 */

#define REGISTER_CAPTCHA_URL  @"sendCaptchaByRegister"

/*
 * 3.注册:   /register
 *  @param phone   :登录手机号
 *  @param code    :验证码
 *  @param password:登录密码
 *  @param pCode   :邀请码
 */
#define REGISTER_URL @"register"

/*
 * 4.关联提货点:   /delivery/choose
 *  @param deliveryId   :提货点id
 */
#define DELLIVERY_CHOOSE_URL @"delivery/choose"

/*
 * 5.忘记密码发送验证码  :/sendCaptchaByResetPassword
 *  @param phone      :手机号
 */
#define RESET_PASSWORD_CAPTCHA_URL @"sendCaptchaByResetPassword"

/*
 * 6.忘记密码:   /resetPassword
 *  @param phone   :登录手机号
 *  @param code    :验证码
 *  @param password:登录密码
 */
#define RESET_PASSWORD_URL @"resetPassword"

/*
 * 7.退出:   /logout
 */
#define LOGOUT_URL @"logout"


//********************************    首页    **************************************／/

/*
 * 8.首页:   /index
 */
#define INDEX_URL @"index"

/*
 * 9.特价商品列表页:   /goods/discountList
 */
#define GOODS_DISCOUNT_LIST @"goods/discountList"

/*
 * 10.预售商品列表页:   /goods/preGoodsList
 */
#define GOODS_PRE_LIST @"goods/preGoodsList"

/*
 * 11.热门搜索关键字列表:   /goods/keywordList
 */
#define GOODS_KEYWORD_LIST @"goods/keywordList"

/*
 * 12.搜索商品列表      :/delivery/searchList
 *  @param goodsName  :搜索关键字
 */
#define DELLIVERY_SEARCH_LIST_URL @"delivery/searchList"

/*
 * 13.未读消息:   /message/isHas
 */
#define MESSAGE_ISHAS_URL @"message/isHas"

//****************************    分类商品    *********************************／/

/*
 * 14.查询分类    :/goodsCategory/list
 *  @param pid  :上级分类id，传0或不传查询结果为一级分类，传其他值为查询二级分类，如pid=61
 */
#define GOODS_CATEGORY_LIST_URL @"goodsCategory/list"

/*
 * 15.根据分类查询商品列表    :/goods/list
 *  @param pid       : 一级分类id
 *  @param categoryId: 二级分类id
 *  两个参数不能同时为空，categoryId不为空时查询结果为该分类下的商品，为空时查询结果为一级分类pid下的全部商品
 */
#define GOODS_LIST_URL @"goods/list"


//****************************    购物车接口    *********************************／/

/*
 * 16.查询购物车:   /cart/list
 */
#define CART_LIST_URL @"/cart/list"

/*
 * 17.购物车加       :/cart/plus
 *  @param goodsId :商品id
 */
#define CART_PLUS_URL @"cart/plus"

/*
 * 18.购物车减       :/cart/minus
 *  @param goodsId :商品id
 */
#define CART_MINUS_URL @"cart/minus"

/*
 * 19.删除购物车      :/cart/remove
 *  @param goodsId :商品id
 */
#define CART_REMOVE_URL @"cart/remove"


//****************************    商品相关接口（详情、收藏、取消收藏）    *********************************／/


/*
 * 20.商品详情      :/goods/detail
 *  @param goodsId :商品id
 */
#define GOODS_DETAIL_URL @"goods/detail"

/*
 * 21.添加收藏      :/favorite/add
 *  @param goodsId :商品id
 */
#define FAVOURITE_ADD_URL @"favorite/add"

/*
 * 22.取消收藏      :/favorite/remove
 *  @param goodsId :商品id
 */
#define FAVOURITE_REMOVE_URL @"favorite/remove"


//****************    个人中心接口（包含我的收藏、我的优惠券、常用菜谱、奖励记录等，增加分享页面    **************／/


/*
 * 23.个人信息:   /user/detail
 */
#define USER_DETAIL_URL @"user/detail"

/*
 * 22.上传头像           :/user/updateAvatar
 *  @param pictureFile :头像文件，二进制流的形式
 */
#define USER_UPDATE_AVATAR_URL @"user/updateAvatar"

/*
 * 23.修改个人信息:   /user/update
 *  @param nickname :昵称
 *  @param sex      :性别
 *  @param address  :地址
 */
#define USER_UPDATE_URL @"user/update"

/*
 * 24.用户协议:   /setting/agreement
 * 用户协议H5页面
 */
#define SETTING_AGREEMENT_URL @"setting/agreement"

/*
 * 25.关于我们:   /setting/about
 */
#define SETTING_ABOUT_URL @"setting/about"

/*
 * 26.电话客服:   /setting/tel
 */
#define SETTING_TEL_URL @"setting/tel"

/*
 * 27.我的收藏:   /favorite/list
 */
#define FAVOURITE_LIST_URL @"favorite/list"

/*
 * 28.我的优惠券:  /coupon/list
 */
#define COUNPON_LIST_URL @"coupon/list"

/*
 * 29.常用菜谱:  /cookbook/list
 */
#define COOKBOOK_LIST_URL @"cookbook/listt"

/*
 * 30.奖励记录     :/user/feeList
 *  @param level :奖励级别，一级传值level=1，二级传值level=2
 */
#define USER_FEE_LIST_URL @"user/feeList"

/*
 * 31.分享页面:  /user/share
 */
#define USER_SHARE_URL @"user/share"


//******************************    我的消息   ***************************／/

/*
 * 32.系统公告列表:  /notice/list
 */
#define NOTICE_LIST_URL @"/notice/list"

/*
 * 33.系统公告详情     :/notice/detail
 *  @param noticeId :系统公告id
 */
#define NOTICE_DETAIL_URL @"notice/detail"

/*
 * 34.我的消息列表:  /message/list
 */
#define MESSAGE_LIST_URL @"message/list"

/*
 * 35.我的消息详情     :/message/detail
 *  @param messageId :消息id
 */
#define MESSAGE_DETAIL_URL @"message/detail"

/*
 * 36.获取在线客服:  /customer
 */
#define CUSTOMER_URL @"customer"


//******************************    我的钱包（充值、充值记录、退款记录   ***************************／/

/*
 * 37.充值记录:  /deposit/list
 */
#define DEPOSIT_LIST_URL @"deposit/list"

/*
 * 38.退款记录:  /refund/list
 */
#define REFUND_LIST_URL @"refund/list"

/*
 * 39.充值赠送规则:  /deposit/activityList
 */
#define DEPOSIT_ACTIVITY_LIST_URL @"deposit/activityList"

/*
 * 40.充值支付（支付宝支付、微信支付）:  /deposit/pay
 *  @param activityId :充值赠送活动规则id
 *  @param payType    :支付宝传值payType=2，微信传值payType=3
 */
#define DEPOSIT_PAY_URL @"deposit/pay"


//******************************    预约厨师（预约、添加预约记录   ***************************／/

/*
 * 41.查询厨师标准: /cook/list
 */
#define COOK_LIST_URL @"cook/list"

/*
 * 42.预约提交:  /cook/reservation
 *  @param cookId        :厨师列表id
 *  @param repastTime    :就餐时间，格式yyyy-MM-dd HH:mm:ss
 *  @param address       :就餐地址
 */
#define COOK_RESERVAION_URL @"cook/reservation"

/*
 * 43.预约支付（钱包方式支付）     :/cook/reservation/wallet
 *  @param reservationId :预约id
 */
#define COOK_RESERVATION_WALLET_URL @"cook/reservation/wallet"

/*
 * 44.预约支付（支付宝支付）     :/cook/reservation/alipay
 *  @param reservationId :预约id
 */
#define COOK_RESERVATION_ALIPAY_URL @"cook/reservation/alipay"

/*
 * 45.预约支付（微信支付）     :/cook/reservation/weixin
 *  @param reservationId :预约id
 */
#define COOK_RESERVATION_WEIXIN_URL @"cook/reservation/weixin"

/*
 * 46.预约记录: /cook/reservationList
 */
#define COOK_RESERVATION_LIST_URL @"cook/reservationList"


//******************************    提货点   ***************************／/

/*
 * 47.区列表: /delivery/districtList
 */
#define DELIVERY_DISTRICT_LIST_URL @"delivery/districtList"

/*
 * 48.提货点列表:  /delivery/list
 *  @param longitude   :坐标，经度
 *  @param latitude    :坐标，纬度
 *  @param districtId  :区id，查询所有时不传该参数
 */
#define DELIVERY_LIST_URL @"delivery/list"

/*
 * 49.提货点详情     :/delivery/detail
 *  @param deliveryId :提货点id
 */
#define DELIVERY_DETAIL_URL @"delivery/detail"


//******************************    订单相关接口   ***************************／/

/*
 * 50.结算页面   :/order/settlement
 *  @param ids :购物车id，多个id以英文逗号,分割，如：154,160
 */
#define ORDER_SETTLEMENT_URL @"order/settlement"

/*
 * 51.付款页面钱包余额: /order/wallet/balance
 */
#define ORDER_WALLET_BALANCE_URL @"order/wallet/balance"

/*
 * 52.支付: /order/pay
 *  @param ids        :购物车id，多个id以英文逗号,分割，如：154,160
 *  @param payType    :支付方式：钱包余额传值payType=1，支付宝支付传值payType=2，微信支付传值payType=3
 *  @param deliveryId :提货点id
 *  @param takeDate   :取货日期，时间格式为yyyy-MM-dd
 *  @param takeTime   :取货时间段字符串
 *  @param couponId   :优惠券id，非必填项
 *  @param bagId      :购物袋id，非必填项
 */
#define ORDER_PAY_URL @"order/pay"

/*
 * 53.我的订单        :/order/list
 *  @param payState :待支付payState=1，待取货payState=3，待评价payState=4。查询全部时不传该参数
 */
#define ORDER_LIST_URL @"order/list"

/*
 * 54.提货页面: /order/takeList
 */
#define ORDER_TAKE_LIST_URL @"order/takeList"

/*
 * 55.订单详情       :/order/detail
 *  @param orderId :订单Id
 */
#define ORDER_DETALI_URL @"order/detail"

/*
 * 56.未支付订单倒计时结束关闭       :/order/close
 *  @param orderId :订单Id
 */
#define ORDER_CLOSE_URL @"order/close"

/*
 * 57.评价页面数据       :/order/comment
 *  @param orderId :订单Id
 */
#define ORDER_COMMENT_URL @"order/comment"

/*
 * 58.评价内容提交       :/order/commentSubmit
 *  @param orderId :订单Id
 *  @param jsonContent :评价商品和内容，
 *   (json格式字符串，如下：{"75":"商品非常好，太好吃啦","90":"太好吃啦"},属性key代表商品id，value代表评价内容，如不填写评价内容默认为“好评！”)
 */
#define ORDER_COMMENT_SUBMIT_URL @"order/commentSubmit"

/*
 * 59.待支付订单直接支付       :/order/toPay
 *  @param orderId :订单Id
 *  @param payType :钱包余额传值payType=1，支付宝支付传值payType=2，微信支付传值payType=3
 */
#define ORDER_TOPAY_URL @"order/toPay"


//******************************    预售商品结算、支付   ***************************／/

/*
 * 60.预售商品结算页面       :/goods/settlement
 *  @param goodsId  :商品id
 *  @param goodsNum :商品数量
 */
#define GOODS_SEETLEMENT_URL @"goods/settlement"

/*
 * 61.付款页面钱包余额: /order/wallet/balance
 */
#define ORDER_WALLET_BALANCE_URL @"order/wallet/balance"


/*
 * 63.支付: /goods/pay
 *  @param goodsId    :商品id
 *  @param goodsNum   :商品数量
 *  @param payType    :钱包余额传值payType=1，支付宝支付传值payType=2，微信支付传值payType=3
 *  @param deliveryId :提货点id
 *  @param takeDate   :取货日期，时间格式为yyyy-MM-dd
 *  @param takeTime   :取货时间段字符串
 *  @param couponId   :优惠券id，非必填项
 *  @param bagId      :购物袋id，非必填项
 */
#define GOODS_PAY_URL @"goods/pay"






#endif /* Url_h */
