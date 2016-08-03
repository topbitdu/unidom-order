# Order Adjustment 是订单调整项。

class Unidom::Order::OrderAdjustment < ActiveRecord::Base

  self.table_name = 'unidom_order_adjustments'

  include Unidom::Common::Concerns::ModelExtension

  validates :amount, presence: true, numericality: { less_than: 1000000000, greater_than: -1000000000 }

  belongs_to :adjusted, polymorphic: true

  scope :adjusted_is, ->(adjusted) { where adjusted: adjusted }

  def self.adjust!(adjusted, amount: 0, due_to: 'FRGT')
    adjustment = self.adjusted_is(adjusted).adjustment_factor_coded_as(due_to).valid_at.alive.first
    if adjustment.present?
      adjustment.amount = amount
      adjustment.save!
    else
      create! adjusted: adjusted, amount: amount, adjustment_factor_code: due_to
    end
  end

end
