module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = t("general.base_title")
    if @title.nil?
      base_title 
    else
      "#{@title}"
    end
  end

  # Return a title on a per-page basis. (visible on page itself)
  def pagetitle
    if @title.nil?
      t("general.newpage_title")
    else
      "#{@title}"
    end
  end

  # display correct metric based on settings
  def metric
    current_user.nil? || current_user.kg? ? " " + t("general.kg", default: "kg") : " " + t("general.lbs", default: "lbs")
  end

  # check if field is required in a model
  def required?(obj, attr)
    target = (obj.class == Class) ? obj : obj.class
    target.validators_on(attr).map(&:class).include?(
      ActiveRecord::Validations::PresenceValidator)
  end

  # create a red start for the default forms
  def redstar(obj, attr)
    '<span class="color-red">*</span>' if required?(obj, attr)
  end

# ApplicationHelperEnd
end
