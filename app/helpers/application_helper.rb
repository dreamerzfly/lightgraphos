module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Clyqe"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def resource_name
    :visitor
  end

  def resource
    @resource ||= Visitor.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:visitor]
  end
end
