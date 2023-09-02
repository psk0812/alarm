//
//  youtube_site.swift
//  alarm
//
//  Created by 박서경 on 2023/09/02.
//

import Foundation
import UIKit
import WebKit

protocol DataDelegate: AnyObject {
    func sendData(url: URL, string: String)
}

class Site_ViewController: UIViewController {
    weak var delegate: DataDelegate?

  

    @IBOutlet var youtube_webview: WKWebView!
    
    @IBOutlet var back_btn: UIBarButtonItem!
    
    @IBOutlet var url_btn: UIBarButtonItem!
    
    @IBOutlet var forward_btn: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
                // URL에서 콘텐츠 로드
                if let url = URL(string: "https://www.youtube.com") {
                    let request = URLRequest(url: url)
                    youtube_webview.load(request)
        
                }
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
    
    
    @IBAction func url_clicked(_ sender: Any) {
        

            // 현재 페이지의 URL 가져오기
            if let youtube_url = youtube_webview.url {
                // 페이지의 제목 가져오기
                youtube_webview.evaluateJavaScript("document.title") { (result, error) in
                    if error == nil {
                        if let pageTitle = result as? String {
//
//                            print(youtube_url)
//                            print(pageTitle)
                            self.delegate?.sendData(url: youtube_url,string:pageTitle)
                            print("일단 보냄")
                           
                            }
                    }
                }
            }
        
       
        self.dismiss( animated: true)
        
        }
    func checkRespose(str : String) -> Void {
           print("잘 받았나? :\(str)")
       }
    
    }
    

        
        




