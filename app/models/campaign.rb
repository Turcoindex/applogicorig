class Campaign < ActiveRecord::Base
    has_many :campaign_markets

    scope :active, -> { where(active: true) }   
end