class ElectionsController < ApplicationController
    def index
        @elections = Election.all
    end

    def new
        @election = Election.new
        3.times { @election.choices.build }
    end

    def create
        @election = Election.new(election_params)
        @election.creator = current_user.email
        @election.random_id = (0...10).map{65.+(rand(26)).chr}.join
        if @election.save
            redirect_to @election
        else
            render :action => 'new'
        end
    end

    def show
        @election = Election.find_by_random_id(params[:random_id])
    end

    def edit
        @election = Election.find_by_random_id(params[:random_id])
    end
    
    def update
        @election = Election.find_by_random_id(params[:random_id])
        if @election.update(election_params)
            redirect_to @election
        else
            render :action => 'edit' 
        end
    end

    def destroy
        @election = Election.find_by_random_id(params[:random_id])
        @election.destroy
        redirect_to elections_path
    end

    private
    
    def election_params
        params.require(:election).permit(:title, :body, :public, choices_attributes: [:id, :body])
    end
end
