//
//  alram_ing.swift
//  alarm
//
//  Created by 박서경 on 2023/09/06.
//

import Foundation
import UIKit
import WebKit

class UsefulController: UIViewController {
    @IBOutlet var back_view: UIView!
    @IBOutlet var useful_label: UILabel!
    
    @IBOutlet var table_view: UITableView!
    
    @IBOutlet var plus_btn: UIButton!
    
    @IBOutlet var button_view: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 이미지를 생성하여 배경 뷰에 설정
        // 이미지를 Asset Catalog에서 가져오기
        let backgroundImage = UIImage(named: "night_sky")
        
        // 이미지 뷰 생성 및 설정
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        backgroundImageView.clipsToBounds = true
        
        // 이미지 뷰를 background_View에 추가
        back_view.addSubview(backgroundImageView)
        
        // 이미지 뷰를 맨 뒤로 보내서 다른 UI 요소들 위에 배치
        back_view.sendSubviewToBack(backgroundImageView)
        
        
        useful_label.sizeToFit()
        
        useful_label?.textColor=UIColor.white
        useful_label.numberOfLines=0//여러줄 허용
        useful_label?.text="자주 사용하는 타이머를 \n 저장하세요"

        table_view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5) // 여기서 alpha 값을 조절하여 투명도를 조절
        
        button_view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5) // 여기서 alpha 값을 조절하여 투명도를 조절
        plus_btn.setTitle("타이머 추가", for: .normal)
        plus_btn.sizeToFit()
    }
    
  

}
