class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :choice
  has_one :election, through: :choice
end