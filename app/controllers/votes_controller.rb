class VotesController < ApplicationController
  def create
    @choice = Choice.find(params[:choice_id])
    @choice.votes.create!(user: current_user)
    redirect_to elections_path, notice: "Thank you for voting!"
  end

  def destroy
    @vote = current_user.votes.find(params[:id])
    @vote.destroy!
    redirect_to elections_path, notice: "Your vote has been removed!"
  end
end
