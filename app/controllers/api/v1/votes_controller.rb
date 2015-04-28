module Api::V1
  class VotesController < ApiController
    before_action :doorkeeper_authorize!

    def index
      election = current_resource_owner.created_elections.find(params[:election_id])
      render json: { votes: election.votes.map do |v|
        { id: v.id, choice_id: v.choice_id, choice_body: v.choice.body }
      end }
    end

    def create
      vote = Vote.create!(user_id: current_resource_owner.id, choice_id: params[:choice_id])
      render json: { vote: vote }
    end

    def destroy
      vote = current_resource_owner.votes.find(params[:id])
      vote.destroy!
      render json: { vote_id: params[:id] }
    end
  end
end