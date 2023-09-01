//
//  TabBar_Controller.swift
//  alarm
//
//  Created by 박서경 on 2023/08/31.
//

import Foundation
import UIKit

class TabBar_Controller: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 탭바 배경색 변경
        tabBar.barTintColor = UIColor.black
        // 탭바 아이템 폰트와 아이템 색상 변경
        UITabBar.appearance().tintColor = .yellow
      
    }
}
