Pod::Spec.new do |s|

  s.name         = "BCNotificationCentre"
  s.version      = "1.0.0"
  s.summary      = "A take on NSNotificationCenter with priorities and typed values."

  s.description  = <<-DESC
    Add observers and post notifications with priorities and typed values.
  DESC

  s.homepage     = "https://github.com/bitsandco/BCNotificationCentre"

  s.license      = { :type => "Apache License, Version 2.0", :file => "LICENSE.md" }

  s.authors             = { "Romain Francez" => "romain@bitsandco.com" }
  s.social_media_url   = "http://twitter.com/bitsandco"

  s.platform     = :ios, "8.0"
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  
  s.source       = { :git => "https://github.com/bitsandco/BCNotificationCentre.git", :tag => "v1.0.0" }

  s.source_files  = "BCNotificationCentre/**/*.swift"

end
