# TLButton

[![CI Status](http://img.shields.io/travis/tlextrait/TLButton.svg?style=flat)](https://travis-ci.org/tlextrait/TLButton)
[![Version](https://img.shields.io/cocoapods/v/TLButton.svg?style=flat)](http://cocoapods.org/pods/TLButton)
[![License](https://img.shields.io/cocoapods/l/TLButton.svg?style=flat)](http://cocoapods.org/pods/TLButton)
[![Platform](https://img.shields.io/cocoapods/p/TLButton.svg?style=flat)](http://cocoapods.org/pods/TLButton)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Interface Builder

TLButton is IBDesignable and therefore works with Interface Builder. This allows you to customize your buttons, such as setting rounded corners or shadows and view the result directly in your storyboard:

![Interface Builder](https://cloud.githubusercontent.com/assets/1252930/20643826/b7a9a864-b3f0-11e6-8b89-ed8ee8dd08af.png)

### Events

TLButton allows you to pass a code block to the button for given events.

```swift
button.on(event: .touchUpInside) {
    print("Tapped button")
}
```

## Requirements

Swift 3.0+

## Installation

TLButton is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TLButton"
```

## Author

Thomas Lextrait, thomas.lextrait@gmail.com

## License

TLButton is available under the MIT license. See the LICENSE file for more info.
