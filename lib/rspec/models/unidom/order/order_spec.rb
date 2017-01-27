describe Unidom::Order::Order, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      placer_id:        SecureRandom.uuid,
      placer_type:      'Unidom::Order::Placer::Mock',
      taker_id:         SecureRandom.uuid,
      taker_type:       'Unidom::Order::Taker::Mock',
      number:           '202001019527',
      purchase_amount:  10.00,
      aggregate_amount: 12.00
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
