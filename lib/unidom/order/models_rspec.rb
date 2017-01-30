require 'rspec/models/unidom/order/order_spec'            unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Order::Order'
require 'rspec/models/unidom/order/order_item_spec'       unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Order::OrderItem'
require 'rspec/models/unidom/order/order_adjustment_spec' unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Order::OrderAdjustment'
