class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :advertiser_name
      t.string :url
      t.string :description, limit: 500
      t.integer :starts_at
      t.integer :ends_at
      t.boolean :premium, default: false     

      t.timestamps
    end
  end
end
