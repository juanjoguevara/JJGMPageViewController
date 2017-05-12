#
# Be sure to run `pod lib lint JJGMPageViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JJGMPageViewController'
  s.version          = '0.2.0'
  s.summary          = 'UIPageViewController made easy written in Objective C'

  s.description      = 'JJGPageViewController is the easiest way to use a UIPageViewController written in Objective C. It comes with  going to a specific page and navigating backwards and forwards'

  s.homepage         = 'https://github.com/juanjoguevara/JJGMPageViewController'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'juanjoguevara' => 'juanjoguevara@gmail.com' }
  s.source           = { :git => 'https://github.com/juanjoguevara/JJGMPageViewController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/juanjoguevara'

  s.ios.deployment_target = '8.0'

  s.source_files = 'JJGMPageViewController/Classes/**/*'
  s.resources = ['JJGMPageViewController/Resources/JJGMPageViewController.xib']

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
