class Contact < ApplicationRecord
  attr_accessor :name, :email, :message

  validate :validate_name_email_message

  private

  def validate_name_email_message
    if self.name.strip == ""
      errors.add(:contact, "Name should not be empty")
    elsif self.message.strip == ""
      errors.add(:contact, "Message can't be empty")
    elsif (!(self.email.match?(/\A[\w.+-]+@\w+\.\w+\z/)) || self.email.strip=="")
      errors.add(:contact,"Invalid email!")
    end
  end
end
