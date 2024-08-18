class UserPresenter < Keynote::Presenter
  presents :user

  def short_name
    user.name
  end
end