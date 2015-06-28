class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :contest

  validates :user_id, presence: true

  def user_name
    User.find_by_id(self.user_id).username
  end
end
