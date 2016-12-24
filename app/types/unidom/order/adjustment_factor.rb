# Adjustment Factor 是调整因素。

class Unidom::Order::AdjustmentFactor < ActiveRecord::Type::Value

  include ProgneTapera::EnumConfig

  enum :unidom_adjustment_factor

end
