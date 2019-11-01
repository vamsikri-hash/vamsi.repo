class CommentMailer < ApplicationMailer

  def send_comment(comment)
    @comment = comment
    mail(:to => "bellamvamsikrishna3415@gmail.com", :subject => "You Have a new Comment on Your Post")
  end
end
