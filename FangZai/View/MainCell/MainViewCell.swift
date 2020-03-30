//
//  MainViewCell.swift
//  FangZai
//
//  Created by ktrade on 2020/3/4.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class MainViewCell: UITableViewCell {

//    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var views: UIView!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var smallWeatherImage: UIImageView!
    @IBOutlet weak var tempureLabel: UILabel!
    
    fileprivate let cellId = "cellId"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        views.backgroundColor = #colorLiteral(red: 0.792377796, green: 0.9507464384, blue: 1, alpha: 1)
        
        // 設定日期顯示格式
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/M/d"
                
        // 取得現在日期資訊
        let dateString = dateFormatter.string(from: Date())
        dateLabel.text = dateString
//        print(dateString)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set {
            var frame = newValue

            frame.origin.x = 10

            frame.size.width -= 2 * frame.origin.x
            frame.size.height -= 2 * frame.origin.x

            self.layer.masksToBounds = true
            self.layer.cornerRadius = 8.0

            super.frame = frame
        }
    }
    
}
