//
//  IngreSceneListCell.swift
//  TestKitchen
//
//  Created by qianfeng on 16/10/28.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class IngreSceneListCell: UITableViewCell {

    //点击事件
    var jumpClosure:IngreJumpColsure?
    
    //数据
    var listModel:IngreRecommendWidgetList? {
        didSet {
            config((listModel?.title)!)
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func config(text:String) {
        titleLabel.text = text
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //手势
        let g = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        addGestureRecognizer(g)
    }

    func tapAction() {
        if jumpClosure != nil && listModel?.title_link != nil {
            jumpClosure!((listModel?.title_link)!)
        }
    }
    
    class func createSceneListCellFor(tableView:UITableView, atIndexPath:NSIndexPath, listModel:IngreRecommendWidgetList?) -> IngreSceneListCell {
        let cellId = "ingreSceneListCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? IngreSceneListCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("IngreSceneListCell", owner: nil, options: nil).last as? IngreSceneListCell
        }
        cell?.listModel = listModel
        return cell!
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
