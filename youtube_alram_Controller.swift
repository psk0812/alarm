//
//  Site_Controller.swift
//  alarm
//
//  Created by 박서경 on 2023/08/31.
//

import Foundation
import UIKit
import WebKit



class youtube_alram_Controller:UIViewController,UIApplicationDelegate,DataDelegate{
    //유튜브 데이터 받을 준비
    var window: UIWindow?

    var recive_youtubeurl : URL?
    var recive_youtube_title : String?
    var youtube_siteVC : UIViewController?

    
    
   
    @IBOutlet var back_btn: UIBarButtonItem!
    @IBOutlet var url_select_btn: UIBarButtonItem!
    @IBOutlet var forward_btn: UIBarButtonItem!
    @IBOutlet var ampm_pick: ampm_PickerView!
    @IBOutlet var hour_pick: hour_PickerView!
    @IBOutlet var minutes_pick: minutes_PickerView!
    
    @IBOutlet var monday: UIButton!
    @IBOutlet var tuesday: UIButton!
    @IBOutlet var wednesday: UIButton!
    @IBOutlet var thursday: UIButton!
    @IBOutlet var friday: UIButton!
    @IBOutlet var saturday: UIButton!
    @IBOutlet var sunday: UIButton!
    
    @IBOutlet var youtube_title: UILabel!
    @IBOutlet var caution_label: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.caution_label.numberOfLines=0
        self.caution_label.text="주의! \n \n 유튜브가 실행되려면 와이파이나 데이터가 계속 연결된 상태여야 합니다. 만약 와이파이가 접속되지 않았다면,기본음이 들립니다."
        print("로드 완료")
        print(recive_youtube_title)
        guard let vc = self.youtube_siteVC as? Site_ViewController else{
            return
        }
        vc.checkRespose(str:"receive susss")
  
    }
    
    //빈공간 터치시 키보드 내려감
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func sendData(url: URL, string: String) {
        // sendData 메서드를 프로토콜에 정의된대로 구현
        // 받은 데이터 및 URL을 처리하는 로직
        print("hello")
        youtube_title.text = url.absoluteString
        print("Received URL: \(url)")
        print("Received string: \(string)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? Site_ViewController {
            destinationVC.delegate = self
        }
    }

    
}
