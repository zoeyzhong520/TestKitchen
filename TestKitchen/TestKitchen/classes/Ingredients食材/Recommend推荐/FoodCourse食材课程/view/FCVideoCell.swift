//
//  FCVideoCell.swift
//  TestKitchen
//
//  Created by qianfeng on 16/11/4.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class FCVideoCell: UITableViewCell {

    //播放视频
    var playClosure:(String -> Void)?
    
    //显示数据
    var cellModel:FoodCourseSerial? {
        didSet {
            showData()
        }
    }
    
    func showData() {
        
        //图片
        let url = NSURL(string: (cellModel?.course_image)!)
        bgImageView.kf_setImageWithURL(url!, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
        //文字
        numLabel.text = "\((cellModel?.video_watchcount)!)人做过"
        
    }
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var numLabel: UILabel!
    
    @IBAction func playAction() {
        
        if cellModel?.course_video != nil && playClosure != nil {
            playClosure!((cellModel?.course_video)!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
