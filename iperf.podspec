#
# Be sure to run `pod lib lint iperf.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'iperf'
  s.version          = '0.4.0'
  s.summary          = 'iperf3 as library to use via cocoapod'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This repository to have simple dependency for iOS project with iperf3
Original iperf is available here: https://github.com/esnet/iperf
This repository inspired by: https://github.com/yeahdongcn/iperf-iOS
                       DESC

  s.homepage         = 'https://github.com/Speakus/iperf'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Speakus' => 'speakus.net@gmail.com' }
  s.source           = { :git => 'https://github.com/Speakus/iperf.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = [ 'iperf/Classes/*', 'iperf/Classes/iperf/*.c' ]
  s.preserve_paths = [ 'iperf/Classes/*', 'iperf/Classes/iperf/*' ]

  # s.resource_bundles = {
  #   'iperf' => ['iperf/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
