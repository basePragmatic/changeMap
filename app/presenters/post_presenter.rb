class PostPresenter < Keynote::Presenter
  presents :post

  def status_icon
    icon = post.draft? ? "hourglass-start" : "clock"
    content_tag(:i, nil, class: "fa fa-#{icon}")
  end
end