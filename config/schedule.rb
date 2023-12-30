
every 1.day, at: 'midnight' do
  runner "Manual.where('assurance = ?', 1.month.since(Date.current)).each { |manual| WarrantyReminderMailer.warranty_reminder(manual).deliver_now }"
end
