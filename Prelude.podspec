Pod::Spec.new do |spec|
  spec.name             = 'Prelude'
  spec.version          = '3.0.0'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage         = 'https://github.com/robrix/Prelude'
  spec.authors          = { 'Rob Rix' => 'rob.rix@github.com' }
  spec.summary          = 'Swift µframework of simple functional programming tools'
  spec.source           = { :git => 'https://github.com/robrix/Prelude.git', :tag => spec.version.to_s }
  spec.source_files     = 'Prelude/*.swift'
  spec.requires_arc     = true
  spec.ios.deployment_target = "8.0"
  spec.osx.deployment_target = "10.9"
end
