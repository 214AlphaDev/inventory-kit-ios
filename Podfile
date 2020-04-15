platform :ios, '11.0'

target 'InventoryKit' do
  use_frameworks!
  pod 'Apollo', '0.10.0'
  pod 'FlowKit', :git => 'git@gitlab.com:214alpha/utilities/flowkit.git', :commit => '641d8c945c4cf209bb321bed9129bdd719d795b8'
  pod 'RealmSwift', '3.16.1'
  pod 'CommunityKit', :git => 'git@gitlab.com:214alpha/community/communitykitios.git', :commit => 'db8c601e628a3b5701f426cb2480ef5cdb591f26'
end

target 'InventoryKitTests' do
    use_frameworks!
    pod 'InventoryKit', :path => '.'
end


target 'InventoryKitDemo' do
    use_frameworks!
    pod 'InventoryKit', :path => '.'
end
