//
//  MainTabBarViewController.swift
//  TestKitchen
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    //tabbar的背景
    private var bgView:UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建视图控制器
        createViewControllers()
    }

    //自定制TabBar
    func createMyTabBar(imageNames:Array<String>?, titles:Array<String>?) {
        
        //1.创建背景视图
        bgView = UIView.createView()
        bgView?.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
//        //设置边框
//        bgView?.layer.borderColor = UIColor.blackColor().CGColor
//        bgView?.layer.borderWidth = 1
        view.addSubview(bgView!)
        bgView?.snp_makeConstraints(closure: { [weak self](make) in
            make.left.right.bottom.equalTo(self!.view)
            make.height.equalTo(49)
        })
        
//        //图片的名字
//        let imageNames = ["home","community","shop","shike","mine"]
//        
//        //标题文字
//        let titles = ["食材","社区","商城","食课","我的"]
        
        //循环创建按钮
        let width = kScreenW/CGFloat(imageNames!.count)
        for i in 0..<imageNames!.count {
            let imageName = imageNames![i] + "_normal"
            let selectImageName = imageNames![i] + "_select"
            let btn = UIButton.createBtn(nil, bgImageName: imageName, highlightImageName: nil, selectImageName: selectImageName, target: self, action: #selector(clickBtn(_:)))
            
            //设置tag值
            btn.tag = 300+i
            
            bgView!.addSubview(btn)
            
            //设置位置
            btn.snp_makeConstraints(closure: { [weak self](make) in
                make.top.bottom.equalTo(self!.bgView!)
                make.width.equalTo(width)
                make.left.equalTo(width*CGFloat(i))
            })
            
            //2.2显示标题
            let titleLabel = UILabel.createLabel(titles![i], textAlignment: .Center, font: UIFont.systemFontOfSize(10))
            //设置文字颜色
            titleLabel.textColor = UIColor.lightGrayColor()
            titleLabel.tag = 400
            btn.addSubview(titleLabel)
            
            //设置位置
            titleLabel.snp_makeConstraints(closure: { (make) in
                make.left.right.bottom.equalTo(btn)
                make.height.equalTo(20)
            })
            
            //默认选中第一个按钮
            if i == 0 {
                btn.selected = true
                titleLabel.textColor = UIColor.brownColor()
            }
        }
    }
    
    func clickBtn(curBtn:UIButton) {
        let index = curBtn.tag-300
        if selectedIndex != index {
            //1.1取消选中之前的按钮
            let lastBtn = bgView?.viewWithTag(300+selectedIndex) as! UIButton
            lastBtn.selected = false
            lastBtn.userInteractionEnabled = true
            
            let lastLabel = lastBtn.viewWithTag(400) as! UILabel
            lastLabel.textColor = UIColor.lightGrayColor()
            
            //1.2选中当前的按钮
            curBtn.selected = true
            curBtn.userInteractionEnabled = true
            
            let curLabel = curBtn.viewWithTag(400) as! UILabel
            curLabel.textColor = UIColor.brownColor()
            
            //1.3切换视图控制器
            selectedIndex = index
        }
    }
    
    //创建视图控制器
    func createViewControllers() {
        
        //1.从Controllers.json里面读取数据
        let path = NSBundle.mainBundle().pathForResource("Controllers", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        //视图控制器名字的数组
        var nameArray = [String]()
        //图片名字
        var images = [String]()
        //标题文字
        var titles = [String]()
        
        do {
            //可能抛出异常的代码写在这里
            let array = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            if array.isKindOfClass(NSArray) {
                let tmpArray = array as! Array<Dictionary<String,String>>
                //遍历获取视图控制器的名字
                for tmpDic in tmpArray {
                    let name = tmpDic["ctrlname"]
                    nameArray.append(name!)
                    //图片
                    let imageName = tmpDic["image"]
                    images.append(imageName!)
                    //标题
                    let title = tmpDic["title"]
                    titles.append(title!)
                }
            }
            
        }catch (let error) {
            print(error)
        }
        
        //如果获取数组有错误
        if nameArray.count == 0 {
            
            //视图控制器的名字
            nameArray = ["IngredientsViewController","CommunityViewController","MallViewController","FoodClassViewController","ProfileViewController"]
            
            //图片的名字
            images = ["home","community","shop","shike","mine"]
            
            //标题文字
            titles = ["食材","社区","商城","食课","我的"]
        }
        
        //2.创建视图控制器
        //视图控制器对象的数组
        var ctrlArray = Array<UINavigationController>()
        for i in 0..<nameArray.count {
            let name = "TestKitchen." + nameArray[i]
            
            //使用类名创建类的对象
            let ctrl = NSClassFromString(name) as! UIViewController.Type
            let vc = ctrl.init()
            
            //导航
            let navCtrl = UINavigationController(rootViewController: vc)
            ctrlArray.append(navCtrl)
        }
        viewControllers = ctrlArray
        
        //3.设置图片和文字
        //自定制TabBar
        //自定制
        tabBar.hidden = true
        createMyTabBar(images,titles: titles)

    }
    
    //显示tabbar
    func showTabBar() {
        UIView.animateWithDuration(0.25) { 
            self.bgView?.hidden = false
        }
    }
    
    //隐藏tabbar
    func hideTabBar() {
        UIView.animateWithDuration(0.25) {
            self.bgView?.hidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
