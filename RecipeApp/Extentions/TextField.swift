//
//  TextField.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import Foundation

// MARK: - Handel text field spacer
extension UITextField {
    func handelTextFieldSpacer(){
        var textView: UIView {
            let view = UIView()
            view.backgroundColor = .clear
            view.frame = CGRect(x: 10, y: 10, width: 10, height: 10)
            return view
        }
        self.layer.cornerRadius = 4
        self.leftView = textView
        self.leftViewMode = .always
    }

}

extension UITextField {
    // MARK: - Add arrow button to picker text field
    func pickerTextField() {
        var textView: UIView {
            let view = UIView()
            view.backgroundColor = .clear
            view.frame = CGRect(x: 10, y: 10, width: 60, height: 40)
            handelImageViewConstraint(view: view)
            return view
        }
        self.layer.cornerRadius = 4
        self.rightView = textView
        self.rightViewMode = .always
    }
    
    func handelImageViewConstraint(view: UIView) {
        let image       = UIImageView()
        view.addSubview(image)

        image.translatesAutoresizingMaskIntoConstraints = false
        image.image     = UIImage(systemName: "arrowtriangle.down.fill")

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - add tool bar to picker text field
    func addToolBarToPickerTextField(toolBar: UIToolbar) {
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        toolBar.tintColor       = Colors.mainColor
        self.inputAccessoryView = toolBar
    }
}

