//
//  IngreLikeCell.swift
//  TestKitchen
//
//  Created by qianfeng on 16/10/25.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class IngreLikeCell: UITableViewCell {
    
    var jumpClosure:IngreJumpColsure?
    
    @IBAction func clickBtn(sender: UIButton) {
        let index = sender.tag-100
        //index 0 1 2 3
        //序号 0 2 4 6
        if index*2 < listModel?.widget_data?.count {
            let data = listModel?.widget_data![index*2]
            if data?.link != nil && jumpClosure != nil {
                jumpClosure!((data?.link)!)
            }
        }
    }
    
    //数据
    var listModel:IngreRecommendWidgetList? {
        didSet {
            showData()
        }
    }
    
    //显示数据
    private func showData() {
        if listModel?.widget_data?.count > 1 {
            for var i in 0..<(listModel?.widget_data?.count)!-1 {
                //图片
                let imageData = listModel?.widget_data![i]
                if imageData!.type == "image" {
                    let imageTag = 200+i/2
                    let imageView = contentView.viewWithTag(imageTag)
                    if imageView?.isKindOfClass(UIImageView) == true {
                        let temImageView = imageView as! UIImageView
                        
                        let url = NSURL(string: (imageData?.content)!)
                        temImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                    }
                }
                
                //文字
                let textData = listModel?.widget_data![i+1]
                if textData?.type == "text" {
                    let label = contentView.viewWithTag(300+i/2)
                    if label?.isKindOfClass(UILabel) == true {
                        let tmpLabel = label as! UILabel
                        tmpLabel.text = textData?.content
                    }
                }
                
                i+=1
            }
        }
    }
    
    //创建cell的方法
    class func createLikeCellFor(tableView:UITableView, atIndexPath:NSIndexPath, listModel:IngreRecommendWidgetList?) -> IngreLikeCell {
        let cellId = "ingreLikeCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? IngreLikeCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("IngreLikeCell", owner: nil, options: nil).last as? IngreLikeCell
        }
        //
        cell?.listModel = listModel
        return cell!
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
