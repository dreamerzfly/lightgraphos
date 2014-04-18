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

=begin
  #helper methods to use form_for througout app to call devise resources
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
=end


  #helper methods to use form_for througout app to call devise resources
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
