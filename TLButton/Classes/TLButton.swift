//
//  TLButton.swift
//  Pods
//
//  Created by Thomas Lextrait on 11/25/16.
//

import UIKit

@IBDesignable
open class TLButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            maskToBoundsIfRequired()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
            maskToBoundsIfRequired()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    private func shouldMaskToBounds() -> Bool {
        return layer.cornerRadius > 0 || layer.shadowOpacity > 0
    }
    
    private func maskToBoundsIfRequired() {
        //layer.masksToBounds = shouldMaskToBounds()
    }

}
