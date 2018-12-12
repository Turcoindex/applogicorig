class AddCampaignTypeToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :campaign_type, :integer, :null => false, :default => 0
  end
end
