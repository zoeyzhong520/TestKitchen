//
//  FoodCourseController.swift
//  TestKitchen
//
//  Created by qianfeng on 16/11/3.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class FoodCourseController: BaseViewController {
    
    //id
    var courseId:String?
    
    //当前选择了第几集
    var serialIndex:Int = 0
    
    //表格
    var tableView:UITableView?
    
    //详情的数据
    private var detailData:FoodCourseDetail?
    
    //评论的数据
    private var comment:FoodCourseComment?
    
    //评论的分页
    private var currentPage = 1
    
    //是否有更多
    private var hasMore:Bool = true
    
    //创建表格
    func createTableView() {
        
        automaticallyAdjustsScrollViewInsets = false
        tableView = UITableView(frame: CGRectZero, style: .Plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
        
        //约束
        tableView?.snp_makeConstraints(closure: { [weak self] (make) in
            make.edges.equalTo(self!.view).inset(UIEdgeInsetsMake(64, 0, 0, 0))
            })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建表格
        createTableView()
        
        //下载详情的数据
        downloadDetailData()
        
        //下载评论
        downloadComment()
    }
    
    //下载评论
    func downloadComment() {
        
        var params = [String:String]()
        params["methodName"] = "CommentList"
        params["page"] = "\(currentPage)"
        params["relate_id"] = courseId!
        params["size"] = "10"
        params["type"] = "2"
        
        let download = KTCDownloader()
        download.delegate = self
        download.downloadType = .IngreFoodCourseComment
        download.postWithUrl(kHostUrl, params: params)
    }
    
    //下载详情的数据
    func downloadDetailData() {
        
        if courseId != nil {
            let params = ["methodName":"CourseSeriesView","series_id":"\(courseId!)"]
            
            let download = KTCDownloader()
            download.delegate = self
            download.downloadType = .IngreFoodCourseDetail
            download.postWithUrl(kHostUrl, params: params)
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

extension FoodCourseController:KTCDownloaderProtocol {
    
    func downloader(downloader: KTCDownloader, didFailWithError error: NSError) {
        print(error)
    }
    
    func downloader(downloader: KTCDownloader, didFinishWithData data: NSData?) {
        
        if downloader.downloadType == .IngreFoodCourseDetail {
            //详情
            
            //            let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
            //            print(str!)
            
            if let tmpData = data {
                detailData = FoodCourseDetail.parseData(tmpData)
                //显示数据
                
                //刷新表格
                tableView?.reloadData()
            }
            
        }else if downloader.downloadType == .IngreFoodCourseComment {
            
            //评论
            //            let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
            //            print(str!)
            
            let tmpComment = FoodCourseComment.parseData(data!)
            if currentPage == 1 {
                //第一页
                comment = tmpComment
            }else{
                //其他页
                let array = NSMutableArray(array: (comment?.data?.data)!)
                array.addObjectsFromArray((tmpComment.data?.data)!)
                comment?.data?.data = NSArray(array: array) as? Array<FoodCourseCommentDetail>
            }
            //刷新表格
            tableView?.reloadData()
            
            //判断是否有更多
            if comment?.data?.data?.count < NSString(string: (comment?.data?.total)!).integerValue {
                hasMore = true
            }else{
                hasMore = false
            }
            
            //加载更多
            addFooteView()
        }
    }
    
    //添加加载更多的视图
    func addFooteView() {
        
        let fView = UIView(frame: CGRectMake(0,0,kScreenW,44))
        fView.backgroundColor = UIColor.lightGrayColor()
        
        //显示文字
        let label = UILabel(frame: CGRectMake(20,10,kScreenW-20*2,24))
        if hasMore {
            label.text = "下拉加载更多"
        }else{
            label.text = "没有更多了"
        }
        label.textAlignment = .Center
        fView.addSubview(label)
        
        tableView?.tableFooterView = fView
    }
    
}

//MARK:UITableView代理方法
extension FoodCourseController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var num = 0
        if section == 0 {
            //详情
            if detailData != nil {
                num = 3
            }
        }else if section == 1 {
            //评论
            if comment?.data?.data?.count > 0 {
                num = (comment?.data?.data?.count)!
            }
        }
        return num
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var h:CGFloat = 0
        if indexPath.section == 0 {
            
            if indexPath.row == 0 {
                //视频播放
                h = 160
            }else if indexPath.row == 1 {
                //文字
                let model = detailData?.data?.data![serialIndex]
                h = SubjectCell.heightForSubjectCell(model!)
            }else if indexPath.row == 2 {
                //集数
                h = FCSerialCell.heightForSerialCell((detailData?.data?.data?.count)!)
            }
        }else if indexPath.section == 1{
            //评论
            h = 80
            
        }
        return h
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                //视频
                let cellId = "videoCellId"
                var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? FCVideoCell
                if cell == nil {
                    cell = NSBundle.mainBundle().loadNibNamed("FCVideoCell", owner: nil, options: nil).last as? FCVideoCell
                }
                //显示数据
                let serialModel = detailData?.data?.data![serialIndex]
                cell?.cellModel = serialModel
                
                //播放的闭包
                cell?.playClosure = {
                    urlString in
                    //print(urlString)
                    
                    KTCService.handleEvent(urlString, onViewController: self)
                }
                cell?.selectionStyle = .None
                return cell!
            }else if indexPath.row == 1 {
                //描述文字
                let cellId = "subjectCellId"
                var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? SubjectCell
                if cell == nil {
                    cell = NSBundle.mainBundle().loadNibNamed("SubjectCell", owner: nil, options: nil).last as? SubjectCell
                }
                let model = detailData?.data?.data![serialIndex]
                cell?.cellModel = model
                cell?.selectionStyle = .None
                return cell!
            }else if indexPath.row == 2 {
                //集数
                let cellId = "serialCellId"
                var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? FCSerialCell
                if cell == nil {
                    cell = FCSerialCell(style: .Default, reuseIdentifier: cellId)
                }
                
                //显示数据
                cell?.serialNum = detailData?.data?.data?.count
                //设置选中按钮
                cell?.selectIndex = serialIndex
                
                cell?.clickClosure = { [weak self]
                    index in
                    self?.serialIndex = index
                    
                    //刷新表格
                    self?.tableView?.reloadData()
                }
                cell?.selectionStyle = .None
                return cell!
            }
        }else if indexPath.section == 1 {
            
            let cellId = "commentCellId"
            var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? FCCommentCell
            if cell == nil {
                cell = NSBundle.mainBundle().loadNibNamed("FCCommentCell", owner: nil, options: nil).last as? FCCommentCell
            }
            let model = comment?.data?.data![indexPath.row]
            cell?.model = model
            return cell!
        }
        return UITableViewCell()
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y >= (scrollView.contentSize.height-scrollView.bounds.size.height-10) {
            
            //可以加载更多
            if hasMore {
                //加载下一页
                currentPage += 1
                downloadComment()
            }
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 1 {
            if comment?.data?.data?.count > 0 {
                return 60
            }
        }
        return 0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = NSBundle.mainBundle().loadNibNamed("FCCommentHeader", owner: nil, options: nil).last as? FCCommentHeader
        //显示数据
        headerView?.config((comment?.data?.total)!)
        
        return headerView
    }
}








