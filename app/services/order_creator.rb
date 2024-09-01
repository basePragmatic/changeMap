class OrderCreator
  def create_order(order)
    if order.save
      CompleteOrderJob.perform_async(order.id)
    end
    order
  end
end