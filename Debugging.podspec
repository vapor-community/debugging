Pod::Spec.new do |spec|
  spec.name         = 'Debugging'
  spec.version      = '1.1.0'
  spec.license      = 'MIT'
  spec.homepage     = 'https://github.com/vapor/debugging'
  spec.authors      = { 'Vapor' => 'contact@vapor.codes' }
  spec.summary      = 'A library to aid Vapor users with better debugging around the framework'
  spec.source       = { :git => "#{spec.homepage}.git", :tag => "#{spec.version}" }
  spec.ios.deployment_target = "8.0"
  spec.osx.deployment_target = "10.9"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"
  spec.requires_arc = true
  spec.social_media_url = 'https://twitter.com/codevapor'
  spec.default_subspec = "Default"

  spec.subspec "Default" do |ss|
    ss.source_files = 'Sources/**/*.{swift}'
  end
end
