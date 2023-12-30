
every 1.day, at: 'midnight' do
  runner "WarrantyReminderMailer.warranty_reminder(Manual.where('assurance = ?', 1.month.since(Date.current)))"
end
