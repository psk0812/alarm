//
//  Site_Controller.swift
//  alarm
//
//  Created by 박서경 on 2023/08/31.
//

import Foundation
import UIKit
import WebKit

protocol Final_DataDelegate: AnyObject {
    func sendData(url: URL , title : String, ampm : String, hour : String, minutes : String)
    func sendList(_ list: [String])
}

class youtube_alram_Controller:UIViewController,UIApplicationDelegate,DataDelegate{
    weak var delegate: Final_DataDelegate?
  
    //유튜브 데이터 받을 준비
    var window: UIWindow?
    
    var recive_youtubeurl : URL?
    var recive_youtube_title : String?
    var youtube_siteVC : UIViewController?
    var ampm : String?
    var hour : String?
    var minues : String?
    
    
    @IBOutlet var ampm_pick: ampm_PickerView!
    
    @IBOutlet var hour_pick: hour_PickerView!
    
    @IBOutlet var minutes_pick: minutes_PickerView!
    
    @IBOutlet var back_btn: UIBarButtonItem!
    @IBOutlet var url_select_btn: UIBarButtonItem!
    @IBOutlet var forward_btn: UIBarButtonItem!

    
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
        
        // 이미지를 생성하여 배경 뷰에 설정
  
        print("로드 완료")
        
        
   
        
        
        
    }
    
    //빈공간 터치시 키보드 내려감
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func sendData(url: URL, string: String) {
        // sendData 메서드를 프로토콜에 정의된대로 구현
        // 받은 데이터 및 URL을 처리하는 로직
        print("hello")
        youtube_title.numberOfLines=0
        youtube_title.text = string
        recive_youtube_title=string
        recive_youtubeurl=url
        print("Received URL: \(url)")
        print("Received string: \(string)")
 
    }
    
    //유튜브 사이트 데이터 받기

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? Site_ViewController {
            destinationVC.delegate = self
        }
    }
    
    @IBAction func send_data_to_alram(_ sender: Any) {
        var url_send: URL?
        var title_send: String?
        var ampm_send: String?
        var hour_send: String?
        var minutes_send: String?

        if let url = recive_youtubeurl {
            url_send = url
        } else {
            print("recive_youtubeurl is nil")
            return // 중단하거나 에러 처리
        }

        if let title = recive_youtube_title {
            title_send = title
        } else {
            print("recive_title is nil")
            return // 중단하거나 에러 처리
        }

        let selectedRow = ampm_pick.selectedRow(inComponent: 0)
        ampm_send = ampm_pick.pickerData[selectedRow]

        let hour_selectedRow = hour_pick.selectedRow(inComponent: 0)
        hour_send = hour_pick.pickerData[hour_selectedRow]

        let minutes_selectedRow = minutes_pick.selectedRow(inComponent: 0)
        minutes_send = minutes_pick.pickerData[minutes_selectedRow]

        if let urlToSend = url_send, let titleToSend = title_send, let ampmToSend = ampm_send, let hourToSend = hour_send, let minutesToSend = minutes_send {
            self.delegate?.sendData(url: urlToSend, title: titleToSend, ampm: ampmToSend, hour: hourToSend, minutes: minutesToSend)
            self.dismiss(animated: true)
        } else {
            print("Error: Some data is missing")
            // 에러 처리 로직 추가
        }
    }
    
    @IBAction func monday_clicked(_ sender:UIButton) {
        color_chage(sender)
    }
    
    @IBAction func tuesday_clicked(_ sender:UIButton) {
        color_chage(sender)
    }
    
    @IBAction func wednesday_clicked(_ sender:UIButton) {
        color_chage(sender)
    }
    
    @IBAction func thursday_clicked(_ sender: UIButton) {
        color_chage(sender)
    }
    
    @IBAction func friday_clicked(_ sender: UIButton) {
        color_chage(sender)
    }
    
    @IBAction func saturday_clicked(_ sender: UIButton) {
        color_chage(sender)
    }
    
    @IBAction func sunday_clicked(_ sender: UIButton) {
        color_chage(sender)
    }
    
    @IBAction func bibrate_clicked(_ sender: UIButton) {
        color_chage(sender)
    }
    
    
  
    
    
    
    
    
    
    
    
    
}

func color_chage(_ sender:UIButton){
    if sender.tintColor == .systemGray{
        sender.tintColor = .tintColor
    }else{sender.tintColor = .systemGray}
}


