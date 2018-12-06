class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :code
      t.text :description
      t.string :name
    end
  end
end
