Pod::Spec.new do |s|
  s.name          = "InventoryKit"
  s.version       = "0.0.3"
  s.summary       = "SDK that provides inventory related functionality to build 214 alpha applications."
  s.license       = { }
  s.homepage      = "https://github.com/214alphadev/inventory-kit-ios"
  s.author        = { "Alberto Estarrona" => "alberto@214alpha.com" }
  s.platform      = :ios, "11.0"
  s.source        = { :git => "https://github.com/214alphadev/inventory-kit-ios" }
  s.source_files  = "InventoryKit/**/*.swift"
  s.framework     = "UIKit"
  s.dependency 'Apollo', '0.10.0'
  s.dependency 'FlowKit', '0.0.2'
  s.dependency 'RealmSwift', '3.16.1'
  s.dependency 'CommunityKit', '0.0.2'
end
