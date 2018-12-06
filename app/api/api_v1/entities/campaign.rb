# frozen_string_literal: true

module APIv1
    module Entities
      class Campaign < Grape::Entity
  
        expose :code, documentation: { type: 'String' }
        expose :campaign_markets, documentation: { type: CampaignMarket }

      end
    end
  end
  