class CompleteOrderJob
  include Sidekiq::Job

  def perform(order_id)
    order = Order.find(order_id)
    OrderCreator.new.complete_order(order)
  end

  def complete_order(order)
    payments_response = charge(order)
    if payments_response.success?
      email_response = send_email(order)
      fulfillment_response = request_fulfillment(order)

      order.update!(
        charge_id: payments_response.charge_id,
        charge_completed_at: Time.zone.now,
        charge_successful: true,
        email_id: email_response.email_id,
        fulfillment_request_id: fulfillment_response.request_id
      )
    else
      order.update!(
        charge_completed_at: Time.zone.now,
        charge_successful: false,
        charge_decline_reason: payments_response.explanation
      )
    end
  end

  private

  def charge(order)
    # Реализация метода charge
  end
end