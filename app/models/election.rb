class Election < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :choices
  has_many :votes, through: :choices
  has_many :users, through: :votes, source: :user

  accepts_nested_attributes_for :choices, allow_destroy: true
end
