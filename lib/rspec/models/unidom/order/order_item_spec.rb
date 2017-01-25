describe Unidom::Order::OrderItem, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      order_id:        SecureRandom.uuid,
      ordered_id:      SecureRandom.uuid,
      ordered_type:    'Unidom::Order::Ordered::Mock',
      placer_id:       SecureRandom.uuid,
      placer_type:     'Unidom::Order::Placer::Mock',
      ordinal:         1,
      unit_price:      10.00,
      quantity:        12.00,
      purchase_amount: 120.00,
      subtotal_amount: 100.00
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
