# JJGMPageViewController

[![CI Status](http://img.shields.io/travis/juanjoguevara/JJGMPageViewController.svg?style=flat)](https://travis-ci.org/juanjoguevara/JJGMPageViewController)
[![Version](https://img.shields.io/cocoapods/v/JJGMPageViewController.svg?style=flat)](http://cocoapods.org/pods/JJGMPageViewController)
[![License](https://img.shields.io/cocoapods/l/JJGMPageViewController.svg?style=flat)](http://cocoapods.org/pods/JJGMPageViewController)
[![Platform](https://img.shields.io/cocoapods/p/JJGMPageViewController.svg?style=flat)](http://cocoapods.org/pods/JJGMPageViewController)

Pages is the easiest way of setting up a UIPageViewController in Objective C. It comes with  going to a specific page and navigating backwards and forwards.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* ARC
* iOS 8

## Installation

JJGMPageViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JJGMPageViewController"
```

## Usage

```ruby
#import "JJGMPageViewController"

JJGMPageViewController *pageViewController = [[JJGMPageViewController alloc] init];

[pageViewController addViewControllers:@[firstViewController,secondViewController,thirdViewController]];

[pageViewController goLast]
```

## Author

juanjoguevara, juanjoguevara@gmail.com

## License

JJGMPageViewController is available under the MIT license. See the LICENSE file for more info.
