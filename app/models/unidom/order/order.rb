##
# Order 是订单。

class Unidom::Order::Order < Unidom::Order::ApplicationRecord

  self.table_name = 'unidom_orders'

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Order::Concerns::AsAdjusted

  validates :number,           presence: true, length:       { is: self.columns_hash['number'].limit }
  validates :purchase_amount,  presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1_000_000_000 }
  validates :aggregate_amount, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1_000_000_000 }

  belongs_to :placer, polymorphic: true
  belongs_to :taker,  polymorphic: true

  has_many :items, class_name: 'Unidom::Order::OrderItem'

  scope :placed_by, ->(placer) { where placer: placer }
  scope :taken_by,  ->(taker)  { where taker:  taker  }

end unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Order::Order'
