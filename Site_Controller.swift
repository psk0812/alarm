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
   
    @IBOutlet var youtube_btn: UIButton!
    
    @IBOutlet var back_btn: UIBarButtonItem!

  
    
    @IBOutlet var url_select_btn: UIBarButtonItem!
    

    @IBOutlet var forward_btn: UIBarButtonItem!
    

    @IBOutlet var ampm_pick: UIPickerView!
    
    @IBOutlet var hour_pick: UIPickerView!
    
    @IBOutlet var minutes_pick: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // URL에서 콘텐츠 로드
        if let url = URL(string: "https://www.youtube.com") {
            let request = URLRequest(url: url)
            youtube_webview.load(request)
            
        }
        
      
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

   
    
    
    @IBAction func back_clicked(_ sender: Any) {
        if youtube_webview.canGoBack{
            youtube_webview.goBack()
        }
    }
    
    @IBAction func forward_clicked(_ sender: Any) {
        if youtube_webview.canGoForward{
            youtube_webview.goForward()
        }
    }
    
    
  
}


