class Goal < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :description
  validates_presence_of :motivation

  has_many :hours
end
