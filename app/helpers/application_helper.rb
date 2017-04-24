module ApplicationHelper
  def green_red(list, challenge)
    if !list.include? challenge
      'is-danger'
    else
      'is-success'
    end
  end
end
