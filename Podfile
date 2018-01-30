
platform :ios, '9.0'

use_frameworks!

target 'LineChartView' do

pod 'Charts'


post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.0'
        end
    end
end


end
