class Contest < ActiveRecord::Base
  has_many :submissions
  has_many :users, through: :submissions

  validates :name, presence: true
  validates :admin_id, presence: true

  def admin_name
    User.find_by_id(self.admin_id).username
  end
end
