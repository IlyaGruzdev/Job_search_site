module ApplicationHelper
  include Pagy::Frontend

  def nav_tab(title, url, options={})
    current_page = options.delete :current_page
    css_class = current_page == title ? 'text-secondary' : 'text-blue'
    options[:class] = if options[:class]
      options[:class] + ' ' + css_class
    else
        css_class
    end
link_to title, url, options
  end
  def currently_at(current_page='')
    render partial: '/title', locals: { current_page: current_page }
  end
  def full_title(page_title = '')
    base_title = 'JobSearchSite'
    if page_title.present?
      "#{page_title} | #{base_title}"
    else
      base_title
    end
  end
  
end
