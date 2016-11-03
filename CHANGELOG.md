# Unidom Order Change Log 订单领域模型引擎变更日志

## v0.1
1. Order model & migration
2. Order Item model & migration
3. Order Adjustment model & migration

## v0.2
1. Improved the Order model to include the Model Extension concern
2. Improved the Order Item model to include the Model Extension concern
3. Improved the Order Adjustment model to include the Model Extension concern

## v0.3
1. Improved the Order Item model to add the ::order! method
2. Improved the Order Adjustment model to rename the #adjusted_by scope to #adjusted_is
3. Improved the Order Adjustment model to add the ::adjust! method
4. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.9

## v1.0
1. Improved the Order Item model to support the Keyword Arguments
2. Improved the Order Adjustment model to support the Keyword Arguments

## v1.0.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.0

## v1.1
1. As Adjusted concern
2. As Order Placer concern
3. As Order Taker concern
4. Improved the Order Adjustment model to improve the return value of the #adjust! method
5. Improved the Order model to include the As Adjusted concern
6. Improved the Order Item model to include the As Adjusted concern

## v1.2
1. Improved the As Adjusted concern to add the #is_adjusted! method
2. Improved the Order Adjustment model for the ::adjust! method

## v1.3
1. Improved the As Adjusted concern to add the #is_adjusted? method

## v1.3.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6
