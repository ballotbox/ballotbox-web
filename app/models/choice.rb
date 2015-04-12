class Choice < ActiveRecord::Base
  belongs_to :election
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes

  validates :body, presence: true
end
