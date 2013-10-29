class Hour < ActiveRecord::Base
  belongs_to :goal

  validates_presence_of :duration
end
