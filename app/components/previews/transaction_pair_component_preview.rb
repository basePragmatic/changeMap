class TransactionPairComponentPreview < ViewComponent::Preview
  def default
    render(TransactionPairComponent.new) do
      "label"
    end
  end
end