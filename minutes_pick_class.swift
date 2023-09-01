//
//  minutes_pick_class.swift
//  alarm
//
//  Created by 박서경 on 2023/09/01.
//

import Foundation

import UIKit

// CustomPickerView 클래스는 UIPickerView를 상속하며,
// UIPickerViewDelegate와 UIPickerViewDataSource 프로토콜을 구현합니다.
class minutes_PickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {

    // 피커뷰에 표시될 데이터 배열
    let pickerData = Array(1...60).map { String($0) } // 1부터 12까지의 숫자를 문자열로 변환
    
    // 프로그래밍 방식으로 인스턴스를 생성할 때 호출됩니다.
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()  // 공통 초기화 함수 호출
    }
    
    // 스토리보드에서 인스턴스를 생성할 때 호출됩니다.
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()  // 공통 초기화 함수 호출
    }
    
    // 공통 초기화 로직
    private func commonInit() {
        self.delegate = self  // delegate를 self로 설정
        self.dataSource = self  // dataSource를 self로 설정
    }
    
    // UIPickerViewDataSource의 메소드: 컴포넌트의 수를 반환
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewDataSource의 메소드: 특정 컴포넌트의 행 수를 반환
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // UIPickerViewDelegate의 메소드: 특정 행의 타이틀을 반환
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}
