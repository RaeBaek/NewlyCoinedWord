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
    
    @IBOutlet var recommendWordsResetButton: UIButton!
    
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
        designResearchButton()
        designBackgroundImage()
        designResultLabel()
        randomRecommandWords()
        
    }
    
    @IBAction func textFieldReturnButtonTapped(_ sender: UITextField) {
        searchNewlyCoindWord(newlyWord: sender.text)
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchNewlyCoindWord(newlyWord: wordTextField.text)
    }
    
    @IBAction func tapGestrueTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func recommendWordButtonTapped(_ sender: UIButton) {
        wordTextField.text = sender.currentTitle
        searchNewlyCoindWord(newlyWord: wordTextField.text)
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        randomRecommandWords()
        
    }
    
    // 빈칸과 nil을 검색어로 받았을 때 보여주는 경고 알림 창 함수
    func warningAlert() {
        let alert = UIAlertController(title: "주의하세요!", message: "검색어를 입력 후 검색해주세요!", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    // 검색어를 받아 3가지 경우의 수로 비교하는 함수
    // 1. word가 nil 또는 ""(빈칸)인가
    // 2. word가 검색어에 포함되어 있는가
    // 3. word가 검색어에 포함되어 있지 않은가
    func searchNewlyCoindWord(newlyWord word: String?) {
        let warnning = "결과를 찾을 수 없습니다.\n검색어를 다시 입력해주세요."
        
        if let word {
            if word == nil || word.count <= 1 {
                warningAlert()
            } else {
                let word = word.uppercased()
                if wordArray.contains(word) {
                    resultLabel.text = "'\(word)'은(는)\n '\(wordDictionary[word] ?? warnning)'의 줄임말입니다."
                } else {
                    resultLabel.text = warnning
                }
            }
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
    
    // 검색 추천어를 재검색해주는 재검색 버튼 UI 구성 함수
    func designResearchButton() {
        let attributedTitle = NSAttributedString(
            string: "재검색",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular),
                         NSAttributedString.Key.foregroundColor: UIColor.white])
        
        recommendWordsResetButton.backgroundColor = .black
        recommendWordsResetButton.tintColor = .white
        recommendWordsResetButton.layer.borderColor = UIColor.black.cgColor
        recommendWordsResetButton.layer.borderWidth = 1
        recommendWordsResetButton.layer.cornerRadius = 10
        
        recommendWordsResetButton.setAttributedTitle(attributedTitle, for: .normal)
    }
    
    func designBackgroundImage() {
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFit
    }
    
    func designResultLabel() {
        resultLabel.text = "줄임말을 입력하고 \n검색버튼을 눌러주세요."
        resultLabel.font = .systemFont(ofSize: 17, weight: .regular)
        resultLabel.textColor = .black
    }
    
    // 추천 검색어를 고정된 갯수인 4개 씩 추천해주되
    // 중복되지 않게 추천해주고
    // 추천 검색어 가장 우측에 검색어 재검색 버튼 추가
    func randomRecommandWords() {
        var wordArray = wordArray
        
        for i in 0..<recommendWordButtons.count {
            recommendWordButtons[i].tintColor = .black
            recommendWordButtons[i].layer.borderColor = UIColor.black.cgColor
            recommendWordButtons[i].layer.borderWidth = 1
            recommendWordButtons[i].layer.cornerRadius = 10
            
            let result = wordArray.randomElement()!
            
            if let index = wordArray.firstIndex(of: result) {
                wordArray.remove(at: index)
            }
            
            let attributedTitle = NSAttributedString(
                string: result,
                attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular),
                             NSAttributedString.Key.foregroundColor: UIColor.black])
            
            recommendWordButtons[i].setTitle(result, for: .normal)
            recommendWordButtons[i].setAttributedTitle(attributedTitle, for: .normal)
            
        }
    }
}
