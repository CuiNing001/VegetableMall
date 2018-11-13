//
//  DataSource.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/9.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataSource : NSObject

+ (DataSource *)getDataManager;

/*
 * 1.登录:   /login
 *  @param phone   :登录手机号
 *  @param password:登录密码
 */
- (void)fetchLoginWithPhone:(NSString *)phone
                   password:(NSString *)password
                    success:(void(^)(id result))success
                      faile:(void(^)(id error))faile;
/*
 * 2.注册验证码:   /sendCaptchaByRegister
 *  @param phone   :登录手机号
 */
- (void)fetchRegisterCaptchaWithPhone:(NSString *)phone
                              success:(void(^)(id result))success
                                faile:(void(^)(id error))faile;
/*
 * 3.注册:   /register
 *  @param phone   :登录手机号
 *  @param code    :验证码
 *  @param password:登录密码
 *  @param pCode   :邀请码
 */
- (void)fetchRegisterWithPhone:(NSString *)phone
                          code:(NSString *)code
                      password:(NSString *)password
                         pCode:(NSString *)pCode
                       success:(void(^)(id result))success
                         faile:(void(^)(id error))faile;
/*
 * 4.关联提货点:   /delivery/choose
 *  @param deliveryId   :提货点id
 */
- (void)fetchDeliveryChooseWithDeliveryId:(NSString *)deliveryId
                                  success:(void(^)(id result))success
                                    faile:(void(^)(id error))faile;
/*
 * 5.忘记密码发送验证码  :/sendCaptchaByResetPassword
 *  @param phone      :手机号
 */
- (void)fetchSendCaptchaByResetPasswordWithPhone:(NSString *)phone
                                         success:(void(^)(id result))success
                                           faile:(void(^)(id error))faile;
/*
 * 6.忘记密码:   /resetPassword
 *  @param phone   :登录手机号
 *  @param code    :验证码
 *  @param password:登录密码
 */
- (void)fetcaResetPasswordWithPhone:(NSString *)phone
                               code:(NSString *)code
                           password:(NSString *)password
                            success:(void(^)(id result))success
                              faile:(void(^)(id error))faile;
/*
 * 7.退出:   /logout
 */
- (void)fetchLogoutSuccess:(void(^)(id result))success
                     faile:(void(^)(id error))faile;

/*
 * 8.首页:   /index
 */
- (void)fetchIndexSuccess:(void(^)(id result))success
                    faile:(void(^)(id error))faile;

/*
 * 9.特价商品列表页:   /goods/discountList
 */
- (void)fetchDiscountListSuccess:(void(^)(id resule))success
                           faile:(void(^)(id error))faile;

/*
 * 10.预售商品列表页:   /goods/preGoodsList
 */
- (void)fetchPreListSuccsee:(void(^)(id resule))success
                      faile:(void(^)(id error))faile;

/*
 * 11.热门搜索关键字列表:   /goods/keywordList
 */
- (void)fetchKeywordListSuccess:(void(^)(id resule))success
                          faile:(void(^)(id error))faile;

/*
 * 12.搜索商品列表      :/delivery/searchList
 *  @param goodsName  :搜索关键字
 */
- (void)fetchSearchLisWithGoodsName:(NSString *)goodsName
                            Success:(void(^)(id resule))success
                              faile:(void(^)(id error))faile;

/*
 * 13.未读消息:   /message/isHas
 */
- (void)fetchMessageIsHasSuccess:(void(^)(id resule))success
                           faile:(void(^)(id erroe))faile;

@end

NS_ASSUME_NONNULL_END
