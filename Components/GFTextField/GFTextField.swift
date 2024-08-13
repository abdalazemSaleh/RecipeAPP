//
//  GFTextField.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import UIKit

class GFTextField: UITextField {
    // MARK: - @IBInspectable
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= rightPadding
        return textRect
    }

    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }

    @IBInspectable var rightPadding: CGFloat = 0

    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            updateBorder()
        }
    }

    func updateView() {
        if let image = rightImage {
            rightViewMode = .always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = color
            rightView = imageView
        } else {
            rightViewMode = .never
            rightView = nil
        }
    }

    func updateBorder() {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = 1
    }
    // MARK: - Padding
    let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
