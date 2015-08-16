class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :contest

  validates_presence_of :user_id, :reps, :weight
  validates_uniqueness_of :tonnage, scope: [:user_id, :contest_id]

  before_validation :calculate_tonnage

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
