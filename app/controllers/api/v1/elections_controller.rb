module Api::V1
  class ElectionsController < ApiController
    before_action :doorkeeper_authorize!

    def index
      render json: (Election.not_private + current_resource_owner.created_elections)
    end

    def show
      e = Election.find(params[:id])
      render json: {
            election: { title: e.title,
                        body: e.body,
                        choices: e.choices.map do |c|
                          { body: c.body, count: c.votes.count }
                        end
                      }}
    end
  end
end