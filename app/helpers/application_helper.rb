module ApplicationHelper
  def present(obj, with: nil)
    presenter_class = with || "#{obj.class.name}Presenter".constantize
    presenter_class.new(obj)
  end
end
