# Unidom Order 订单领域模型引擎

[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/unidom-order/frames)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

[![Gem Version](https://badge.fury.io/rb/unidom-order.svg)](https://badge.fury.io/rb/unidom-order)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/unidom-order.svg)](https://gemnasium.com/github.com/topbitdu/unidom-order)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Order domain model engine includes Order, Order Item, and Order Adjustment models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。订单领域模型引擎包括订单、订单项和订单调整的模型。



## Recent Update

Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.



## Usage in Gemfile

```ruby
gem 'unidom-order'
```



## Run the Database Migration

```shell
rake db:migrate
```
The migration versions start with 200206.



## Call the Model

```ruby
lady = Person.create name: 'Ann'
shop = Shop.create   name: 'WalMart'

order = Unidom::Order::Order.create(placer: lady,
  taker:       shop,
  number:      'ZBCDEFGHIJKL',
  instruction: 'Please mail to me as soon as possible.',
  description: 'gifts for my kids',
  opened_at:   Time.now)

game = Product.create name: 'World War II'
ball = Product.create name: 'Basketball'

order.items.create(ordered: game,
  placer:          lady,
  ordinal:         1,
  unit_price:      19.99,
  quantity:        1,
  purchase_amount: 19.99,
  subtotal_amount: 23.98,
  instruction:     'We need the 2nd version.',
  description:     'video game',
  opened_at:       Time.now)
order.items.create(ordered: ball,
  placer:          lady,
  ordinal:         2,
  unit_price:      35.00,
  quantity:        2,
  purchase_amount: 70.00,
  subtotal_amount: 70.00,
  instruction:     'We need 2 balls.',
  description:     'video game',
  opened_at:       Time.now)

order.adjustments.create(
  adjustment_factor_code: 'FRGT',
  calculation_code:       'AMNT',
  amount:                 5.00,
  instruction:            'arrive in 3 days',
  description:            'freight',
  opened_at:              Time.now)
order.items.first.create(
  adjustment_factor_code: 'TAXF',
  calculation_code:       'PCNT',
  amount:                 15.00,
  instruction:            'tax rate is 15%',
  description:            'tax',
  opened_at:              Time.now)

order.purchase_amount  = order.items.sum('purchase_amount')
order.aggregate_amount = order.items.sum('subtotal_amount')+order.adjustments.sum('amount')
order.save

order = Unidom::Order::Order.where(number: 'ZBCDEFGHIJKL').first
order.items       # Order Items
order.adjustments # Order Adjustments

Unidom::Order::OrderItem.order! product, of: order, unit_price: 1080.00, quantity: 2
# Add the given product into the given order

Unidom::Order::OrderAdjustment.adjust! order, amount: 20, due_to: 'DSCT', opened_at: Time.now
# Add the given adjustment into the given order
```



## Include the Concerns

```ruby
include Unidom::Order::AsAdjusted
include Unidom::Order::AsOrderPlacer
include Unidom::Order::AsOrderTaker
```

### As Adjusted concern

The As Adjusted concern do the following tasks for the includer automatically:

1. Define the has_many :adjustments macro as: ``has_many :adjustments, class_name: 'Unidom::Order::OrderAdjustment', as: :adjusted``

2. Define the #is_adjusted! method as: ``is_adjusted!(amount, due_to: 'FRGT', at: Time.now)``

3. Define the #is_adjusted? method as: ``is_adjusted?(due_to: 'FRGT', at: Time.now)``

### As Order Placer concern

The As Order Placer concern do the following tasks for the includer automatically:

1. Define the has_many :placed_orders macro as: ``has_many :placed_orders, class_name: 'Unidom::Order::Order', as: :placer``

### As Order Taker concern

The As Order Taker concern do the following tasks for the includer automatically:

1. Define the has_many :taken_orders macro as: ``has_many :taken_orders, class_name: 'Unidom::Order::Order', as: :taker``



## Enum codes

### Adjustment Factor enum code 调整因素

```ruby
Unidom::Order::AdjustmentFactor::DISCOUNT_ADJUSTMENT           # 折扣调整
Unidom::Order::AdjustmentFactor::SURCHARGE_ADJUSTMENT          # 额外费调整
Unidom::Order::AdjustmentFactor::SALES_TAX                     # 销售税
Unidom::Order::AdjustmentFactor::SHIPPING_AND_HANDLING_CHARGES # 装运和处理费
Unidom::Order::AdjustmentFactor::FEE                           # 手续费
Unidom::Order::AdjustmentFactor::MISCELLANEOUS_CHARGE          # 杂项收费
```



## Disable the Model & Migration

If you only need the app components other than models, the migrations should be neglected, and the models should not be loaded.
```ruby
# config/initializers/unidom.rb
Unidom::Common.configure do |options|

  options[:neglected_namespaces] = %w{
    Unidom::Order
  }

end
```



## RSpec examples

### RSpec example manifest (run automatically)

```ruby
# spec/models/unidom_spec.rb
require 'unidom/order/models_rspec'

# spec/types/unidom_spec.rb
require 'unidom/order/types_rspec'

# spec/validators/unidom_spec.rb
require 'unidom/order/validators_rspec'
```

### RSpec shared examples (to be integrated)

```ruby
# lib/unidom.rb
Unidom::Party::Person.class_eval do

  include Unidom::Order::Concerns::AsOrderPlacer

end

Unidom::Party::Shop.class_eval do

  include Unidom::Order::Concerns::AsOrderTaker

end

# spec/support/unidom_rspec_shared_examples.rb
require 'unidom/order/rspec_shared_examples'

# spec/models/unidom/party/person_spec.rb
describe Unidom::Party::Person, type: :model do

  it_behaves_like 'Unidom::Order::Concerns::AsOrderPlacer', model_attributes

end

# spec/models/unidom/party/shop_spec.rb
describe Unidom::Party::Shop, type: :model do

  it_behaves_like 'Unidom::Order::Concerns::AsOrderTaker', model_attributes

end
```
