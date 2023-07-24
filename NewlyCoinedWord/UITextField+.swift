//
//  UITextField+.swift
//  NewlyCoinedWord
//
//  Created by 백래훈 on 2023/07/21.
//

import UIKit

extension UITextField {
    func addLeftPadding() {
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
      self.leftView = paddingView
      self.leftViewMode = ViewMode.always
    }
  }
