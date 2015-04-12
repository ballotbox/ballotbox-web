class User < ActiveRecord::Base
  has_many :votes
  has_many :created_elections, class_name: 'Election', foreign_key: 'creator_id'
  has_many :elections, through: :votes

  def vote_for(election)
    votes.joins(:choices).where(choices: { user_id: id })
  end

  def voted_in?(election)
    vote_for(election).present?
  end
end
