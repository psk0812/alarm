//
//  youtube_Controller.swift
//  alarm
//
//  Created by 박서경 on 2023/08/31.
//

import Foundation
import UIKit
import WebKit

class YoutubeController: UIViewController {
    @IBOutlet var background_View: UIView!

    @IBOutlet var alaram_tableview: UITableView!
    
    @IBOutlet var button_view: UIView!
    
    @IBOutlet var alram_plus_btn: UIButton!
    
    @IBOutlet var Good_day: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 이미지를 생성하여 배경 뷰에 설정
        // 이미지를 Asset Catalog에서 가져오기
        let backgroundImage = UIImage(named: "night_sky")
        
        // 이미지 뷰 생성 및 설정
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        backgroundImageView.clipsToBounds = true
        
        // 이미지 뷰를 background_View에 추가
        background_View.addSubview(backgroundImageView)
        
        // 이미지 뷰를 맨 뒤로 보내서 다른 UI 요소들 위에 배치
        background_View.sendSubviewToBack(backgroundImageView)
    
        Good_day.sizeToFit()
        
        Good_day?.textColor=UIColor.white
        Good_day.numberOfLines=0//여러줄 허용
        Good_day?.text="당신의 아침이 \n 즐겁게 시작되길 바랍니다"
        
        
        alaram_tableview.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5) // 여기서 alpha 값을 조절하여 투명도를 조절
        
        button_view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5) // 여기서 alpha 값을 조절하여 투명도를 조절
        alram_plus_btn.setTitle("유튜브 알람추가", for: .normal)
        alram_plus_btn.sizeToFit()
       
    }
}
