//
//  youtube_Controller.swift
//  alarm
//
//  Created by 박서경 on 2023/08/31.
//

import Foundation
import UIKit
import WebKit

class YoutubeController: UIViewController, Final_DataDelegate, UITableViewDataSource, UITableViewDelegate{

    func sendList(_ list: [String]) {
        print("list_hello")
        print(list)
    }
    
    func sendData(url: URL, title: String, ampm: String, hour: String, minutes: String) {
        print("Received URL: \(url)")
        print("Received Title: \(title)")
        print("Received AM/PM: \(ampm)")
        print("Received Hour: \(hour)")
        print("Received Minutes: \(minutes)")
        let combinedString = "\(ampm) \(hour):\(minutes)"
        timeArray.append(combinedString)
        titleArray.append(title)
        alram_tableview.reloadData()
    }


    var timeArray: [Any] = [] // 데이터 배열 초기화
    var titleArray: [Any] = [] // 데이터 배열 초기화
  

   
    @IBOutlet var background_View: UIView!

    @IBOutlet var alram_tableview: UITableView!
    
    @IBOutlet var button_view: UIView!
    
    @IBOutlet var alram_plus_btn: UIButton!
    
    @IBOutlet var Good_day: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        alram_tableview.dataSource = self
        alram_tableview.delegate = self
        alram_tableview.register(UINib(nibName: "youtube_cell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")


        
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
        
        
        alram_tableview.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5) // 여기서 alpha 값을 조절하여 투명도를 조절
        
        button_view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5) // 여기서 alpha 값을 조절하여 투명도를 조절
        alram_plus_btn.setTitle("유튜브 알람추가", for: .normal)
        alram_plus_btn.sizeToFit()
        
    
        }
    
    //유튜브 사이트 데이터 받기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? youtube_alram_Controller {
            destinationVC.delegate = self
        }
            
        }
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeArray.count // 데이터 배열의 개수만큼 행 반환
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        
        // 테이블 셀의 배경색을 투명하게 설정
        cell.backgroundColor = UIColor.clear
        // 셀에 데이터 배열의 내용 표시
        if let data = timeArray[indexPath.row] as? String {
            cell.alram_time.text = data
        }
        if let data = titleArray[indexPath.row] as? String {
            cell.alarm_title.text = data
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //각 셀의 높이
        
        return 80.0 //
    }
    
}





