Pod::Spec.new do |s|

  s.name         = "BCNotificationCentre"
  s.version      = "0.0.1"
  s.summary      = "A take on NSNotificationCenter with priorities."

  s.description  = <<-DESC
    Add observers and post notifications with priorities.
  DESC

  s.homepage     = "https://github.com/bitsandco/BCNotificationCentre"

  s.license      = { :type => "Apache License, Version 2.0", :file => "LICENSE.md" }

  s.authors             = { "Romain Francez" => "romain@bitsandco.com" }
  s.social_media_url   = "http://twitter.com/bitsandco"

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/bitsandco/BCNotificationCentre.git", :tag => "v0.0.1" }

  s.source_files  = "BCNotificationCentre/**/*.swift"

end
