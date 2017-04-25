module ApplicationHelper
  def green_red(list, challenge)
    if !list.include? challenge
      'is-danger'
    else
      'is-success'
    end
  end

  def active_page(active_page)
    @active == active_page ? "active" : ""
  end
end
