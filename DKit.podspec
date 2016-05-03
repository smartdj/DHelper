Pod::Spec.new do |s|
  s.name                  = "DKit"        #名称
  s.version               = "0.0.4"       #版本号
  s.summary               = "DKit"            #简短介绍，下面是详细介绍
  s.description           = <<-DESC
                            Testing Private Podspec.

                            * Markdown format.
                            * Don't worry about the indent, we strip it!
                            DESC
  s.homepage              = "https://github.com/smartdj/DKit"   #主页,这里要填写可以访问到的地址，不然验证不通过
  s.license               = "apache 2.0"   #开源协议
  s.authors               = { 'dj' => 'smart.dj@163.com'}
  s.platform              = :ios, "7.0"
  s.source                = { :git => "https://github.com/smartdj/DKit.git", :tag => s.version }    #项目地址，这里不支持ssh的地址，验证不通过，只支持HTTP和HTTPS，最好使用HTTPS
  s.source_files          = 'DKit', 'DKit/**/*.{h,m,swift}'
  s.source_files          = 'DKit', 'DKit/**/**/*.{h,m,swift}'
  s.requires_arc          = true    #是否使用ARC，如果指定具体文件，则具体的问题使用ARC
  s.frameworks            = 'UIKit'                  #所需的framework，多个用逗号隔开
  s.dependency 'AFNetworking', '~> 3.0.4'   #依赖关系，该项目所依赖的其他库
  s.dependency 'hpple', '~> 0.2.0'
  s.dependency 'KissXML', '~> 5.0.3'
  s.dependency 'Mantle', '~> 2.0.6'
  s.dependency 'Masonry', '~> 0.6.4'
  s.dependency 'RealReachability', '~> 1.1.1'
  s.dependency 'RegexKitLite', '~> 4.0'
  s.dependency 'SDWebImage', '~> 3.7.5'
  s.dependency 'ZipArchive', '~> 1.4.0'
  s.dependency 'LGHelper', '~> 1.1.0'
  s.dependency 'LGViews', '~> 1.0.0'
  s.dependency 'JRSwizzle', '~> 1.0'
end