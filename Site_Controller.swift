//
//  Site_Controller.swift
//  alarm
//
//  Created by 박서경 on 2023/08/31.
//

import Foundation
import UIKit
import WebKit


class Web_Controller:UIViewController{
    
    @IBOutlet var youtube_webview: WKWebView!
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        // URL에서 콘텐츠 로드
//        if let url = URL(string: "https://www.youtube.com") {
//            let request = URLRequest(url: url)
//            youtube_webview.load(request)
//
//        }
        
        
    }
    
    //빈공간 터치시 키보드 내려감
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func url_btn_clicked(_ sender: Any) {
        
        
        if let currentURL = youtube_webview.url {
            
            print("Current URL: \(currentURL)")
            
            
        }
        
        //        //현재 보고 있는 유튜브동영상의 타이틀을 가져온다.
        //        youtube_webview.evaluateJavaScript("document.title") { (result, error) in
        //            if error == nil {
        //                if let title = result as? String {
        //                    self.song_title.numberOfLines=0
        //                    self.song_title.text=title
        //                    print("Document title: \(title)")
        //                }
        //            }
        //        }
    }
    
    
    //이전 페이지로 이동
    @IBAction func forward_btn_clicked(_ sender: Any) {
        if youtube_webview.canGoForward{
            youtube_webview.goForward()
        }
    }
        //다시 돌아가기
    @IBAction func back_btn_clicked(_ sender: Any) {
        if youtube_webview.canGoBack{
            youtube_webview.goBack()
        }
    }
    
}
