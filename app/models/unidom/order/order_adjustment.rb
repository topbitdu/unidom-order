##
# Order Adjustment 是订单调整项。

class Unidom::Order::OrderAdjustment < Unidom::Order::ApplicationRecord

  self.table_name = 'unidom_order_adjustments'

  include Unidom::Common::Concerns::ModelExtension
  include ProgneTapera::EnumCode

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: -1_000_000_000, less_than_or_equal_to: 1_000_000_000 }

  belongs_to :adjusted, polymorphic: true

  scope :adjusted_is, ->(adjusted) { where adjusted: adjusted }

  code :adjustment_factor, Unidom::Order::AdjustmentFactor

  ##
  # 对订单或者订单项 adjusted 进行调整。调整金额为 amount ，缺省为 0 。调整原因是 due_to ，缺省是 FRGT 。调整时间是 opened_at ，缺省为当前时间。如：
  # Unidom::Order::OrderAdjustment.adjust! order, amount: 7.90, due_to: 'LTAX'
  def self.adjust!(adjusted, amount: 0, due_to: 'FRGT', opened_at: Time.now)
    query      = adjusted_is(adjusted).adjustment_factor_coded_as(due_to).valid_at(now: opened_at).alive
    adjustment = query.first
    if adjustment.present?
      if 0==amount
        adjustment.soft_destroy
      else
        adjustment.amount = amount
        adjustment.save!
      end
    else
      adjustment = query.create! amount: amount, opened_at: opened_at
    end
    adjustment
  end

end unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Order::OrderAdjustment'
