//
//  Const.swift
//  TestKitchen
//
//  Created by gaokunpeng on 16/8/16.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

//屏幕的宽度和高度
public let kScreenW = UIScreen.mainScreen().bounds.size.width
public let kScreenH = UIScreen.mainScreen().bounds.size.height


//首页推荐点击事件的类型


//接口
//大部分是Post请求
public let kHostUrl = "http://api.izhangchu.com/?appVersion=4.5&sysVersion=9.3.2&devModel=iPhone"


//一、食谱
//1、推荐
//首页推荐参数
//methodName=SceneHome&token=&user_id=&version=4.5

//1)广告
//广告详情
//methodName=CourseSeriesView&series_id=22&token=&user_id=&version=4.32

//广告分享
//methodName=AppShare&shareID=&shareModule=course&token=&user_id=&version=4.32

//评论
//methodName=CommentList&page=1&relate_id=22&size=10&token=&type=2&user_id=&version=4.32
//methodName=CommentList&page=2&relate_id=22&size=10&token=&type=2&user_id=&version=4.32

//评论发送
//content=%E5%AD%A6%E4%B9%A0%E4%BA%86&methodName=CommentInsert&parent_id=0&relate_id=23&token=8ABD36C80D1639D9E81130766BE642B7&type=2&user_id=1386387&version=4.32
//content="学习了"

//2)基本类型
//新手入门

//食材搭配
//material_ids=45%2C47&methodName=SearchMix&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
//material_ids=45%2C47&methodName=SearchMix&page=2&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32


//场景菜谱
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//methodName=SceneList&page=1&size=18&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
//methodName=SceneList&page=2&size=18&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//点击进详情
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//methodName=AppShare&shareID=105&shareModule=scene&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//methodName=SceneInfo&scene_id=105&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//再点击列表进详情

//做法
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//dishes_id=14528&methodName=DishesView&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//食材
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//dishes_id=14528&methodName=DishesMaterial&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//相关常识
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//dishes_id=14528&methodName=DishesCommensense&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//相宜相克
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//dishes_id=14528&methodName=DishesSuitable&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//评论数
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//dishes_id=14528&methodName=DishesViewnew&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//发布
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone

//收藏
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//ids=14528&methodName=UserUpdatelikes&token=8ABD36C80D1639D9E81130766BE642B7&type=1&user_id=1386387&version=4.32
//dishes_id=14528&methodName=DishesViewnew&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32


//评论
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//methodName=CommentList&page=1&relate_id=14528&size=10&token=8ABD36C80D1639D9E81130766BE642B7&type=1&user_id=1386387&version=4.32


//发送评论
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//content=%E5%AD%A6%E4%B9%A0%E4%B8%80%E4%B8%8B&methodName=CommentInsert&parent_id=0&relate_id=14528&token=8ABD36C80D1639D9E81130766BE642B7&type=1&user_id=1386387&version=4.32

//content=@"学习一下"

//dishes_id=14528&methodName=DishesViewnew&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32


//上传照片
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//methodName=ShequTopic&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32


//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//activity_id=&content=%E5%BE%88%E5%A5%BD%E5%90%83&image=1457877114055_8928429596.jpg&methodName=ShequPostadd&token=8ABD36C80D1639D9E81130766BE642B7&topics=%5B%7B%22topic_id%22%3A%226%22%2C%22topic_name%22%3A%22%E4%B8%80%E4%BA%BA%E9%A3%9F%22%2C%22locx%22%3A%22160%22%2C%22locy%22%3A%22160%22%2C%22width%22%3A%22320%22%7D%5D&user_id=1386387&version=4.32&video=

//content = @“很好吃”



//猜你喜欢
//methodName=UserLikes&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//口味有变
//methodName=LbsProvince&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//baidu_city=%E6%B7%B1%E5%9C%B3%E5%B8%82&baidu_province=%E5%B9%BF%E4%B8%9C%E7%9C%81&effect=312&like=230&methodName=UserDraw&province=3&taste=316&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//点击一个标签进入搜索列表
//cat_id=252&methodName=CategorySearch&page=1&size=6&token=8ABD36C80D1639D9E81130766BE642B7&type=1&user_id=1386387&version=4.32


