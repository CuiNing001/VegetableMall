//
//  DataSource.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/9.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "DataSource.h"
#import "ResultModel.h"

@implementation DataSource

+(DataSource *)getDataManager
{
    static DataSource *dataSource = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataSource = [[DataSource alloc]init];
    });
    return dataSource;
}

#pragma mark - 登录/注册
/*
 * 1.登录:   /login
 *  @param phone   :登录手机号
 *  @param password:登录密码
 */
- (void)fetchLoginWithPhone:(NSString *)phone
                   password:(NSString *)password
                    success:(void(^)(id result))success
                      faile:(void(^)(id error))faile
{
    NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_BASE_URL,LOGIN_URL];
    NSDictionary *paramDic = @{@"phone":phone,@"password":password};
    [[AFNetManager netShareManager]requestPOSTWithURLStr:url paramDic:paramDic token:@"" finish:^(id  _Nonnull responserObject)
    {
        NSLog(@"login__success__:%@",responserObject);
        ResultModel *model = [ResultModel mj_objectWithKeyValues:responserObject];
        if (model.code.integerValue == 9200)
        {
            success(model.data);
        }
        else
        {
            [[AlertManager alertShareManager]toastWithMessage:model.msg time:2.0];
        }
    }
    enError:^(NSError * _Nonnull error)
    {
        faile(error);
        NSLog(@"login_faile__:%@",error);
    }];
}
/*
 * 2.注册验证码:   /sendCaptchaByRegister
 *  @param phone   :登录手机号
 */
- (void)fetchRegisterCaptchaWithPhone:(NSString *)phone success:(void(^)(id result))success faile:(void(^)(id error))faile
{
    NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_BASE_URL,REGISTER_CAPTCHA_URL];
    NSDictionary *paramDic = @{@"phone":phone};
    [[AFNetManager netShareManager]requestPOSTWithURLStr:url paramDic:paramDic token:@"" finish:^(id  _Nonnull responserObject)
    {
        NSLog(@"register__captcha__success__:%@",responserObject);
        ResultModel *model = [ResultModel mj_objectWithKeyValues:responserObject];
        if (model.code.integerValue == 9200)
        {
            success(model.data);
        }
        else
        {
            [[AlertManager alertShareManager]toastWithMessage:model.msg time:2.0];
        }
    }
    enError:^(NSError * _Nonnull error)
    {
        faile(error);
        NSLog(@"register__captcha_faile__:%@",error);
    }];
}
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
                         faile:(void(^)(id error))faile
{
    NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_BASE_URL,REGISTER_URL];
    NSDictionary *paramDic = @{
                               @"phone":phone,
                               @"code":code,
                               @"password":password,
                               @"pCode":pCode
                               };
    [[AFNetManager netShareManager]requestPOSTWithURLStr:url paramDic:paramDic token:@"" finish:^(id  _Nonnull responserObject)
     {
         NSLog(@"register__success__:%@",responserObject);
         ResultModel *model = [ResultModel mj_objectWithKeyValues:responserObject];
         if (model.code.integerValue == 9200)
         {
             success(model.data);
         }
         else
         {
             [[AlertManager alertShareManager]toastWithMessage:model.msg time:2.0];
         }
     }
     enError:^(NSError * _Nonnull error)
     {
         faile(error);
         NSLog(@"register_faile__:%@",error);
     }];
}
/*
 * 4.关联提货点:   /delivery/choose
 *  @param deliveryId   :提货点id
 */
- (void)fetchDeliveryChooseWithDeliveryId:(NSString *)deliveryId success:(void(^)(id result))success faile:(void(^)(id error))faile
{
    NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_BASE_URL,DELLIVERY_CHOOSE_URL];
    NSDictionary *paramDic = @{@"deliveryId":deliveryId};
    [[AFNetManager netShareManager]requestPOSTWithURLStr:url paramDic:paramDic token:@"" finish:^(id  _Nonnull responserObject)
     {
         NSLog(@"delivery__choose__success__:%@",responserObject);
         ResultModel *model = [ResultModel mj_objectWithKeyValues:responserObject];
         if (model.code.integerValue == 9200)
         {
             success(model.data);
         }
         else
         {
             [[AlertManager alertShareManager]toastWithMessage:model.msg time:2.0];
         }
     }
      enError:^(NSError * _Nonnull error)
     {
         faile(error);
         NSLog(@"delivery__choose_faile__:%@",error);
     }];
}
/*
 * 5.忘记密码发送验证码  :/sendCaptchaByResetPassword
 *  @param phone      :手机号
 */
