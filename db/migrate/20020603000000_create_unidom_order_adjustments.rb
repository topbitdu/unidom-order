class CreateUnidomOrderAdjustments < ActiveRecord::Migration

  def change

    create_table :unidom_order_adjustments, id: :uuid do |t|

      t.references :adjusted, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.column :adjustment_factor_code, 'char(4)', null: false, default: 'FRGT'
      t.column :calculation_code,       'char(4)', null: false, default: 'AMNT'

      t.decimal :amount, null: false, default: 0.0, precision: 12, scale: 2

      t.text :instruction
      t.text :description

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Unidom::Common::OPENED_AT
      t.datetime :closed_at,        null: false, default: Unidom::Common::CLOSED_AT
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_order_adjustments, :adjusted_id

  end

end
