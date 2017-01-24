describe Unidom::Order::OrderAdjustment, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      adjusted_id:            SecureRandom.uuid,
      adjusted_type:          'Unidom::Order::Adjusted::Mock',
      adjustment_factor_code: Unidom::Order::AdjustmentFactor::DISCOUNT_ADJUSTMENT.code,
      calculation_code:       'AMNT',
      amount:                 10.00
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
