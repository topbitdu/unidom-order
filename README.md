# Unidom Order 订单领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-order.svg)](https://badge.fury.io/rb/unidom-order)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Order domain model engine includes Order, Order Item, and Order Adjustment models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。订单领域模型引擎包括订单、订单项和订单调整的模型。

## Usage in Gemfile
```ruby
gem 'unidom-order'
```

## Run the Database Migration
```shell
rake db:migrate
```

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
```
