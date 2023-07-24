//
//  ViewController.swift
//  NewlyCoinedWord
//
//  Created by 백래훈 on 2023/07/20.
//

import UIKit

class DateViewController: UIViewController {
    
    @IBOutlet var datePicker: UIDatePicker!
    
    // @IBOutlet 컬렉션을 사용해봤다.
    // 배열안 객체들의 인덱스는 어떻게 정해지는지 감은 잡혔으나
    // 확실한 답을 알고싶어 질문했고 답은 연결해주는 순서대로 0부터 시작이다!
    // (명확히 배열안의 내용이 보이지 않아 당황스러웠다.)
    @IBOutlet var plusDayLabel: [UILabel]!
    @IBOutlet var views: [UIView]!
    @IBOutlet var anniversaryBackgroundImage: [UIImageView]!
    @IBOutlet var anniversaryLabel: [UILabel]!
    
    // 배경 이미지로 넣어줄 음식이름 배열
    let foods = ["삼겹살", "피자", "스테이크", "닭발"]
    
    // DateFormatter: 1. 시간대 변경 2. 날짜 포맷 변경
    let format = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        format.dateFormat = "yyyy년 MM월 dd일"
        
        designDatePicker()
        firstSetting()
        // 실행했을 때 당장 오늘 날짜를 기준으로 기념일을 바로 계산
        datePickerValueChanged(datePicker)
        
    }
    
    // DatePicker의 값이 바뀔 때 마다 액션 함수 호출
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        // 기념일의 값을 바꿔주는 함수 호출
        dateChanged(date: sender.date)
    }
    
    // 초기 이미지 세팅
    func firstSetting() {
        for i in 0..<foods.count {
            designViews(index: i, imageName: foods[i], plusDay: (i + 1) * 100)
        }
    }
    
    // 100 ~ 400 기념일 UI 구성 함수
    func designViews(index: Int, imageName name: String, plusDay: Int) {
        plusDayLabel[index].text = "D + \(plusDay)"
        plusDayLabel[index].textColor = .white
        
        anniversaryLabel[index].textColor = .white
        
        anniversaryBackgroundImage[index].image = UIImage(named: name)
        anniversaryBackgroundImage[index].backgroundColor = .black
        anniversaryBackgroundImage[index].contentMode = .scaleAspectFill
        anniversaryBackgroundImage[index].layer.cornerRadius = 20
        
        
        views[index].layer.cornerRadius = 20
        views[index].layer.shadowColor = UIColor.black.cgColor
        // 햇빛이 비추는 위치
        views[index].layer.shadowOffset = .zero //CGSize(width: 0, height: 0)
        // 섀도우 퍼짐의 정도
        views[index].layer.shadowRadius = 10
        // 섀도우 불투명도
        views[index].layer.shadowOpacity = 0.5
//        views[index].clipsToBounds = false
    }
    
    // 선택하는 날짜에 맞게 기념일 계산
    func dateChanged(date: Date) {
        // 100 ~ 400일 뒤
        for i in 0..<views.count {
            let plusNDay = Calendar.current.date(byAdding: .day, value: (i + 1) * 100, to: date)
            
            
            
            let value = format.string(from: plusNDay!)
            anniversaryLabel[i].text = value
        }
        
    }

    // DatePicker UI 구성 함수
    func designDatePicker() {
        datePicker.tintColor = .systemPink
        
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }
}

