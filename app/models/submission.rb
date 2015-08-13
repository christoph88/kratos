class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :contest

  validates :user_id, presence: true
  validates :reps, presence: true
  validates :weight, presence: true

  before_save :calculate_tonnage

  def user_name
    User.find_by_id(self.user_id).username
  end

  def calculate_tonnage
    self.tonnage = self.weight * self.reps
  end

  def weight_unit
    self.pounds? ? "Lbs." : "Kg."
  end
end
