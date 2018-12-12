# frozen_string_literal: true

module APIv1
    module Entities
      class Campaign < Grape::Entity
  
        expose :id
        expose :code, documentation: { type: 'String' }
        expose :description, documentation: { type: 'String' }
        expose :name, documentation: { type: 'String' }
        expose :active, documentation: { type: 'Boolean' }
        expose :created_at
        expose :start_date
        expose :end_date
        expose :path, documentation: { type: 'String' }
        expose :campaign_markets, documentation: { type: CampaignMarket }

      end
    end
  end
  