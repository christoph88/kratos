module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = t('general.base_title')
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  # Return a title on a per-page basis. (visible on page itself)
  def pagetitle
    if @title.nil?
      t('general.newpage_title')
    else
      "#{@title}"
    end
  end

# ApplicationHelperEnd
end
