class Choice < ActiveRecord::Base
  belongs_to :election
  has_and_belongs_to_many :voters, class: 'User'

  validates :body, presence: true
end
