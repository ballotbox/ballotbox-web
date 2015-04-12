class VotesController < ApplicationController
  def create
    @choice = Choice.find(params[:id])
    if params[:type] == "up"
      @choice.votes.create!(user: current_user)
    else
      @choice.votes.find_by_user_id(current_user.id).destroy!
    end
    redirect_to elections_path, notice: "Thank you for voting!"
  end
end
