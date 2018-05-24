class UserMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  layout 'mailer'

  def order_confirmation(order)
    @line_items = LineItem.where(order_id: order.id)
    @order = order
    mail(to: order.email, subject: "Thanks for your order \##{order.id}!")
  end
end
