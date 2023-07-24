//
//  NewWordViewController.swift
//  NewlyCoinedWord
//
//  Created by 백래훈 on 2023/07/21.
//

import UIKit

class NewWordViewController: UIViewController {

    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var wordFirstButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomWord()
        
    }
    
    @discardableResult
    func getRandomWord() -> String {
        let random = ["고래밥", "칙촉", "카스타드", "메로나", "월드콘"]
        let result = random.randomElement()!
        
        return result
    }
    
    @IBAction func textFieldKeyboardTapped(_ sender: UITextField) {
        print(#function)
        
        switchmoon(textField: sender)
//        if wordTextField.text == "별다줄" {
//            textLabel.text = "별다줄은 '별거 다 줄이다'의 줄임말이다."
//        } else if wordTextField.text == "얼죽아" {
//            textLabel.text = "얼죽아는 '얼어 죽어도 아이스 아메리카노'의 줄임말이다."
//        } else {
//            textLabel.text = "찾는 결과가 없습니다."
//        }
    }
    
    func switchmoon(textField: UITextField) {
        switch textField.text {
        case "별다줄":
            textLabel.text = "별다줄은 '별거 다 줄이다'의 줄임말이다."
        case "jmt", "JMT":
            textLabel.text = "존맛탱 ㅋㅋ"
        case "얼죽아":
            textLabel.text = "얼죽아는 '얼어 죽어도 아이스 아메리카노'의 줄임말이다."
        default:
            textLabel.text = "찾는 결과가 없습니다."
        }
    }
    
    
    // 버튼 클릭 시 텍스트 필드의 텍스트에 버튼 타이틀이 들어가는 기능
    // 1.
    @IBAction func wordButtonTapped(_ sender: UIButton) {
        // 2.
        wordTextField.text = sender.currentTitle
        // 3.
        textFieldKeyboardTapped(wordTextField)
        
    }
    
}
