class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :votes, dependent: :destroy
  has_many :created_elections, class_name: 'Election', foreign_key: 'creator_id', dependent: :destroy
  has_many :elections, through: :votes

  def vote_for(election)
    election.votes.where(user_id: self.id).first
  end

  def voted_in?(election)
    vote_for(election).present?
  end
end
