//
//  alram_cell.swift
//  alarm
//
//  Created by 박서경 on 2023/09/06.
//

import Foundation
import UIKit

class MyTableViewCell:UITableViewCell{
    
    @IBOutlet var Content_View: UIView!
    @IBOutlet var alram_time: UILabel!
    
    @IBOutlet var alram_vibrate: UIImageView!
    
    @IBOutlet var alarm_view: UIView!
    
    
    @IBOutlet var alarm_title: UILabel!
    
    @IBOutlet var alram_day: UILabel!
    
    //셀이 렌더링 될때
    override func awakeFromNib(){
        
        super.awakeFromNib()
        alarm_view.layer.borderWidth = 2 // 테두리 적용
        alarm_view.layer.cornerRadius=5

    }
    
  





    
}
