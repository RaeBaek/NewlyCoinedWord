//
//  WordViewController.swift
//  NewlyCoinedWord
//
//  Created by 백래훈 on 2023/07/21.
//

import UIKit

class WordViewController: UIViewController {

    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var recommendWordButtons: [UIButton]!
    
    @IBOutlet var resultLabel: UILabel!
    
    let wordArray = ["얼죽아", "별다줄", "지못미", "케바케", "알잘딱깔센", "단짠단짠", "GOAT", "내로남불", "중꺾마", "무물보", "LOL"]
    
    let wordDictionary = [
        "얼죽아": "얼어 죽어도 아이스 아메리카노",
        "별다줄": "별거 다 줄이다",
        "지못미": "지켜주지 못해 미안하다",
        "케바케": "케이스 바이 케이스",
        "알잘딱깔센": "알아서 잘 딱 깔끔하고 센스있게",
        "단짠단짠": "단맛 짠맛 단맛 짠맛",
        "GOAT": "Greatest Of All Time",
        "내로남불": "내가 하면 로맨스 남이 하면 불륜",
        "중꺾마": "중요한건 꺾이지 않는 마음",
        "무물보": "무엇이든 물어보세요",
        "LOL": "League Of Legends"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designTextField()
        designSearchButton()
        designRecommandWords()
        designBackgroundImage()
        designResultLabel()
        randomRecommandWords()
        
    }
    
    @IBAction func textFieldReturnButtonTapped(_ sender: UITextField) {
        searchNewlyCoindWord(newlyWord: sender.text ?? "")
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchNewlyCoindWord(newlyWord: wordTextField.text ?? "")
    }
    
    @IBAction func tapGestrueTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func recommendWordButtonTapped(_ sender: UIButton) {
        wordTextField.text = sender.currentTitle
        searchNewlyCoindWord(newlyWord: wordTextField.text ?? "")
    }
    
    func searchNewlyCoindWord(newlyWord word: String) {
        let warnning = "결과를 찾을 수 없습니다.\n다시 입력해주세요."
        let word = word.uppercased()
        if wordArray.contains(word) {
            resultLabel.text = "'\(word)'은(는)\n '\(wordDictionary[word] ?? warnning)'의 줄임말입니다."
        } else {
            resultLabel.text = warnning
        }
        view.endEditing(true)
    }
    
    func designTextField() {
        wordTextField.addLeftPadding()
        wordTextField.borderStyle = .line
        wordTextField.layer.borderWidth = 2
        wordTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    func designSearchButton() {
        searchButton.backgroundColor = .black
        searchButton.tintColor = .white
        searchButton.layer.borderColor = UIColor.black.cgColor
        searchButton.layer.borderWidth = 2
    }
    
    func designRecommandWords() {
        for i in 0..<recommendWordButtons.count {
            recommendWordButtons[i].titleLabel?.font = .systemFont(ofSize: 15)
            recommendWordButtons[i].tintColor = .black
            recommendWordButtons[i].layer.borderColor = UIColor.black.cgColor
            recommendWordButtons[i].layer.borderWidth = 1
            recommendWordButtons[i].layer.cornerRadius = 10
        }
    }
    
    func designBackgroundImage() {
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFit
    }
    
    func designResultLabel() {
        resultLabel.text = "줄임말을 입력하고 \n검색버튼을 눌러주세요."
        resultLabel.font = .systemFont(ofSize: 17)
        resultLabel.textColor = .black
    }
    
    func randomRecommandWords() {
        for i in 0..<recommendWordButtons.count {
            let result = wordArray.randomElement()!
            print(result)
            recommendWordButtons[i].setTitle(result, for: .normal)
        }
    }
}
