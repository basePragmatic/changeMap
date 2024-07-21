class BadgeComponentPreview < ViewComponent::Preview
  def default
    render(BadgeComponent.new) do
      "label"
    end
  end
end