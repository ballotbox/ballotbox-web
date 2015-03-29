class User < ActiveRecord::Base
  has_many :votes
  has_many :created_elections, class_name: 'Election', foreign_key: 'creator_id'
  has_many :elections, through: :votes
end
