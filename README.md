# TLButton

[![CI Status](http://img.shields.io/travis/tlextrait/TLButton.svg?style=flat)](https://travis-ci.org/tlextrait/TLButton)
[![Version](https://img.shields.io/cocoapods/v/TLButton.svg?style=flat)](http://cocoapods.org/pods/TLButton)
[![License](https://img.shields.io/cocoapods/l/TLButton.svg?style=flat)](http://cocoapods.org/pods/TLButton)
[![Platform](https://img.shields.io/cocoapods/p/TLButton.svg?style=flat)](http://cocoapods.org/pods/TLButton)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Interface Builder

TLButton is IBDesignable and therefore works with Interface Builder. This allows you to customize your buttons, such as setting rounded corners or shadows and view the result directly in your storyboard:

![Interface Builder Button](https://cloud.githubusercontent.com/assets/1252930/20642839/2f632a96-b3e8-11e6-8f4a-c7db4f2e96ec.png)
![Toolbox](https://cloud.githubusercontent.com/assets/1252930/20642888/279e3c78-b3e9-11e6-8384-358ed0915852.png)

```swift
@IBOutlet weak var button: TLButton!

override func viewDidLoad() {
    super.viewDidLoad()

    ibButton.on(event: .touchUpInside) {
        print("Tapped button 1")
    }
}
```

## Requirements

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
