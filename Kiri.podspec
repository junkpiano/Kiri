Pod::Spec.new do |spec|
  spec.name         = 'Kiri'
  spec.version      = '1.0.0'
  spec.license      = { :type => 'BSD' }
  spec.homepage     = 'https://github.com/junkpiano/Kiri'
  spec.authors      = { 'Yusuke Ohashi' => 'github@junkpiano.me' }
  spec.summary      = 'Simple Network Abstraction Layer.'
  spec.source       = { :git => 'https://github.com/junkpiano/Kiri', :tag => spec.version.to_s }
  spec.source_files = 'Sources/**/*.swift'
  spec.dependency "Alamofire", "~> 4.7"
  spec.ios.deployment_target  = '9.0'
end