Pod::Spec.new do |spec|
  spec.name             = 'UIImageViewAligned'
  spec.version          = '0.0.1'
  spec.license          = 'MIT'
  spec.homepage         = 'https://github.com/reydanro/UIImageViewAligned'
  spec.authors          = 'Andrei Stanescu'
  spec.summary          = "It is a subclass of UIImageView that allows you to customize the alignment of the displayed image inside the view's frame."
  spec.source           =  { :git => 'https://github.com/allu22/UIImageViewAligned.git', :tag => "v#{spec.version}" }
  spec.source_files     = 'UIImageViewAligned/UIImageViewAligned.{h,m}'
  spec.frameworks       = 'UIKit'
  spec.requires_arc     = true
  spec.platform         = :ios
end
