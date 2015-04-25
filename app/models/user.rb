class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation
  has_many :votes, dependent: :destroy
  has_many :created_elections, class_name: 'Election', foreign_key: 'creator_id', dependent: :destroy
  has_many :elections, through: :votes

  def vote_for(election)
    votes.joins(:choices).where(choices: { user_id: id })
  end

  def voted_in?(election)
    vote_for(election).present?
  end
end
