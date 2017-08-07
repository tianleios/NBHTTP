#
#  Be sure to run `pod spec lint NBHTTP.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|



  s.name         = "NBHTTP"
  s.version      = "1.0.0"
  s.summary      = " NBHTTP. googogoogogoogoggoogog"
  s.description  = <<-DESC
                   not empty not empty not empty not empty not empty not empty not empty not empty not empty not empty 
                   not empty not empty not empty not empty not empty not empty not empty not empty not empty not empty 
                   DESC
  s.homepage     = "https://github.com/tianleios/NBHTTP"
  s.license      = "MIT"
  s.framework  = "Foundation"
  s.platform     = :ios
  s.requires_arc = true
  s.author             = { "tinaleios" => "tianleios@163.com" }

  #s.source       = { :git => "https://github.com/tianleios/NBHTTP.git", :tag => s.version }
  s.source       = { :git => "/Users/tianlei/Desktop/NBHTTP/"}
  
  #s.source_files  = "HTTP/HTTP/NBHTTP", "HTTP/HTTP/NBHTTP/**/*.{h,m}"
  s.source_files  = "NBHTTP", "NBHTTP/**/*.{h,m}"

  s.dependency  "AFNetworking","3.1.0"
  #dd59ffa
  #s.xcconfig = { "OTHER_LDFLAGS" => "-lz" }

  
  #s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  #
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

end
