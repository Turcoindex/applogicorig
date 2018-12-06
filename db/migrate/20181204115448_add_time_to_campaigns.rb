class AddTimeToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :active, :boolean
    add_column :campaigns, :created_at, :datetime
    add_column :campaigns, :updated_at, :datetime
  end
end
