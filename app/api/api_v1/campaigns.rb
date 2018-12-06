module APIv1
    class Campaigns < Grape::API
        # before { authenticate! }

        resource :campaigns do
            # get  do
            #     campaign = Campaign.all
            #     # present campaign,
            #     #     with: APIv1::Entities::Campaign
            # end

            get ':cid' do
                campaign = Campaign.active.find_by(id: params[:cid])
                present campaign,
                     with: APIv1::Entities::Campaign
            end
        end
    end
end