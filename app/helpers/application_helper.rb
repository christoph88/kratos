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

  def metric
    current_user.nil? || current_user.kg? ? " " + t("general.kg", default: "kg") : " " + t("general.lbs", default: "lbs")
  end

# ApplicationHelperEnd
end
