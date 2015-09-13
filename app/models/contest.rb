class Contest < ActiveRecord::Base
  has_many :submissions
  has_many :users, through: :submissions

  validates_presence_of :name, :admin_id

  acts_as_votable

  def admin_name
    User.find_by_id(self.admin_id).username
  end

  def tonnage
    self.submissions.sum(:tonnage)
  end

  def contest_type_tr
    I18n.t("contests.contest_type")[self.contest_type]
  end

end
