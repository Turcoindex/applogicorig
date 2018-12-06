class CreateCampaignMarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :campaign_markets do |t|
      t.integer :campaign_id
      t.string :ask
      t.string :bid
      t.string :market
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
