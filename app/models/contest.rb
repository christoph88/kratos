class Contest < ActiveRecord::Base
  has_many :submissions
  has_many :users, through: :submissions

  validates :name, presence: true
  validates :admin_id, presence: true

  acts_as_votable

  def admin_name
    User.find_by_id(self.admin_id).username
  end

  def tonnage
    self.submissions.sum(:weight) * self.submissions.sum(:reps)
  end

end
