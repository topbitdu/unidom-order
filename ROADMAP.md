# Unidom Order Roadmap 订单领域模型引擎路线图

## v0.1
1. Order model & migration (20020601000000)
2. Order Item model & migration (20020602000000)
3. Order Adjustment model & migration (20020603000000)

## v0.2
1. Improve the Order model to include the Model Extension concern
2. Improve the Order Item model to include the Model Extension concern
3. Improved the Order Adjustment model to include the Model Extension concern

## v0.3
1. Improve the Order Item model to add the .``order!`` method
2. Improve the Order Adjustment model to rename the #adjusted_by scope to #adjusted_is
3. Improve the Order Adjustment model to add the .``adjust!`` method
4. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.9

## v1.0
1. Improve the Order Item model to support the Keyword Arguments
2. Improve the Order Adjustment model to support the Keyword Arguments

## v1.0.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.0

## v1.1
1. As Adjusted concern
2. As Order Placer concern
3. As Order Taker concern
4. Improve the Order Adjustment model for the return value of the #``adjust!`` method
5. Improve the Order model to include the As Adjusted concern
6. Improve the Order Item model to include the As Adjusted concern

## v1.2
1. Improve the As Adjusted concern to add the #``is_adjusted!`` method
2. Improve the Order Adjustment model for the .``adjust!`` method

## v1.3
1. Improve the As Adjusted concern to add the #``is_adjusted?`` method

## v1.3.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v1.3.2
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v1.3.3
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7.1

## v1.4
1. Adjustment Factor enum code
2. Improve the Order Adjustment model to configure the Adjustment Factor enum code

## v1.4.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improve the Engine class to include the Engine Extension concern

## v1.4.2
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improve the models to support the namespace neglecting

## v1.5
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v1.5.1
1. Improve the Order spec for the validations on the #``number`` attribute, the #purchase_amount attribute, & the #aggregate_amount attribute
2. Improve the Order Item spec for the validations on the #unit_price attribute, the #quantity attribute, the #purchase_amount attribute, & the #subtotal_amount attribute
3. Improve the Order Adjustment spec for the validations on the #amount attribute, & the #adjustment_factor_code attribute

## v1.5.2
1. Improve the Order spec for the ``has_many :items, class_name: 'Unidom::Order::OrderItem'`` macro
2. Improve the Order Item spec for the ``belongs_to :order, class_name: 'Unidom::Order::Order'`` macro

## v1.5.3
1. Improve the Order Item spec for the ``order_is`` scope
2. Improve the Order Adjustment spec for the ``belongs_to :adjusted, polymorphic: true`` macro

## v1.5.4
1. Improve the Order Adjustment spec for the adjusted_is scope
2. Improve the Order model for the validations on the #purchase_amount attribute, & the #aggregate_amount attribute
3. Improve the Order spec for the validations on the #purchase_amount attribute, & the #aggregate_amount attribute

## v1.5.5
1. Improve the Order Adjustment model for the validations on the #amount attribute
2. Improve the Order Item model for the validations on the #unit_price attribute, the #quantity attribute, the #purchase_amount attribute, & the #subtotal_amount attribute
3. Improve the Order Adjustment spec for the validations on the #amount attribute
4. Improve the Order Item spec for the validations on the #unit_price attribute, the #quantity attribute, the #purchase_amount attribute, & the #subtotal_amount attribute

## v1.5.6
1. Improve the Order Adjustment model for the argument validations of the .adjust! method
2. Improve the Order Adjustment spec for the argument validations of the .adjust! method

## v1.5.7
1. As Order Placer shared examples
2. RSpec shared examples manifest

## v1.5.8
1. As Order Taker shared examples
2. Improve the RSpec shared examples manifest to require the As Order Taker shared examples
