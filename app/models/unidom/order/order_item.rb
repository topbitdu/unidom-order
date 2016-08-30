# Order Item 是订单项。

class Unidom::Order::OrderItem < ActiveRecord::Base

  self.table_name = 'unidom_order_items'

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Order::Concerns::AsAdjusted

  validates :ordinal,         presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 1000000000 }
  validates :unit_price,      presence: true, numericality: { less_than: 1000000000, greater_than: 0 }
  validates :quantity,        presence: true, numericality: { less_than: 1000000000, greater_than: 0 }
  validates :purchase_amount, presence: true, numericality: { less_than: 1000000000, greater_than: 0 }
  validates :subtotal_amount, presence: true, numericality: { less_than: 1000000000, greater_than: 0 }

  belongs_to :order,   class_name:  'Unidom::Order::Order'
  belongs_to :ordered, polymorphic: true
  belongs_to :placer,  polymorphic: true

  scope :order_is,   ->(order)   { where order_id: (order.respond_to?(:id) ? order.id : order) }
  scope :ordered_is, ->(ordered) { where ordered: ordered }
  scope :placed_by,  ->(placer)  { where placer:  placer  }

  def self.order!(ordered, of: nil, by: of.placer, unit_price: 0, quantity: 1)
    item = of.items.ordered_is(ordered).placed_by(by).valid_at.alive.first
    if item.present?
      item.quantity        += quantity
      item.unit_price      =  unit_price
      item.purchase_amount =  item.unit_price*item.quantity
      item.subtotal_amount =  item.purchase_amount+item.adjustments.valid_at.alive.sum(:amount).to_f
      item.save!
    else
      ordinal = 1+of.items.valid_at.alive.maximum(:ordinal).to_i
      of.items.create! ordered: ordered, placer: by, ordinal: ordinal, quantity: quantity, unit_price: unit_price, purchase_amount: unit_price*quantity, subtotal_amount: unit_price*quantity, opened_at: Time.now
    end
  end

end
