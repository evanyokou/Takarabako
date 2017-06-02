//
//  MsgCell.swift
//  Takarabako
//
//  Created by Yuhao on 2017/06/02.
//  Copyright © 2017年 Yuhao. All rights reserved.
//

import UIKit

class MsgCell: UITableViewCell{
    var contentLabel: UILabel?
    var iconView: UIImageView?
    var timeLabel: UILabel?
    var screenWidth: CGFloat = UIScreen.main.bounds.size.width
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style,reuseIdentifier: reuseIdentifier)
        self.setUp()
    }    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUp()
    }
    
    func setUp() {
        contentLabel = UILabel()
        iconView = UIImageView()
        timeLabel = UILabel()
        
        timeLabel?.bounds = CGRect(x: 0, y: 0, width: 80, height: 10)
        timeLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        
        contentView.addSubview(contentLabel!)
        contentView.addSubview(iconView!)
        contentView.addSubview(timeLabel!)
    }
    
    func setMsgModle(msg: Msg){
        timeLabel?.text = msg.time
        timeLabel?.center = CGPoint(x: contentView.center.x, y: 10)
        
        var contentX: CGFloat = 0
        var iconX: CGFloat = 0
        
        let size = NSString(string: msg.text).boundingRect(with: CGSize(width:screenWidth-140,height:CGFloat(1000)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.boldSystemFont(ofSize: 14)], context: nil)
        
        if msg.target == 0 {
            iconX = screenWidth - 60
            iconView?.image = UIImage(named: "amnesia-anime")
            contentX = screenWidth - size.width - 100
            contentLabel?.textColor = UIColor(red: 252/255, green: 157/255, blue: 154/255, alpha: 1)
        }else{
            iconX = 10
            iconView?.image = UIImage(named: "hyouka")
            contentX = 70
            contentLabel?.textColor = UIColor(red: 69/255, green: 137/255, blue: 148/255, alpha: 1)
        }
        
        iconView?.frame = CGRect(x: iconX, y: 30, width: 50, height: 50)
        
        contentLabel?.text = msg.text
        contentLabel?.frame = CGRect(x: contentX, y: 30, width: size.width + 30, height: size.height + 30)
        contentLabel?.textAlignment = NSTextAlignment.center
        
        
    }
    
    
    
    
    
    
}