- (void)fetchSendCaptchaByResetPasswordWithPhone:(NSString *)phone success:(void(^)(id result))success faile:(void(^)(id error))faile
{
    NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_BASE_URL,RESET_PASSWORD_CAPTCHA_URL];
    NSDictionary *paramDic = @{@"phone":phone};
    [[AFNetManager netShareManager]requestPOSTWithURLStr:url paramDic:paramDic token:@"" finish:^(id  _Nonnull responserObject)
     {
         NSLog(@"reset_password_captcha__success__:%@",responserObject);
         ResultModel *model = [ResultModel mj_objectWithKeyValues:responserObject];
         if (model.code.integerValue == 9200)
         {
             success(model.data);
         }
         else
         {
             [[AlertManager alertShareManager]toastWithMessage:model.msg time:2.0];
         }
     }
      enError:^(NSError * _Nonnull error)
     {
         faile(error);
         NSLog(@"reset_password_captcha_faile__:%@",error);
     }];
}
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
                              faile:(void(^)(id error))faile
{
    NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_BASE_URL,RESET_PASSWORD_URL];
    NSDictionary *paramDic = @{
                               @"phone":phone,
                               @"code":code,
                               @"password":password,
                               };
    [[AFNetManager netShareManager]requestPOSTWithURLStr:url paramDic:paramDic token:@"" finish:^(id  _Nonnull responserObject)
     {
         NSLog(@"reset__password__success__:%@",responserObject);
         ResultModel *model = [ResultModel mj_objectWithKeyValues:responserObject];
         if (model.code.integerValue == 9200)
         {
             success(model.data);
         }
         else
         {
             [[AlertManager alertShareManager]toastWithMessage:model.msg time:2.0];
         }
     }
      enError:^(NSError * _Nonnull error)
     {
         faile(error);
         NSLog(@"reset__password_faile__:%@",error);
     }];
}
/*
 * 7.退出:   /logout
 */
- (void)fetchLogoutSuccess:(void(^)(id result))success faile:(void(^)(id error))faile
{
    NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_BASE_URL,LOGOUT_URL];
    [[AFNetManager netShareManager]requestPOSTWithURLStr:url paramDic:@{} token:@"" finish:^(id  _Nonnull responserObject)
     {
         NSLog(@"logout__success__:%@",responserObject);
         ResultModel *model = [ResultModel mj_objectWithKeyValues:responserObject];
         if (model.code.integerValue == 9200)
         {
             success(model.data);
         }
         else
         {
             [[AlertManager alertShareManager]toastWithMessage:model.msg time:2.0];
         }
     }
     enError:^(NSError * _Nonnull error)
     {
         faile(error);
         NSLog(@"logout_faile__:%@",error);
     }];
}

#pragma mark - 首页
/*
 * 8.首页:   /index
 */
- (void)fetchIndexSuccess:(void(^)(id result))success faile:(void(^)(id error))faile
{
    NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_BASE_URL,INDEX_URL];
    [[AFNetManager netShareManager]requestPOSTWithURLStr:url paramDic:@{} token:@"" finish:^(id  _Nonnull responserObject)
    {
        NSLog(@"index__success__:%@",responserObject);
        ResultModel *model = [ResultModel mj_objectWithKeyValues:responserObject];
        if (model.code.integerValue == 9200)
        {
            success(model.data);
        }
        else
        {
            [[AlertManager alertShareManager]toastWithMessage:model.msg time:2.0];
        }
    }
    enError:^(NSError * _Nonnull error)
    {
        faile(error);
        NSLog(@"index_faile__:%@",error);
    }];
}
/*
 * 9.特价商品列表页:   /goods/discountList
 */
