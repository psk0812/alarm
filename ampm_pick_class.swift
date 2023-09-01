//
//  ampm_pick_class.swift
//  alarm
//
//  Created by 박서경 on 2023/09/01.
//

import Foundation
import UIKit

class ampm_PickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {

    let pickerData = ["오전", "오후"]
    
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
    // UIPickerViewDataSource methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // UIPickerViewDelegate methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}
