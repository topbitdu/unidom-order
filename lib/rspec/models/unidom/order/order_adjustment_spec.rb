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

    it_behaves_like 'validates', model_attributes, :amount,
      {                             } => 0,
      { amount: nil                 } => 2,
      { amount: ''                  } => 2,
      { amount: '1'                 } => 0,
      { amount: 1                   } => 0,
      { amount: 'A'                 } => 1,
      { amount: '1.23'              } => 0,
      { amount: 1.23                } => 0,
      { amount: '-0.01'             } => 0,
      { amount: -0.01               } => 0,
      { amount: '0'                 } => 0,
      { amount: 0                   } => 0,
      { amount: '0.01'              } => 0,
      { amount: 0.01                } => 0,
      { amount: '999_999_999.99'    } => 0,
      { amount: 999_999_999.99      } => 0,
      { amount: '1_000_000_000'     } => 1,
      { amount: 1_000_000_000       } => 1,
      { amount: '1_000_000_000.01'  } => 1,
      { amount: 1_000_000_000.01    } => 1,
      { amount: '-999_999_999.99'   } => 0,
      { amount: -999_999_999.99     } => 0,
      { amount: '-1_000_000_000'    } => 1,
      { amount: -1_000_000_000      } => 1,
      { amount: '-1_000_000_000.01' } => 1,
      { amount: -1_000_000_000.01   } => 1

    it_behaves_like 'ProgneTapera::EnumCode', described_class.new(model_attributes), :adjustment_factor, Unidom::Order::AdjustmentFactor

  end

end
