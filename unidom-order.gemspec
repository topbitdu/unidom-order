$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'unidom/order/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'unidom-order'
  spec.version     = Unidom::Order::VERSION
  spec.authors     = [ 'Topbit Du' ]
  spec.email       = [ 'topbit.du@gmail.com' ]
  spec.homepage    = 'https://github.com/topbitdu/unidom-order'
  spec.summary     = 'Unidom Order Domain Model Engine 订单领域模型引擎'
  spec.description = 'Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Order domain model engine includes Order, Order Item, and Order Adjustment models. Unidom (统一领域对象模型)是一系列的领域模型引擎。订单领域模型引擎包括订单、订单项和订单调整的模型。'
  spec.license     = 'MIT'

  spec.files         = Dir[ '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md' ]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = [ 'lib' ]

  spec.add_dependency 'unidom-common', '>= 1.0'

end
