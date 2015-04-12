class ElectionsController < ApplicationController
  def index
    @elections = Election.all
  end

  def new
    @election = Election.new
    3.times { @election.choices.build }
  end

  def create
    @election = current_user.created_elections.new(election_params)
    if @election.save
      redirect_to @election
    else
      render :action => 'new'
    end
  end

  def show
    @election = Election.find(params[:id])
  end

  def edit
    @election = Election.find(params[:id])
  end
  
  def update
    @election = Election.find(params[:id])
    if @election.update(election_params)
      redirect_to @election
    else
      render :action => 'edit' 
    end
  end

  def destroy
    @election = Election.id(params[:id])
    @election.destroy
    redirect_to elections_path
  end

  private
  
  def election_params
    params.require(:election).permit(:title, :body, :public, choices_attributes: [:id, :body])
  end
end
