class WordMailer < ApplicationMailer
  def word_mail(word)
    @word = word
    mail to:@word.user.email, subject:"投稿完了通知"
  end
end
