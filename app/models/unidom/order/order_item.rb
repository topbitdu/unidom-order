# Order Item 是订单项。

class Unidom::Order::OrderItem < ActiveRecord::Base

  self.table_name = 'unidom_order_items'

  validates :ordinal,         presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 1000000000 }
  validates :unit_price,      presence: true, numericality: { less_than: 1000000000, greater_than: 0 }
  validates :quantity,        presence: true, numericality: { less_than: 1000000000, greater_than: 0 }
  validates :purchase_amount, presence: true, numericality: { less_than: 1000000000, greater_than: 0 }
  validates :subtotal_amount, presence: true, numericality: { less_than: 1000000000, greater_than: 0 }

  belongs_to :order,   class_name:  'Unidom::Order::Order'
  belongs_to :ordered, polymorphic: true
  belongs_to :placer,  polymorphic: true

  has_many :adjustments, class_name: 'Unidom::Order::OrderAdjustment', as: :adjusted

  scope :order_is,   ->(order)   { where order_id: (order.respond_to?(:id) ? order.id : order) }
  scope :ordered_is, ->(ordered) { where ordered: ordered }
  scope :placed_by,  ->(placer)  { where placer:  placer  }

end
