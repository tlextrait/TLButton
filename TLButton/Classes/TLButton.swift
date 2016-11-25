//
//  TLButton.swift
//  Pods
//
//  Created by Thomas Lextrait on 11/25/16.
//

import UIKit

@IBDesignable
open class TLButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, frame: CGRect) {
        self.init(frame: frame)
        
        setTitle(title, for: .normal)
    }
    
    // Corners

    @IBInspectable open var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            maskToBoundsIfRequired()
        }
    }
    
    // Borders
    
    @IBInspectable open var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable open var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    // Shadows
    
    @IBInspectable open var shadowColor: UIColor = UIColor.black {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable open var shadowOpacity: Float = 0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
            maskToBoundsIfRequired()
        }
    }
    
    @IBInspectable open var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable open var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    // Masking
    
    private func shouldMaskToBounds() -> Bool {
        return layer.cornerRadius > 0 || layer.shadowOpacity > 0
    }
    
    private func maskToBoundsIfRequired() {
        //layer.masksToBounds = shouldMaskToBounds()
    }
    
    // Actions
    
    open func onTouch() -> TLButton {
        return self
    }

}
