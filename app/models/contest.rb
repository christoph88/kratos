class Contest < ActiveRecord::Base
  has_many :submissions
  has_many :users, through: :submissions

  validates :name, presence: true
  validates :admin_id, presence: true
end
