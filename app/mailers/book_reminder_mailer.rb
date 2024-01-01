class BookReminderMailer < ApplicationMailer
  def reminder_email(book)
    @book = book
    mail(to: @book.user.email, subject: '本の発売日のお知らせ')
  end
end
