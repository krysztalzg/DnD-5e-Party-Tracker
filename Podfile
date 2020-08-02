# Podfile

# Definitions of constant values.

PROJECT = 'DnD5PartyTracker'
TARGET_APP = 'DnD5PartyTracker'

# Definitions of dependencies.

def app_dependencies

  # Used to simplify declaring AutoLayout constraints.
  pod 'SnapKit', '~> 5.0'

  # The functional-reactive framework that powers the app.
  pod 'ReactiveCocoa', '~> 11.0'

  # Mobile databse for storing data on the device.
  pod 'RealmSwift', '~> 5.3'

end

# Actual Podfile implementation. You shouldn't need to edit anything below.

source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '11.0'
use_frameworks!
inhibit_all_warnings!

target TARGET_APP do
  app_dependencies
end