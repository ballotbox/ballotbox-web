class Election < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :choices, dependent: :destroy
  has_many :votes, through: :choices
  has_many :users, through: :votes, source: :user

  scope :not_private, -> { where(public: true) }

  accepts_nested_attributes_for :choices, allow_destroy: true
end
