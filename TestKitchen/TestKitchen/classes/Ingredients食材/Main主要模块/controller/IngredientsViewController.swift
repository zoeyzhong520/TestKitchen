//
//  IngredientsViewController.swift
//  TestKitchen
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class IngredientsViewController: BaseViewController {

    //滚动视图
    private var scrollView:UIScrollView?
    
    //推荐视图
    private var recomendView:IngreRecommendView?
    
    //食材视图
    private var materialView:IngreMaterialView?
    
    //分类视图
    private var categoryView:IngreMaterialView?
    
    //导航上面的选择控件
    private var segCtrl:KTCSegCtrl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        automaticallyAdjustsScrollViewInsets = false
        downloadRecommentData()
        
        //导航
        createNav()
        
        //创建首页视图
        createHomePage()
        
    }

    //创建首页视图
    func createHomePage() {
        
        scrollView = UIScrollView()
        scrollView!.pagingEnabled = true
        
        //设置代理
        scrollView?.delegate = self
        
        view.addSubview(scrollView!)
        
        //约束
        scrollView!.snp_makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
        }
        
        //容器视图
        let containerView = UIView.createView()
        scrollView!.addSubview(containerView)
        containerView.snp_makeConstraints { (make) in
            make.edges.equalTo(scrollView!)
            make.height.equalTo(scrollView!)
        }
        
        //添加子视图
        //1.推荐视图
        recomendView = IngreRecommendView()
        containerView.addSubview(recomendView!)
        recomendView?.snp_makeConstraints(closure: { (make) in
            make.top.bottom.left.equalTo(containerView)
            make.width.equalTo(kScreenW)
        })
        
        //2.食材视图
        materialView = IngreMaterialView()
        materialView?.backgroundColor = UIColor.blueColor()
        containerView.addSubview(materialView!)
        materialView?.snp_makeConstraints(closure: { (make) in
            make.top.bottom.equalTo(containerView)
            make.width.equalTo(kScreenW)
            make.left.equalTo((recomendView?.snp_right)!)
        })
        
        //3.分类视图
        categoryView = IngreMaterialView()
        categoryView?.backgroundColor = UIColor.redColor()
        containerView.addSubview(categoryView!)
        categoryView?.snp_makeConstraints(closure: { (make) in
            make.top.bottom.equalTo(containerView)
            make.width.equalTo(kScreenW)
            make.left.equalTo((materialView?.snp_right)!)
        })
        
        //修改容器视图的大小
        containerView.snp_makeConstraints { (make) in
            make.right.equalTo(categoryView!)
        }
        
    }
    
    //创建导航
    func createNav() {
        
        //扫一扫
        addNavBtn("saoyisao", target: self, action: #selector(scanAction), isLeft: true)
        
        //搜索
        addNavBtn("search", target: self, action: #selector(searchAction), isLeft: false)
        
        //选择控件
        let frame = CGRectMake(80, 0, kScreenW-80*2, 44)
        segCtrl = KTCSegCtrl(frame: frame, titleArray: ["推荐","食材","分类"])
        segCtrl!.delegate = self
        navigationItem.titleView = segCtrl
    }
    
    //扫一扫
    func scanAction() {
        print("扫一扫")
    }
    
    //搜索
    func searchAction() {
        print("搜索")
    }
    
    //下载首页数据
    //methodName=SceneHome&token=&user_id=&version=4.5
    func downloadRecommentData() {
        
        let params = ["methodName":"SceneHome"]
        let downloader = KTCDownloader()
        downloader.delegate = self
        downloader.downloadType = .IngreRecommend
        downloader.postWithUrl(kHostUrl, params: params)
        
        //下载首页食材的数据
        downloadRecommendMaterial()
        
        //下载首页分类的数据
        downloadCategoryData()
    }
    
    //下载首页分类的数据
    func downloadCategoryData() {
        //3、分类
        //methodName=CategoryIndex&token=&user_id=&version=4.32
        
        let downloader = KTCDownloader()
        downloader.delegate = self
        downloader.downloadType = .IngreCategory
        downloader.postWithUrl(kHostUrl, params: ["methodName":"CategoryIndex"])
    }
    
    //下载首页食材的数据
    //methodName=MaterialSubtype&token=&user_id=&version=4.32
    func downloadRecommendMaterial() {
        
        let dict = ["methodName":"MaterialSubtype"]
        let downloader = KTCDownloader()
        downloader.delegate = self
        downloader.downloadType = .IngreMaterial
        downloader.postWithUrl(kHostUrl, params: dict)
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

//MARK:KTCDownloader的代理方法
extension IngredientsViewController:KTCDownloaderProtocol {
    
    //下载失败
    func downloader(downloader: KTCDownloader, didFailWithError error: NSError) {
        print(error)
    }
    
    //下载成功
    func downloader(downloader: KTCDownloader, didFinishWithData data: NSData?) {
        
        if downloader.downloadType == .IngreRecommend {
            
            //            let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
            //            print(str!)
            
            if let tmpData = data {
                //1.json解析
                let recommendModel = IngreRecommend.parseData(tmpData)
                
                //2.显示UI
                recomendView?.model = recommendModel
                
                //3.点击食材的推荐页面的某一个部分，跳转到后面的界面
                recomendView!.jumpClosure = { [weak self]
                    jumpUrl in
                    self?.handleClickEvent(jumpUrl)
                }
            }
        }else if downloader.downloadType == .IngreMaterial {
            
            //食材
            if let tmpData = data {
                
                //1.json解析
                let model = IngreMaterial.parseData(tmpData)
                
                //2.显示UI
                materialView?.model = model
                
                //点击事件
                materialView?.jumpClosure = { [weak self]
                    jumpUrl in
                    self?.handleClickEvent(jumpUrl)
                }
            }
        }else if downloader.downloadType == .IngreCategory {
            
            //分类
            if let tmpData = data {
                
                //1.json解析
                let model = IngreMaterial.parseData(tmpData)
                
                //2.显示UI
                categoryView?.model = model
                
                //点击事件
                categoryView?.jumpClosure = { [weak self]
                    jumpUrl in
                    self?.handleClickEvent(jumpUrl)
                }
            }
        }
    }
    
    //处理点击事件的方法
    func handleClickEvent(urlString:String) {
        KTCService.handleEvent(urlString, onViewController: self)
    }
    
}

//MARK:KTCSegCtrl代理方法
extension IngredientsViewController:KTCSegCtrlDelegate {
    
    func segCtrl(segCtrl: KTCSegCtrl, didClickBtnAtIndex index: Int) {
        
        scrollView?.setContentOffset(CGPointMake(CGFloat(index)*kScreenW, 0), animated: true)
    }
}

//MARK:UIScrollView代理方法
extension IngredientsViewController:UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x/scrollView.bounds.size.width
        segCtrl?.selectIndex = Int(index)
    }
}






