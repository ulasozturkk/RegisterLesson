//
//  myButton.swift
//  RegisterLesson
//
//  Created by macbook pro on 14.02.2024.
//

import UIKit

class myButton: UIButton {

  override init(frame: CGRect) {
    super.init(frame: frame)
      translatesAutoresizingMaskIntoConstraints = false
    titleLabel?.font = .customScaledFont(CustomFontName: Constants.BoldItalic)
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
