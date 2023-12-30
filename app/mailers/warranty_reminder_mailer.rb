class WarrantyReminderMailer < ApplicationMailer
  def warranty_reminder(manual)
    @manual = manual
    mail(to: @manual.user.email, subject: '商品の保証期限が近づいています')
  end
end
