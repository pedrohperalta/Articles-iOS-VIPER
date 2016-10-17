source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target 'Articles' do
  pod 'AlamofireObjectMapper', '~> 4.0'
  pod 'Kingfisher', '~> 3.0'
  pod 'PKHUD', :git => 'https://github.com/toyship/PKHUD.git'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
