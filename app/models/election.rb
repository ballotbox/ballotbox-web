class Election < ActiveRecord::Base
    has_many :choices
    accepts_nested_attributes_for :choices, allow_destroy: true
    validates_uniqueness_of :random_id
end
