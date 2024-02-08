//
//  CustomComponents.swift
//  RegisterLesson
//
//  Created by macbook pro on 8.02.2024.
//

import Foundation
import UIKit

struct CustomComponents {
    
    static func createTextField(placeholder : String,isSecured : Bool) -> UITextField {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = placeholder
        textfield.font = UIFont(name: Constants.light, size: 20)
        textfield.layer.cornerRadius = 30
        textfield.borderStyle = .line
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.layer.masksToBounds = true
        textfield.isSecureTextEntry = isSecured
        textfield.textAlignment = .center
        return textfield
    }
    
    static func BackButton(systemImage : String) -> UIButton {
        let button = UIButton()

        button.frame = CGRect(x: 0, y: 0, width: 40, height:40)
        button.layer.cornerRadius = button.bounds.size.width / 2
        button.clipsToBounds = true
        button.backgroundColor = .orange
        let symbolImage = UIImage(systemName: systemImage)
        button.setImage(symbolImage, for: .normal)
        button.tintColor = .white
        return button
    }
    
    static func SemiBoldLabel(size : CGFloat,text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont(name: Constants.SemiBoldItalic, size: size)
        return label
    }
    
    static func BoldLabel(size: CGFloat,text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont(name: Constants.BoldItalic, size: size)
        return label
    }
    
    static func LightLabel(size: CGFloat,text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont(name: Constants.light, size: size)
        return label
    }
    
    static func ItalicLabel(size: CGFloat,text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont(name: Constants.italic, size: size)
        return label
    }
}
