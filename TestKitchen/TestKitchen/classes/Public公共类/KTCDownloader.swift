//
//  KTCDownloader.swift
//  TestKitchen
//
//  Created by qianfeng on 16/10/24.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire

protocol KTCDownloaderProtocol:NSObjectProtocol {
    
    //下载失败
    func downloader(downloader:KTCDownloader, didFailWithError error:NSError)
    //下载成功
    func downloader(downloader:KTCDownloader, didFinishWithData data:NSData?)
}

enum KTCDownloadType:Int {
    case Normal = 0
    case IngreRecommend //首页食材的推荐
    case IngreMaterial  //首页食材的食材
    case IngreCategory  //首页食材的分类
    case IngreFoodCourseDetail //食材课程的详情
    case IngreFoodCourseComment//食材课程的评论
}

class KTCDownloader: NSObject {
    
    weak var delegate:KTCDownloaderProtocol?
    
    //下载类型
    var downloadType:KTCDownloadType = .Normal
    
    //POST请求数据
    func postWithUrl(urlString:String, params:Dictionary<String, AnyObject>) {
        
        var tmpDic = NSDictionary(dictionary: params) as! Dictionary<String, AnyObject>
        //设置所有接口的公共参数
        tmpDic["token"] = ""
        tmpDic["user_id"] = ""
        tmpDic["version"] = "4.5"
        
        Alamofire.request(.POST, urlString, parameters: tmpDic, encoding: ParameterEncoding.URL, headers: nil).responseData { (response) in
            switch response.result {
            case .Failure(let error):
                //出错了
                self.delegate?.downloader(self, didFailWithError: error)
            case .Success:
                //下载成功
                self.delegate?.downloader(self, didFinishWithData: response.data)
            }
        }
    }
}












