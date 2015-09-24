class Contest < ActiveRecord::Base
  has_many :submissions
  has_many :users, through: :submissions
  belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'

  validates_presence_of :name, :admin_id

  acts_as_votable

  def tonnage
    self.submissions.sum(:tonnage)
  end

  def contest_type_tr
    I18n.t("contests.contest_type")[self.contest_type]
  end

  def contest_short_descr
    I18n.t("contests.contest_short_descr")[self.contest_type]
  end

end
