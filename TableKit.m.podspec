Pod::Spec.new do |s|
  s.name         = "TableKit.m"
  s.version      = "0.1.0"
  s.summary      = "Create table view with blocks based syntax."
  s.homepage     = "https://github.com/brunow/TableKit.m"
  s.license      = 'Apache License 2.0'
  s.author       = { "Bruno Wernimont" => "hello@brunowernimont.be" }
  s.source       = { :git => "https://github.com/brunow/TableKit.m.git", :tag => "0.1.0" }
  s.platform     = :ios, '5.0'
  s.source_files = 'TableKit/*.{h,m}'
  s.requires_arc = true
end