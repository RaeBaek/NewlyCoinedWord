//
//  NewlyCoinedWordsEnum.swift
//  NewlyCoinedWord
//
//  Created by 백래훈 on 2023/07/25.
//

import Foundation

enum NewlyCoinedWordsEnum: String, CaseIterable {
    case 얼죽아
    case 별다줄
    case 지못미
    case 케바케
    case 알잘딱깔센
    case 단짠단짠
    case GOAT
    case 내로남불
    case 중꺾마
    case 무물보
    case LOL
    
    var mean: String {
        switch self {
        case .얼죽아: return "얼어 죽어도 아이스 아메리카노"
        case .별다줄: return "별거 다 줄이다"
        case .지못미: return "지켜주지 못해 미안하다"
        case .케바케: return "케이스 바이 케이스"
        case .알잘딱깔센: return "알아서 잘 딱 깔끔하고 센스있게"
        case .단짠단짠: return "단맛 짠맛 단맛 짠맛"
        case .GOAT: return "Greatest Of All Time"
        case .내로남불: return "내가 하면 로맨스 남이 하면 불륜"
        case .중꺾마: return "중요한건 꺾이지 않는 마음"
        case .무물보: return "무엇이든 물어보세요"
        case .LOL: return "League Of Legends"
        }
    }
    
}
