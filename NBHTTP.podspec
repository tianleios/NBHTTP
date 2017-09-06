#
#  Be sure to run `pod spec lint NBHTTP.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|



  s.name         = "NBHTTP"
  s.version      = "3.0.1"
  s.summary      = " NBHTTP. googogoogogoogoggoogog"
  s.description  = <<-DESC
                   not empty not empty not empty not empty not empty not empty not empty not empty not empty not empty 
                   not empty not empty not empty not empty not empty not empty not empty not empty not empty not empty 
                   DESC
  s.homepage     = "https://github.com/tianleios/NBHTTP"
  s.license      = "MIT"
  s.framework  = "Foundation"
  s.platform     = :ios, "9.0"
  s.ios.deployment_target = "9.0"
  s.requires_arc = true
  s.author             = { "tinaleios" => "tianleios@163.com" }

  s.source       = { :git => "https://github.com/tianleios/NBHTTP.git", :tag => s.version.to_s }
  #s.source       = { :git => "/Users/tianlei/Desktop/NBHTTP/", :tag => s.version.to_s}
  
  s.source_files  = "HTTP/HTTP/NBHTTP", "HTTP/HTTP/NBHTTP/**/*.{h,m}"
  #s.source_files  = "NBHTTP", "NBHTTP/**/*.{h,m}"

  s.dependency  "AFNetworking","3.1.0"



end
