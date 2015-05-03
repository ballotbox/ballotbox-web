class Choice < ActiveRecord::Base
  belongs_to :election
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes

  validates :body, presence: true

  def vote_for(user)
    votes.where(user_id: user.id).first
  end

  def chosen_by?(user)
    vote_for(user).present?
  end

end
