//
//  TLButton.swift
//  Pods
//
//  Created by Thomas Lextrait on 11/25/16.
//

import UIKit

@IBDesignable
open class TLButton: UIButton {
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    private var handlers: [UInt : [()->Void]] = [:]
    private let selectorForEvent: [UInt : Selector] = [
        UIControlEvents.touchDown.rawValue: #selector(touchDown),
        UIControlEvents.touchDownRepeat.rawValue: #selector(touchDownRepeat),
        UIControlEvents.touchDragInside.rawValue: #selector(touchDragInside),
        UIControlEvents.touchDragOutside.rawValue: #selector(touchDragOutside),
        UIControlEvents.touchDragEnter.rawValue: #selector(touchDragEnter),
        UIControlEvents.touchDragExit.rawValue: #selector(touchDragExit),
        UIControlEvents.touchUpInside.rawValue: #selector(touchUpInside),
        UIControlEvents.touchUpOutside.rawValue: #selector(touchUpOutside),
        UIControlEvents.touchCancel.rawValue: #selector(touchCancel)
    ]
    
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
        layer.masksToBounds = shouldMaskToBounds()
    }
    
    // Actions
    
    open func on(event: UIControlEvents, handler: @escaping ()->Void) {
        if handlers[event.rawValue] == nil {
            handlers[event.rawValue] = []
        }
        handlers[event.rawValue]?.append(handler)
        guard let selector = selectorForEvent[event.rawValue] else {
            print("TLButton doesn't implement UIControlEvent of type: \(event)")
            return
        }
        addTarget(self, action: selector, for: event)
    }
    
    // Handlers
    
    private func callHandlersFor(event: UIControlEvents) {
        if handlers[event.rawValue] != nil {
            for handler in handlers[event.rawValue]! {
                handler()
            }
        }
    }
    
    @objc public func touchDown() {
        callHandlersFor(event: .touchDown)
    }
    
    @objc public func touchDownRepeat() {
        callHandlersFor(event: .touchDownRepeat)
    }
    
    @objc public func touchDragInside() {
        callHandlersFor(event: .touchDragInside)
    }
    
    @objc public func touchDragOutside() {
        callHandlersFor(event: .touchDragOutside)
    }
    
    @objc public func touchDragEnter() {
        callHandlersFor(event: .touchDragEnter)
    }
    
    @objc public func touchDragExit() {
        callHandlersFor(event: .touchDragExit)
    }
    
    @objc public func touchUpInside() {
        callHandlersFor(event: .touchUpInside)
    }
    
    @objc public func touchUpOutside() {
        callHandlersFor(event: .touchUpOutside)
    }
    
    @objc public func touchCancel() {
        callHandlersFor(event: .touchCancel)
    }

}