- (void)fetchDiscountListSuccess:(void(^)(id resule))success faile:(void(^)(id error))faile
{
    NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_BASE_URL,GOODS_DISCOUNT_LIST];
    [[AFNetManager netShareManager]requestPOSTWithURLStr:url paramDic:@{} token:@"" finish:^(id  _Nonnull responserObject)
    {
        NSLog(@"discount__list__success__:%@",responserObject);
        ResultModel *model = [ResultModel mj_objectWithKeyValues:responserObject];
        if (model.code.integerValue == 9200)
        {
            success(model.data);
        }
        else
        {
            [[AlertManager alertShareManager]toastWithMessage:model.msg time:2.0];
        }
    }
    enError:^(NSError * _Nonnull error)
    {
        faile(error);
        NSLog(@"discount__list_faile__:%@",error);
    }];
}
/*
 * 10.预售商品列表页:   /goods/preGoodsList
 */
- (void)fetchPreListSuccsee:(void(^)(id resule))success faile:(void(^)(id error))faile
{
    NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_BASE_URL,GOODS_PRE_LIST];
    [[AFNetManager netShareManager]requestPOSTWithURLStr:url paramDic:@{} token:@"" finish:^(id  _Nonnull responserObject)
     {
         NSLog(@"pre__list__success__:%@",responserObject);
         ResultModel *model = [ResultModel mj_objectWithKeyValues:responserObject];
         if (model.code.integerValue == 9200)
         {
             success(model.data);
         }
         else
         {
             [[AlertManager alertShareManager]toastWithMessage:model.msg time:2.0];
         }
     }
     enError:^(NSError * _Nonnull error)
     {
         faile(error);
         NSLog(@"pre__list_faile__:%@",error);
     }];
}
/*
 * 11.热门搜索关键字列表:   /goods/keywordList
 */
- (void)fetchKeywordListSuccess:(void(^)(id resule))success faile:(void(^)(id error))faile
{
    NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_BASE_URL,GOODS_KEYWORD_LIST];
    [[AFNetManager netShareManager]requestPOSTWithURLStr:url paramDic:@{} token:@"" finish:^(id  _Nonnull responserObject)
     {
         NSLog(@"keyword__list__success__:%@",responserObject);
         ResultModel *model = [ResultModel mj_objectWithKeyValues:responserObject];
         if (model.code.integerValue == 9200)
         {
             success(model.data);
         }
         else
         {
             [[AlertManager alertShareManager]toastWithMessage:model.msg time:2.0];
         }
     }
     enError:^(NSError * _Nonnull error)
     {
         faile(error);
         NSLog(@"keyword__list_faile__:%@",error);
     }];
}
/*
 * 12.搜索商品列表      :/delivery/searchList
 *  @param goodsName  :搜索关键字
 */
- (void)fetchSearchLisWithGoodsName:(NSString *)goodsName Success:(void(^)(id resule))success faile:(void(^)(id error))faile
{
    NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_BASE_URL,LOGIN_URL];
    NSDictionary *paramDic = @{@"goodsName":goodsName};
    [[AFNetManager netShareManager]requestPOSTWithURLStr:url paramDic:paramDic token:@"" finish:^(id  _Nonnull responserObject)
     {
         NSLog(@"search_list__success__:%@",responserObject);
         ResultModel *model = [ResultModel mj_objectWithKeyValues:responserObject];
         if (model.code.integerValue == 9200)
         {
             success(model.data);
         }
         else
         {
             [[AlertManager alertShareManager]toastWithMessage:model.msg time:2.0];
         }
     }
    enError:^(NSError * _Nonnull error)
     {
         faile(error);
         NSLog(@"search_list_faile__:%@",error);
     }];
}
/*
 * 13.未读消息:   /message/isHas
 */
- (void)fetchMessageIsHasSuccess:(void(^)(id resule))success faile:(void(^)(id erroe))faile
{
    NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_BASE_URL,MESSAGE_ISHAS_URL];
    [[AFNetManager netShareManager]requestPOSTWithURLStr:url paramDic:@{} token:TOKEN finish:^(id  _Nonnull responserObject)
     {
         NSLog(@"message__isHas__success__:%@",responserObject);
         ResultModel *model = [ResultModel mj_objectWithKeyValues:responserObject];
         if (model.code.integerValue == 9200)
         {
             success(model.data);
         }
         else
         {
             [[AlertManager alertShareManager]toastWithMessage:model.msg time:2.0];
         }
     }
     enError:^(NSError * _Nonnull error)
     {
         faile(error);
         NSLog(@"message__isHas_faile__:%@",error);
     }];
}


@end
