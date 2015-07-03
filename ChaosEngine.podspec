Pod::Spec.new do |spec|

spec.name 			= 'ChaosEngine'
spec.version 			= '0.0.1'
spec.license 			= { :type => 'MIT'}
spec.homepage 			= 'https://github.com/Elmundo/Chaos-Engine'
spec.authors 			= { 'Baris Yilmaz' => 'yilmazbaris@mail.com'}
spec.summary 			= 'Component-Based Game Engine.'
spec.source_files 		= 'chaos-engine/*.{h,m}'
spec.public_header_files 	= 'chaos-engine/*.h'
spec.requires_arc 		= true
spec.platform 			= :ios, '7.0'
spec.frameworks 		= 'Foundation', 'UIKit', 'CoreGraphics', 'SpriteKit'
spec.prefix_header_file 	= 'chaos-engine/PrefixHeader.pch'

spec.dependency 'TBXML', '~> 1.5'

end
