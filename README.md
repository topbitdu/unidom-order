# Unidom Order

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Order domain model engine includes Order, Order Item, and Order Adjustment models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。订单领域模型引擎包括订单、订单项和订单调整的模型。

## Usage in Gemfile:
```ruby
gem 'unidom-order'
```

## Run the Database Migration:
```shell
rake db:migrate
```

## Call the Model:
```ruby
order = Unidom::Order::Order.valid_at.alive.first
order.items.valid_at.alive
order.adjustments.valid_at.alive
```
