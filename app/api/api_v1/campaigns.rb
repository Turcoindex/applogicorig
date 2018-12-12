module APIv1
    class Campaigns < Grape::API
        helpers APIv1::NamedParams
        # before { authenticate! }

        resource :campaigns do
            # get  do
            #     campaign = Campaign.all
            #     # present campaign,
            #     #     with: APIv1::Entities::Campaign
            # end

            # get ':cid' do
            #     campaign = Campaign.active.find_by(id: params[:cid])
            #     present campaign,
            #          with: APIv1::Entities::Campaign
            # end

            params do
                requires :cid,
                         type: String
            end
            get 'getById' do
                campaign = Campaign.find_by(code: params[:cid])
                present campaign,
                     with: APIv1::Entities::Campaign
            end

            params do
                use :filters
            end
            get 'getCampaigns' do
                limit = params[:limit]
                campaign = Campaign.order("created_at " + params[:order_by]).limit(params[:limit])
                present campaign,
                     with: APIv1::Entities::Campaign
            end
        end
    end
end