module Api::V1
  class ElectionsController < ApiController
    before_action :doorkeeper_authorize!

    def index
      render json: { elections: (Election.not_private + current_resource_owner.created_elections) }
    end

    def show
      e = Election.find(params[:id])
      render json: {
         election: {  title:    e.title,
                      body:     e.body,
                      choices:  e.choices.map do |c|
                        { body: c.body, count: c.votes.count }
                      end }}
    end

    def create
      election = Election.create! do |e|
        e.title      = params[:election][:title]
        e.body       = params[:election][:body]
        e.public     = params[:election][:public]
        e.creator_id = current_resource_owner.id
      end
      params[:election][:choices].each do |c|
        election.choices.create! do |choice|
          choice.body        = c[:body]
          choice.election_id = election.id 
        end
      end
      redirect_to api_v1_election_path(election), status: 201
    end

  end
end