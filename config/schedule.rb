
every 1.day, at: 'midnight' do
  runner "Manual.where('assurance = ?', 1.month.since(Date.current)).each { |manual| WarrantyReminderMailer.warranty_reminder(manual).deliver_now }"
end

every 1.day, at: 'midnight' do
  runner "Book.where('release_date = ?', 1.day.since(Date.current)).each { |book| BookReminderMailer.reminder_email(book).deliver_now }"
end