//搜索
//keyword=%E6%97%A9%E9%A4%90&methodName=SearchDishes&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
//keyword=早餐


//日食记

//methodName=AppShare&shareID=&shareModule=course&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//methodName=CourseSeriesView&series_id=18&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//methodName=CommentList&page=1&relate_id=18&size=10&token=8ABD36C80D1639D9E81130766BE642B7&type=2&user_id=1386387&version=4.32

//台湾食记

//methodName=AppShare&shareID=&shareModule=course&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
//methodName=CourseSeriesView&series_id=12&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
//methodName=CommentList&page=1&relate_id=12&size=10&token=8ABD36C80D1639D9E81130766BE642B7&type=2&user_id=1386387&version=4.32


//3)今日食谱推荐
//进列表
//methodName=AppShare&shareID=51&shareModule=scene&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
//methodName=SceneInfo&scene_id=51&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//相关场景
//methodName=SceneInfo&scene_id=112&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32


//4)春季养生肝为先
//methodName=AppShare&shareID=127&shareModule=scene&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
//methodName=SceneInfo&scene_id=127&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32


//5)场景菜谱
//methodName=SceneList&page=1&size=18&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//methodName=SceneInfo&scene_id=134&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32



//6)推荐达人
//methodName=TalentRecommend&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//关注
//ids=1249795&methodName=UpdateFollow&token=8ABD36C80D1639D9E81130766BE642B7&type=1&user_id=1386387&version=4.32
//取消关注
//ids=1249795&methodName=UpdateFollow&token=8ABD36C80D1639D9E81130766BE642B7&type=0&user_id=1386387&version=4.32

//达人详情页
//


//7)精选作品
//is_marrow=1&methodName=ShequList&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//作品详情
//methodName=CommentList&page=1&relate_id=35282&size=10&token=8ABD36C80D1639D9E81130766BE642B7&type=3&user_id=1386387&version=4.32
//methodName=AppShare&shareID=35282&shareModule=shequ&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
//methodName=ShequPostview&post_id=35282&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32


//8)美食专题
//methodName=TopicList&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&type=1&user_id=1386387&version=4.32

//专题详情
//methodName=TopicView&version=1.0&user_id=1386387&topic_id=175&_time=1457878578&_signature=0ba3640c73c17441b675a7dd968a66e8


//http://h5.izhangchu.com/topic_view/index.html?&topic_id=134&user_id=1386387&token=8ABD36C80D1639D9E81130766BE642B7&app_exitpage=

//2、食材
//methodName=MaterialSubtype&token=&user_id=&version=4.32

//详情
//material_id=62&methodName=MaterialView&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//相关菜例
//material_id=62&methodName=MaterialDishes&page=1&size=6&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//选购要诀
//营养功效
//实用百科
//material_id=62&methodName=MaterialDishes&page=2&size=6&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32




//3、分类
//methodName=CategoryIndex&token=&user_id=&version=4.32


//进列表
//cat_id=316&methodName=CategorySearch&page=1&size=6&token=8ABD36C80D1639D9E81130766BE642B7&type=1&user_id=1386387&version=4.32

//4、搜索


//热门搜索
//methodName=SearchHot&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//二、社区



//推荐
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//methodName=ShequRecommend&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.33


//最新
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//last_id=0&methodName=ShequList&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32


//关注
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//methodName=ShequFollow&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32






//三、商城
//四、食课
//methodName=CourseIndex&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//五、我的

//注册
//获取验证码

//device_id=021fc7f7528&methodName=UserLogin&mobile=13716422377&token=&user_id=&version=4.32


//code=173907&device_id=021fc7f7528&methodName=UserAuth&mobile=13716422377&token=&user_id=&version=4.32
//

//GET   :  http://182.92.228.160:80/zhangchu/onlinezhangchu/users/1386387


//注册


//methodName=UserPwd&nickname=sh%E6%8E%8C%E5%8E%A8&password=9745b090734f44cdd7b2ef1d88c26b1f&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
//sh掌厨   05513867720




