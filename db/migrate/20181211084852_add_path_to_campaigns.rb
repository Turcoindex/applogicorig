class AddPathToCampaigns < ActiveRecord::Migration[5.2]
  def change

    add_column :campaigns, :path, :string, :limit => 255
    add_column :campaigns, :end_date, :datetime
    add_column :campaigns, :start_date, :datetime

  end
end
