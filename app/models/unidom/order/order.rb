# Order 是订单。

class Unidom::Order::Order < ActiveRecord::Base

  self.table_name = 'unidom_orders'

  validates :number,           presence: true, length:       { is: self.columns_hash['number'].limit  }
  validates :purchase_amount,  presence: true, numericality: { less_than: 1000000000, greater_than: 0 }
  validates :aggregate_amount, presence: true, numericality: { less_than: 1000000000, greater_than: 0 }

  belongs_to :placer, polymorphic: true
  belongs_to :taker,  polymorphic: true

  has_many :items,       class_name: 'Unidom::Order::OrderItem',       as: :order
  has_many :adjustments, class_name: 'Unidom::Order::OrderAdjustment', as: :adjusted

  scope :placed_by, ->(placer) { where placer: placer }
  scope :taken_by,  ->(taker)  { where taker:  taker  }

end
