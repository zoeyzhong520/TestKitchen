//
//  VideoService.swift
//  TestKitchen
//
//  Created by qianfeng on 16/11/3.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoService: NSObject {
    
    class func playVideo(urlString:String?, onViewController vc:UIViewController) {
        
        if urlString != nil {
            
            let url = NSURL(string: urlString!)
            let player = AVPlayer(URL: url!)
            let videoCtrl = AVPlayerViewController()
            videoCtrl.player = player
            
            //播放
            player.play()
            
            //显示界面
            vc.presentViewController(videoCtrl, animated: true, completion: nil)
            
        }
    }
}
