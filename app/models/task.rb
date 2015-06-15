class Task < ActiveRecord::Base
  belongs_to :list
  validates :name, presence: true
  validates :date, presence: true
end
