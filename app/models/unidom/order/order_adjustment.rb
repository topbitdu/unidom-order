# Order Adjustment 是订单调整项。

class Unidom::Order::OrderAdjustment < ActiveRecord::Base

  self.table_name = 'unidom_order_adjustments'

  validates :amount, presence: true, numericality: { less_than: 1000000000, greater_than: -1000000000 }

  belongs_to :adjusted, polymorphic: true

  scope :adjusted_by, ->(adjusted) { where adjusted: adjusted }

end
