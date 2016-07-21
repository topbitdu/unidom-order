# Unidom Order Roadmap 订单领域模型引擎路线图

## v0.1
1. Order model & migration
2. Order Item model & migration
3. Order Adjustment model & migration

## v0.2
1. Improved the Order model to include the Model Extension concern
2. Improved the Order Item model to include the Model Extension concern
3. Improved the Order Adjustment model to include the Model Extension concern

## v0.3
1. Improve the Order Item model to add the ::order! method
2. Improve the Order Adjustment model to rename the #adjusted_by scope to #adjusted_is
3. Improve the Order Adjustment model to add the ::adjust! method
4. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.9

## v1.0
1. Improve the Order Item model to support the Keyword Arguments
2. Improve the Order Adjustment model to support the Keyword Arguments

## v1.1
1. As Adjusted concern
2. As Order Placer concern
3. As Order Taker concern

## v1.2
1. Improve the As Adjusted concern to add the #adjust! method
2. Improve the As Order Placer concern to add the #place_order! method
3. Improve the As Order Taker concern to add the #take_order! method
