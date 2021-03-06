class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :contest

  validates_presence_of :user_id, :reps, :weight
  validates_uniqueness_of :tonnage, scope: [:user_id, :contest_id]

  before_validation :calculate_tonnage

  # model helpers
  def calculate_tonnage
    self.tonnage = self.weight * self.reps if weight && reps
  end

  def converted_weight(current_user)
    # The submission model saves in pounds by default
    unless current_user.nil? || current_user.kg
      # weight in pounds
      weight = self.weight
    else
      # weight in kgs
      weight = self.weight * 0.45359237
    end
    
    # drop decimal point if even number
    if weight % 1 == 0
      weight.round
    else
      weight.round(2)
    end
  end

end
