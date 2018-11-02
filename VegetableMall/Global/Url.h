//
//  Url.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/1.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#ifndef Url_h
#define Url_h

//基地址
//#define     SERVER_BASE_URL           @"http://192.168.1.19:8900/"
#define     SERVER_BASE_URL           @"http://huashengcai.aolazuche.com/peanutapp/"

//开发环境
//#define     SERVER_BASE_URL           @"http://59.110.175.231:8810/foodmall/"
//线上环境
//#define     SERVER_BASE_URL           @"http://app.caidasao.cn/"

//**********************************************************************／/
//1.登录
#define     LOGIN_URL                        @"/login"
//2.忘记密码(发送验证码)
#define     SENDRESETPASSWORD_URL            @"/sendCaptchaByResetPassword"
//3.忘记密码
#define     RESETPASSWORD_URL                @"/resetPassword"
//4.退出
#define     LOGINOUT_URL                     @"/logout"
//5.修改密码
#define     UPDATEPASSWORD_URL               @"/updatePassword"
//6.首页数据
#define     HOMEINDEX_URL                    @"/index"
//7.个人信息
#define     USERMY_URL                       @"/user/my"
//8.上传头像
#define     UPDATEAVATAR_URL                 @"/user/updateAvatar"
//9.修改昵称
#define     UPDATE_URL                       @"/user/update"
//10.身份认证
#define     VERIFY_URL                       @"/user/verify"
//11.更换手机号 发送手机验证码
#define     SENDUPDATEPHONE_URL              @"/user/sendCaptchaByUpdatePhone"
//12.更换手机号
#define     UPDATEPHONE_URL                  @"/user/updatePhone"
//13.更换手机号 发送手机验证码
#define     SENDCAPTCHAPHONE_URL             @"/user/sendCaptchaBySetExchangePassword"
//14.设置提现密码
#define     SETPASSWORD_URL                  @"/user/setExchangePassword"
//15.账户明细
#define     ACCOUNTLIST_URL                  @"/user/accountList"
//16.我的关注
#define     FOCUSLIST_URL                    @"/user/focusList"
//17.更多选项客服电话
#define     GETTEL_URL                       @"/user/getTel"
//18.系统公告列表
#define     NOTICELIST_URL                   @"/user/noticeList"
//19.我的消息列表
#define     MESSAGELIST_URL                  @"/user/messageList"
//20.系统公告详情
#define     NOTICEDETAIL_URL                 @"/user/noticeDetail"
//21.我的消息详情
#define     MESSAGEDETAIL_URL                @"/user/messageDetail"
//22.意见反馈提交
#define     ADDFEEDBACK_URL                  @"/user/addFeedback"
//23.提现页面
#define     WITHDRAW_URL                     @"/user/withdraw"
//24.用户协议
#define     AGREEMENT_URL                    @"/user/setting/agreement"
//25.关于我们
#define     ABOUT_URL                        @"/user/setting/about"
//26.足球玩法
#define     FOOTBALL_URL                     @"/user/setting/football"
//27.篮球玩法
#define     BASKETBALL_URL                   @"/user/setting/basketball"
//28.充值发起支付
#define     RECHARGE_URL                     @"/recharge/pay"
//29.发起提现申请
#define     WITHDRAWSUMIT_URL                @"/user/withdrawSumit"
//30.查询支付状态
#define     CHECKPAY_URL                     @"/recharge/checkPay"
//31.足球比赛名称
#define     FOOTBALLNAME_URL                 @"/match/getFootballName"
//32.竞彩足球
#define     FOOTBALLLIST_URL                 @"/match/footballList"
//33.篮球比赛名称
#define     BASKETBALLNAME_URL               @"/match/getBasketballName"
//34.竞彩篮球
#define     BASKETBALLLIST_URL               @"/match/basketballList"
//35.线下转账账户
#define     OFFLINE_URL                      @"/recharge/offline"
//36.关注详情
#define     FOCUSDETAILS_URL                 @"/user/focusDetails"
//37.发现 开奖结果
#define     FINDMATCH_URL                    @"/match/findMatch"
//38.发现 开奖结果
#define     FINDNEWS_URL                     @"/news/findNews"
//39.购彩记录
#define     BETLIST_URL                      @"/user/betList"
//40.购彩记录详情
#define     BETDETAIL_URL                    @"/user/betDetail"
//41.出票明细
#define     BETDETAILED_URL                  @"/user/betDetailed"
//42.组合过关玩法种类
#define     BETCOMBINE_URL                   @"/bet/getCombinePlaying"
//43.下注前计算注数和预期奖金
#define     CALCULATE_URL                    @"/bet/calculate"
//44.下注
#define     ADDBET_URL                       @"/bet/addBet"
//45.跟单列表
#define     FOLLOWBETLIST_URL                @"/bet/followBetList"
//46.跟单详情
#define     FOLLOWBETDETAIL_URL              @"/bet/followBetDetail"
//47.参与跟单
#define     ADDFOLLOWBET_URL                 @"/bet/addFollowBet"
//48.比赛列表 足球
#define     FOOTBALLDETAILS_URL              @"/match/footballDetails"
//49.比赛列表 篮球
#define     BASKETBALLDETAILS_URL            @"/match/basketballDetails"
//50.发现 资讯
#define     FINDNEWS_URL                     @"/news/findNews"
//51.资讯详情
#define     NEWSDETAIL_URL                   @"/news/newsDetail"
//52.添加关注
#define     ADDFOCUS_URL                     @"/user/addFocus"
//53.取消关注
#define     DELETEFOCUS_URL                  @"/user/deleteFocus"

#endif /* Url_h */
