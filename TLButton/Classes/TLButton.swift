/*
//
//  TLButton.swift
//  Pods
//
//  Created by Thomas Lextrait on 11/25/16.
//

 Copyright (c) 2016 Thomas Lextrait <thomas.lextrait@gmail.com>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

import UIKit

@IBDesignable
open class TLButton: UIButton {
    
    public convenience init(title: String) {
        self.init(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        setTitle(title, for: .normal)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
            if shadowOpacity > 1 {
                shadowOpacity = 1
            } else if shadowOpacity < 0 {
                shadowOpacity = 0
            }
            layer.shadowOpacity = shadowOpacity
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
