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

    it_behaves_like 'validates', model_attributes, :unit_price,
      {                                } => 0,
      { unit_price: nil                } => 2,
      { unit_price: ''                 } => 2,
      { unit_price: '1'                } => 0,
      { unit_price: 1                  } => 0,
      { unit_price: 'A'                } => 1,
      { unit_price: '1.23'             } => 0,
      { unit_price: 1.23               } => 0,
      { unit_price: '-0.01'            } => 1,
      { unit_price: -0.01              } => 1,
      { unit_price: '0'                } => 1,
      { unit_price: 0                  } => 1,
      { unit_price: '0.01'             } => 0,
      { unit_price: 0.01               } => 0,
      { unit_price: '999_999_999.99'   } => 0,
      { unit_price: 999_999_999.99     } => 0,
      { unit_price: '1_000_000_000'    } => 1,
      { unit_price: 1_000_000_000      } => 1,
      { unit_price: '1_000_000_000.01' } => 1,
      { unit_price: 1_000_000_000.01   } => 1

    it_behaves_like 'validates', model_attributes, :quantity,
      {                              } => 0,
      { quantity: nil                } => 2,
      { quantity: ''                 } => 2,
      { quantity: '1'                } => 0,
      { quantity: 1                  } => 0,
      { quantity: 'A'                } => 1,
      { quantity: '1.23'             } => 0,
      { quantity: 1.23               } => 0,
      { quantity: '-0.01'            } => 1,
      { quantity: -0.01              } => 1,
      { quantity: '0'                } => 1,
      { quantity: 0                  } => 1,
      { quantity: '0.01'             } => 0,
      { quantity: 0.01               } => 0,
      { quantity: '999_999_999.99'   } => 0,
      { quantity: 999_999_999.99     } => 0,
      { quantity: '1_000_000_000'    } => 1,
      { quantity: 1_000_000_000      } => 1,
      { quantity: '1_000_000_000.01' } => 1,
      { quantity: 1_000_000_000.01   } => 1

    it_behaves_like 'validates', model_attributes, :purchase_amount,
      {                                     } => 0,
      { purchase_amount: nil                } => 2,
      { purchase_amount: ''                 } => 2,
      { purchase_amount: '1'                } => 0,
      { purchase_amount: 1                  } => 0,
      { purchase_amount: 'A'                } => 1,
      { purchase_amount: '1.23'             } => 0,
      { purchase_amount: 1.23               } => 0,
      { purchase_amount: '-0.01'            } => 1,
      { purchase_amount: -0.01              } => 1,
      { purchase_amount: '0'                } => 1,
      { purchase_amount: 0                  } => 1,
      { purchase_amount: '0.01'             } => 0,
      { purchase_amount: 0.01               } => 0,
      { purchase_amount: '999_999_999.99'   } => 0,
      { purchase_amount: 999_999_999.99     } => 0,
      { purchase_amount: '1_000_000_000'    } => 1,
      { purchase_amount: 1_000_000_000      } => 1,
      { purchase_amount: '1_000_000_000.01' } => 1,
      { purchase_amount: 1_000_000_000.01   } => 1

    it_behaves_like 'validates', model_attributes, :subtotal_amount,
      {                                     } => 0,
      { subtotal_amount: nil                } => 2,
      { subtotal_amount: ''                 } => 2,
      { subtotal_amount: '1'                } => 0,
      { subtotal_amount: 1                  } => 0,
      { subtotal_amount: 'A'                } => 1,
      { subtotal_amount: '1.23'             } => 0,
      { subtotal_amount: 1.23               } => 0,
      { subtotal_amount: '-0.01'            } => 1,
      { subtotal_amount: -0.01              } => 1,
      { subtotal_amount: '0'                } => 1,
      { subtotal_amount: 0                  } => 1,
      { subtotal_amount: '0.01'             } => 0,
      { subtotal_amount: 0.01               } => 0,
      { subtotal_amount: '999_999_999.99'   } => 0,
      { subtotal_amount: 999_999_999.99     } => 0,
      { subtotal_amount: '1_000_000_000'    } => 1,
      { subtotal_amount: 1_000_000_000      } => 1,
      { subtotal_amount: '1_000_000_000.01' } => 1,
      { subtotal_amount: 1_000_000_000.01   } => 1

    order_attributes = {
      placer_id:        SecureRandom.uuid,
      placer_type:      'Unidom::Order::Placer::Mock',
      taker_id:         SecureRandom.uuid,
      taker_type:       'Unidom::Order::Taker::Mock',
      number:           '202001019527',
      purchase_amount:  10.00,
      aggregate_amount: 12.00
    }

    it_behaves_like 'belongs_to', model_attributes, :order, Unidom::Order::Order, order_attributes

    it_behaves_like 'monomorphic scope', model_attributes, :order_is, :order

  end

end
