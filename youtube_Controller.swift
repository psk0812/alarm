//
//  youtube_Controller.swift
//  alarm
//
//  Created by 박서경 on 2023/08/31.
//

import Foundation
import UIKit
import WebKit
import UserNotifications

class YoutubeController: UIViewController, Final_DataDelegate, UITableViewDataSource, UITableViewDelegate,UNUserNotificationCenterDelegate{
    func sendList(_ list: [Int]) {
        print(list)
        print("Received URL: \(alram_url)")
        print("Received Title: \(alram_title)")
        print("Received AM/PM: \(alram_ampm)")
        print("Received Hour: \(alram_hour)")
        print("Received Minutes: \(alram_minutes)")
        
        var day : String?
        var day_all : String = ""
        let sortedList = list.sorted()
        for i in sortedList{
            if i==2 {day="월"}
            else if i==3 {day="화"}
            else if i==4 {day="수"}
            else if i==5 {day="목"}
            else if i==6 {day="금"}
            else if i==7 {day="토"}
            else {day="일"}
            day_all+=day!
            day_all+=" "
        }
        
        dayArray.append(day_all)
        alram_tableview.reloadData()
        
        
        print(timeArray)
        print(titleArray)
        print(vibArrray)
        print(URLArray)
        print(dayArray)
        print(ampmArray)
        print(hourArray)
        print(minutesArray)
        
    }
    
    func sendData(url: URL, title: String, ampm: String, hour: String, minutes: String, check : Bool) {
        
        let combinedString = "\(ampm) \(hour):\(minutes)"
        alram_url = url.absoluteString
        alram_ampm = ampm
        alram_hour = Int(hour)!
        alram_minutes = Int(hour)!
        alram_title = title
        alram_vibrate = check
        
        //테이블 리로드
        timeArray.append(combinedString)
        titleArray.append(title)
        
        //테이블 리로드와는 상관없음
        vibArrray.append(alram_vibrate)
        URLArray.append(url)
        ampmArray.append(ampm)
        hourArray.append(hour)
        minutesArray.append(minutes)
        
        
        
        
        
    }
    
    
    
    
    
    var timeArray: [Any] = [] // 데이터 배열 초기화
    var titleArray: [Any] = [] // 데이터 배열 초기화
    var vibArrray: [Bool] = []
    var dayArray:[String]=[]
    var URLArray:[URL]=[]
    var ampmArray:[String]=[]
    var hourArray:[String]=[]
    var minutesArray:[String]=[]
    
    var alram_url : String = ""
    var alram_ampm : String = ""
    var alram_hour : Int = 0
    var alram_minutes : Int = 0
    var alram_title : String = ""
    var alram_vibrate : Bool = false
    
    
    
    @IBOutlet var background_View: UIView!
    
    @IBOutlet var alram_tableview: UITableView!
    
    @IBOutlet var button_view: UIView!
    
    @IBOutlet var alram_plus_btn: UIButton!
    
    @IBOutlet var Good_day: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alram_tableview.dataSource = self
        alram_tableview.delegate = self
        // 테이블 뷰의 편집 모드 활성화
        
        alram_tableview.register(UINib(nibName: "youtube_cell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
        
        // UNUserNotificationCenter의 delegate를 설정
        UNUserNotificationCenter.current().delegate = self
        
        
        
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
    
//    @IBAction func alram_add_btn(_ sender: UIButton) {
//        if timeArray.count >= 2 {
//            // timeArray에 원소가 8개 이상이면 알림창을 띄웁니다.
//            let alertController = UIAlertController(title: "알림", message: "알람을 더 이상 추가할 수 없습니다.", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
//            alertController.addAction(okAction)
//            present(alertController, animated: true, completion: nil)
//        } else {
//            // timeArray에 원소가 8개 미만이면 youtube_alram_Controller를 present modally로 표시합니다.
//            let storyboard = UIStoryboard(name: "Main", bundle: nil) // 스토리보드 이름은 앱에 따라 다를 수 있습니다.
//            let youtubeAlarmController = storyboard.instantiateViewController(withIdentifier: "youtube_alram_Controller") // 해당 뷰 컨트롤러의 identifier를 사용해야 합니다.
//            present(youtubeAlarmController, animated: true, completion: nil)
//        }
//
    //}
    
    
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
        if let data = dayArray[indexPath.row] as? String {
            cell.alram_day.text = data
        }
        
        if alram_vibrate==true
        {   let image = UIImage(systemName: "iphone.gen2.radiowaves.left.and.right")
            cell.alram_vibrate.image=image}
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //각 셀의 높이
        
        return 80.0 //
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            
            // 데이터 배열에서 해당 셀의 데이터를 제거합니다.
            print(timeArray)
            print(indexPath.row)
            timeArray.remove(at: indexPath.row)
            titleArray.remove(at: indexPath.row)
            dayArray.remove(at: indexPath.row)
            alram_tableview.deleteRows(at: [indexPath], with: .fade)
            vibArrray.remove(at: indexPath.row)
            URLArray.remove(at: indexPath.row)
            ampmArray.remove(at: indexPath.row)
            hourArray.remove(at: indexPath.row)
            minutesArray.remove(at: indexPath.row)
            
            print(timeArray)
            print(titleArray)
            print(vibArrray)
            print(URLArray)
            print(dayArray)
            print(ampmArray)
            print(hourArray)
            print(minutesArray)
            
            // 테이블 뷰에서 해당 셀을 삭제합니다.
            
        }else if editingStyle == .insert{}
    }
}
    




    
        
    



    
    
    






