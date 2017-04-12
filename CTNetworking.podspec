Pod::Spec.new do |s|


  s.name         = "CTNetworking"
  s.version      = "1.0.0"
  s.summary      = "CTNetworking is an iOS discrete HTTP API calling framework based on AFNetworking."
  s.description  = <<-DESC
                   CTNetworking is an iOS discrete HTTP API calling framework based on AFNetworking,this is CTNetworking
                    DESC

  s.homepage     = "https://github.com/casatwy/RTNetworking"
  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author             = { "CasaTaloyum" => "casatwy@msn.com" }
  s.platform     = :ios, "8.0"

#s.source       = { :git => "https://github.com/Corotata/RTNetworking.git", :tag => "#{s.version}" }
    s.source       = { :git => "https://github.com/Corotata/RTNetworking.git"}

  s.source_files  = "CTNetworking/CTNetworking/**/*.{h,m}"
  #s.public_header_files = "CTNetworking/CTNetworking/**/*.h"
  s.resource  = "CTNetworking/CTNetworking/**/*.plist"

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  s.requires_arc = true

  s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/AFNetworking" }
  s.dependency "AFNetworking", "~> 3.1.0"

end
