class ElectionsController < ApplicationController
  def index
    @elections = Election.not_private
    @elections += current_user.created_elections if current_user
    @elections.uniq!
  end

  def new
    @election = Election.new
    3.times { @election.choices.build }
  end

  def create
    @election = Election.new(election_params)
    @election.creator_id = current_user.id
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

    # Show election for election owner
    def result
        @election = Election.find(params[:election_id])
        @choices = @election.choices.all
        @choices = @choices.sort {|b,a| a.votes.count <=> b.votes.count}

        gon.choices = {}
        @choices.each do |choice|
            gon.choices[choice.body] = choice.votes.count.to_i
            puts choice.body + ": " + choice.votes.count.to_s
        end
    end
    
  def destroy
    @election = Election.find(params[:id])
    @election.destroy
    redirect_to elections_path
  end

  private
  
  def election_params
    params.require(:election).permit(:title, :body, :public, choices_attributes: [:id, :body])
  end
end
