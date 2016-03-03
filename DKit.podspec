Pod::Spec.new do |s|
  s.name         = "DKit"
  s.version      = "0.0.1"
  s.summary      = "The package of useful tools, include categories and classes"
  s.homepage     = "https://github.com/smartdj/DKit"
  s.license      = "apache 2.0"
  s.authors      = { 'dj' => 'smart.dj@163.com'}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/smartdj/DKit.git", :tag => s.version }
  s.source_files = 'DHelper', 'DKit/**/*.{h,m,swift}'
  s.requires_arc = trueend