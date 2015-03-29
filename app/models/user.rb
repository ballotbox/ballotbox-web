class User < ActiveRecord::Base
  has_many :elections
  has_and_belongs_to_many :choices
end
